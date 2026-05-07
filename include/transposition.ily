\version "2.24.0"
\language "english"

%% Transposition Macro using Quint (Fifth) Space
%%
%% Variables:
%%   sheetTonality - Key the sheet is written in (e.g., c, d, a)
%%   sheetName - Name of the sheet (already defined in book.ily)
%%   book - Book name (set in book file, e.g., "freylax")
%%   transposeFor - Instrument (e.g., bf, ef, a) - optional
%%   bookTransposeTo - Per-book and per-sheet transposition targets
%%
%% Usage in common location (e.g., book file):
%%   bookTransposeTo = #'((freylax . f)              % default for freylax book
%%                       ((freylax . NaneTsocha) . (f . 1)))  % specific sheet with octave
%%
%% The lookup first checks for ((book . sheetName) . target), then falls back to (book . target).
%% This allows per-sheet octave adjustments without affecting other sheets.

%% Helper: titlecase a string (capitalize first character)
#(define (string-titlecase str)
  (if (> (string-length str) 0)
      (string-append (string (char-upcase (string-ref str 0))) (substring str 1))
      str))

%% Helper: check if argument is a symbol or a list of symbols
#(define (symbol-or-list? x)
  (or (symbol? x) (list? x)))

%% Helper: normalize pitch to octave 0 (middle C), preserving notename and alteration
%% This allows sheetTonality = c to work same as sheetTonality = c'
#(define (normalize-pitch-octave p)
  (if (ly:pitch? p)
      (ly:make-pitch 0 (ly:pitch-notename p) (ly:pitch-alteration p))
      p))

%% Map note symbol to quint value
%% Mapping: -6=gf, -5=df, -4=af, -3=ef, -2=bf, -1=f, 0=c, 1=g, 2=d, 3=a, 4=e, 5=b, 6=fs
#(define (note->quint sym)
  (let* ((str (if (symbol? sym) (symbol->string sym) sym))
         (len (string-length str)))
    (cond
      ((= len 1)
       (case (string-ref str 0)
         ((#\c) 0) ((#\g) 1) ((#\d) 2) ((#\a) 3) ((#\e) 4) ((#\b) 5) ((#\f) -1)
         (else 0)))
      ((= len 2)
       (case (string-ref str 0)
         ((#\c)
          (case (string-ref str 1)
            ((#\s) 6) ((#\f) -1) (else 0)))
         ((#\g)
          (case (string-ref str 1)
            ((#\s) 0) ((#\f) -6) (else 1)))
         ((#\d)
          (case (string-ref str 1)
            ((#\s) 2) ((#\f) 1) (else 2)))
         ((#\a)
          (case (string-ref str 1)
            ((#\s) 4) ((#\f) -4) (else 3)))
         ((#\e)
          (case (string-ref str 1)
            ((#\s) 6) ((#\f) -3) (else 4)))
         ((#\b)
          (case (string-ref str 1)
            ((#\s) 6) ((#\f) -2) (else 5)))
         ((#\f)
          (case (string-ref str 1)
            ((#\s) 0) ((#\f) -2) (else -1)))
         (else 0)))
      ((>= len 3)
       (if (string=? (substring str 0 2) "es")
           (let ((base (string-ref str 2)))
             (case base
               ((#\c) -1) ((#\g) -6) ((#\d) 1) ((#\a) -4) ((#\e) -3) ((#\b) -2) ((#\f) -2)
               (else 0)))
           0))
      (else 0))))

%% Map quint value to note name (returns symbol)
#(define (quint->note q)
  (let ((q (cond
             ((< q -6) (modulo (+ q 13) 13))
             ((> q 6) (modulo q 13))
             (else q))))
    (case q
      ((-6) 'gf) ((-5) 'df) ((-4) 'af) ((-3) 'ef) ((-2) 'bf) ((-1) 'f)
      ((0) 'c) ((1) 'g) ((2) 'd) ((3) 'a) ((4) 'e) ((5) 'b) ((6) 'fs)
      (else 'c))))

%% Convert pitch (ly:pitch) to quint value
#(define (pitch->quint p)
  (let* ((notename (ly:pitch-notename p))
         (alteration (ly:pitch-alteration p))
         (qval (case notename
                  ((0) (cond ((= alteration 1/2) 6) ((= alteration -1/2) -1) (else 0)))
                  ((1) (cond ((= alteration 1/2) 0) ((= alteration -1/2) 1) (else 2)))
                  ((2) (cond ((= alteration 1/2) 2) ((= alteration -1/2) 3) (else 4)))
                  ((3) (cond ((= alteration 1/2) 5) ((= alteration -1/2) -2) (else -1)))
                  ((4) (cond ((= alteration 1/2) 6) ((= alteration -1/2) 0) (else 1)))
                  ((5) (cond ((= alteration 1/2) 1) ((= alteration -1/2) 4) (else 3)))
                  ((6) (cond ((= alteration 1/2) 3) ((= alteration -1/2) -2) (else 5)))
                  (else 0))))
    qval))

%% Convert quint value to pitch
#(define (quint->pitch q)
  (let* ((q (cond
             ((< q -6) (modulo (+ q 13) 13))
             ((> q 6) (modulo q 13))
             (else q)))  ; Keep values in -6 to 6 range as-is
         (info (case q
                 ((-6) '(6 . -1/2)) ((-5) '(1 . -1/2)) ((-4) '(5 . -1/2))
                 ((-3) '(2 . -1/2)) ((-2) '(6 . -1/2)) ((-1) '(3 . 0))
                 ((0) '(0 . 0)) ((1) '(4 . 0)) ((2) '(1 . 0))
                 ((3) '(5 . 0)) ((4) '(2 . 0)) ((5) '(6 . 0))
                 ((6) '(1 . 1/2)) (else '(0 . 0))))
         (notename (car info))
         (alteration (cdr info)))
    (ly:make-pitch 0 notename alteration)))

%% Look up octave adjustment for current instrument
%% Uses sheet-local variable: octaveBf, octaveEf, octaveA, octaveF
%% Values: Integer (number of octaves, positive=up, negative=down)
%% Example: octaveBf = 1 (octave up), octaveBf = -1 (octave down)
#(define (get-octave-adjustment)
  (if (not (and (defined? 'transposeFor) transposeFor))
      0
      (let* (
             (p (if (ly:pitch? transposeFor)
                   transposeFor
                   (let* ((sym-str (if (symbol? transposeFor) (symbol->string transposeFor) transposeFor))
                          (qu (note->quint sym-str)))
                     (quint->pitch qu))))
             (pitch-quint (pitch->quint p))
             (qnote (quint->note pitch-quint))
             (var-name (string->symbol (string-append "octave" (string-titlecase (symbol->string qnote)))))
             )
        (if (defined? var-name)
            (let ((val (eval var-name (current-module))))
              (cond ((boolean? val) (if val -1 0))
                    ((integer? val) val)
                    (else 0)))
            0))))

%% Look up (target-key . octave-adjustment) for current sheet/book in bookTransposeTo alist
%% Returns (pitch . octave-adjustment) pair, or #f if not found
%% Priority: 1) (book . sheetName) entry (per-sheet), 2) book entry (book-level default)
%% Usage in sheet: bookTransposeTo = #'(((freylax . NaneTsocha) . (f . 1))  % specific sheet
%%                                   (freylax . g))                      % default for book
%% Usage in book: book = "freylax"
#(define (lookup-transpose-to)
  "Look up (target-key . octave-adjustment) for current sheet/book.
   First checks for (book . sheetName) entry, then falls back to book entry.
   Returns (pitch . octave-adjustment) pair, or #f if not found."
  (and (defined? 'bookTransposeTo)
       (let* ((book-sym (if (and (defined? 'book) (string? book))
                            (string->symbol book)
                            #f))
              (sheet-sym (if (and (defined? 'sheetName) (string? sheetName))
                             (string->symbol sheetName)
                             #f))
              ;; Try (book . sheetName) first
              (specific-key (and book-sym sheet-sym (cons book-sym sheet-sym)))
              (result (and specific-key (assoc specific-key bookTransposeTo))))
         (if result
             ;; Found specific (book . sheetName) entry
             (let ((value (cdr result)))
               (cond
                ((and (pair? value) (not (symbol? value)) (not (ly:pitch? value)))
                 (cons (if (ly:pitch? (car value))
                           (car value)
                           (quint->pitch (note->quint (car value))))
                       (cdr value)))
                (else
                 (cons (if (ly:pitch? value) value (quint->pitch (note->quint value))) 0))))
             ;; Fall back to book entry
             (and book-sym
                  (let ((book-result (assoc book-sym bookTransposeTo)))
                    (and book-result
                         (let ((value (cdr book-result)))
                           (cond
                            ((and (pair? value) (not (symbol? value)) (not (ly:pitch? value)))
                             (cons (if (ly:pitch? (car value))
                                       (car value)
                                       (quint->pitch (note->quint (car value))))
                                   (cdr value)))
                            (else
                             (cons (if (ly:pitch? value) value (quint->pitch (note->quint value))) 0))))))))))))

%% Legacy name for backward compatibility
#(define lookup-book-transpose-to lookup-transpose-to)

%% Get octave adjustment from transpose lookup
#(define (get-book-octave-adjustment)
  "Get octave adjustment from transpose lookup."
  (let ((lookup (lookup-transpose-to)))
    (if lookup (cdr lookup) 0)))

%% Calculate target pitch using quint space
%% Now uses book's concert key (from bookTransposeTo) as basis for instrument transposition
%% Flow: sheetTonality -> (optional) bookTransposeTo concert key -> instrument transposition
%% If no bookTransposeTo and no transposeFor, returns #f (no transposition)
#(define (calc-target-pitch)
  (let* (;; Step 1: Get book's target concert key (or fall back to sheetTonality)
         (book-lookup (lookup-book-transpose-to))
         (book-concert-pitch (if book-lookup
                                (car book-lookup)
                                #f))
         ;; Step 2: Determine if we should transpose
         (has-book-key (and book-lookup book-concert-pitch))
         (has-instrument (and (defined? 'transposeFor) transposeFor)))
    (cond
     ;; No book key and no instrument: no transposition
     ((and (not has-book-key) (not has-instrument))
      #f)
     ;; Have book key but no instrument: transpose to book's concert key
     ((and has-book-key (not has-instrument))
      (let* ((sp (normalize-pitch-octave
                  (if (and (defined? 'sheetTonality) sheetTonality)
                      sheetTonality
                      (ly:make-pitch 0 0 0))))
             (book-octave (ly:pitch-octave book-concert-pitch))
             (book-oct-adjust (get-book-octave-adjustment))
             (os (+ book-octave book-oct-adjust)))
        (ly:make-pitch os
                       (ly:pitch-notename book-concert-pitch)
                       (ly:pitch-alteration book-concert-pitch))))
     ;; Have instrument (with or without book key): calculate target
     (else
      (let* ((base-pitch (if has-book-key
                             book-concert-pitch
                             (normalize-pitch-octave
                              (if (and (defined? 'sheetTonality) sheetTonality)
                                  sheetTonality
                                  (ly:make-pitch 0 0 0)))))
             (base-octave (ly:pitch-octave base-pitch))
             (fp-sym (if (symbol? transposeFor) transposeFor (string->symbol "c")))
             (fp-val (if (ly:pitch? transposeFor)
                         transposeFor
                         (quint->pitch (note->quint fp-sym))))
             (bq (pitch->quint base-pitch))
             (fq (pitch->quint fp-val))
             (tq (modulo (- bq fq) 13))
             (book-oct-adjust (get-book-octave-adjustment))
             (inst-oct-adjust (get-octave-adjustment))
             (os (+ base-octave book-oct-adjust inst-oct-adjust))
             (bp (quint->pitch tq)))
        (ly:make-pitch os (ly:pitch-notename bp) (ly:pitch-alteration bp)))))))

%% Main transposition function
%% Usage: \doTranspose \music
%% Octave adjustment is automatic via sheet-local variables:
%%   octaveBf = 1  (B-flat: octave up), octaveBf = -1 (B-flat: octave down)
%%   octaveEf = -1 (E-flat: up), octaveEf = 1 (down)
%%   octaveA = 2   (A: up 2)
doTranspose =
#(define-music-function (music) (ly:music?)
  (let ((tgt (calc-target-pitch)))
    (if tgt
        (let ((sp (normalize-pitch-octave (if (and (defined? 'sheetTonality) sheetTonality) sheetTonality (ly:make-pitch 0 0 0)))))
          #{ \transpose #sp #tgt #music #})
        music)))

%% Conditional based on transposeFor value
%% Matches regardless of octave adjustment (e.g., bf with octaveBf=1 still matches #'bf)
%% Usage: \ifTransposeFor #'(bf es) { then-music } { else-music }
%% Or for single instrument: \ifTransposeFor #'bf { then-music } { else-music }
ifTransposeFor = #(define-music-function (instruments then-music else-music)
                    (symbol-or-list? ly:music? ly:music?)
  (let* ((targets (if (list? instruments) instruments (list instruments)))
         (current (if (and (defined? 'transposeFor) transposeFor)
                      (if (ly:pitch? transposeFor)
                          (let ((q (pitch->quint transposeFor)))
                            (quint->note q))
                          (if (symbol? transposeFor)
                              transposeFor
                              (string->symbol transposeFor)))
                      #f)))
    (if (and current (memq current targets))
        then-music
        else-music)))
