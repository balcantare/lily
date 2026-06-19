\version "2.24.0"

#(use-modules (srfi srfi-1) (srfi srfi-14))

% Split a title into whitespace-separated words, dropping empty strings.
#(define (title-words str)
   (delete "" (string-split str char-set:whitespace)))

% Build the corner-tab prefix from a title string:
%   * one word           -> first 3 chars of that word
%   * first word is a single letter (e.g. "A Day ...") -> that letter + dot + first 3 chars of word 2
%   * otherwise          -> first 2 chars of word 1, middle dot, first 2 chars of word 2
% Non-string/empty -> "".
#(define (title->prefix str)
   (if (not (string? str))
       ""
       (let* ((words (title-words str))
              (nw   (length words))
              (take3 (lambda (w) (substring w 0 (min 3 (string-length w))))))
         (cond
          ((= nw 0) "")
          ((= nw 1) (take3 (car words)))
          ((= 1 (string-length (car words)))
           ;; first word is a single letter: that letter + dot + 3 of word 2
           (string-append
            (car words)
            (string (integer->char #xb7))
            (take3 (cadr words))))
          (else
           (string-append
            (substring (car words) 0 (min 2 (string-length (car words))))
            (string (integer->char #xb7))            ; middle dot, U+00B7
            (substring (cadr words) 0 (min 2 (string-length (cadr words))))))))))

% \cornerTab - read the current bookpart's title from the page props,
% build the prefix, and render it inside a fixed-size L-corner (thick line
% on the left and on the bottom).  The L is the SAME size for every tab;
% the prefix text is centered within it.  Returns an empty stencil when
% there is no usable title (e.g. the TOC/cover bookpart, title = ##f).
% The tab is pushed into the physical top-right corner of the paper by
% translating its ink outward, while keeping the stencil's reported extents
% unchanged so \fill-line still right-aligns the logical box.
#(define (paper-margin layout sym)
   (let ((v (ly:output-def-lookup layout sym #f)))
     (if (number? v) v 0)))

#(define-markup-command (cornerTab layout props) ()
  "Draw the alphabetical corner tab from the bookpart title."
  (let* ((title-raw (chain-assoc-get 'header:title props #f))
         (prefix    (title->prefix title-raw)))
    (if (or (not (string? prefix)) (string-null? prefix))
        empty-stencil
        (let* (;; --- tunable layout constants ---
               (fontsize   5)     ; letter size
               (box-w      15.0)  ; fixed outer width  of the L (same for all tabs)
               (box-h      5.5)   ; fixed outer height of the L
               (line-thick 0.4)
               ;; --- build the text stencil ---
               (txt-stil (interpret-markup layout props
                           (markup #:bold #:fontsize fontsize prefix)))
               (xex (ly:stencil-extent txt-stil X))
               (yex (ly:stencil-extent txt-stil Y))
               (tcx (/ (+ (car xex) (cdr xex)) 2))   ; text center x
               (tcy (/ (+ (car yex) (cdr yex)) 2))   ; text center y
               ;; --- fixed box, local coords: x in [0, box-w], y in [-box-h, 0]
               ;;     (top-left at (0,0); the box hangs down-right from the corner)
               (target-cx (/ box-w 2))
               (target-cy (- (/ box-h 2)))
               (txt-placed (ly:stencil-translate
                             txt-stil
                             (cons (- target-cx tcx) (- target-cy tcy))))
               (vline (make-line-stencil line-thick 0 0 0 (- box-h)))           ; left
               (hline (make-line-stencil line-thick 0 (- box-h) box-w (- box-h))); bottom
               (tab-stil (ly:stencil-add (ly:stencil-add vline hline) txt-placed))
               ;; --- push into the paper corner, then inset by the printer's
               ;;     non-printable margin so the full L is visible at 100%.
               ;;     Values in staff-spaces (~1.75mm each here).  Derived from
               ;;     the clipped measurements: full_length - visible
               ;;     (right ~5.4mm -> 3.0ss, top ~4.6mm -> 2.6ss).  Tune to taste.
               (rm (paper-margin layout 'right-margin))
               (tm (paper-margin layout 'top-margin))
               (inset-right 3.0)   ; move left  (~5.3mm)
               (inset-top   2.6)   ; move down  (~4.6mm)
               (shifted (ly:stencil-translate tab-stil
                          (cons (- rm inset-right) (- tm inset-top)))))
          ;; Report zero Y extent so the header does not reserve vertical
          ;; space for the tab (the title stays at its original position);
          ;; the ink still renders in the corner via the shift above.
          (ly:make-stencil (ly:stencil-expr shifted)
                           (ly:stencil-extent tab-stil X)
                           (cons 0 0))))))

\paper {
  oddHeaderMarkup = \markup { \fill-line { \null \cornerTab } }
  evenHeaderMarkup = \oddHeaderMarkup
}
