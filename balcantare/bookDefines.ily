\language "english"

#(define-markup-command (arrow layout props) ()
   "Draw an Arrow."
   (interpret-markup layout props
     #{\markup \overlay {
        \override #'(thickness . 3)
        \translate #'( 0 . 1.82)\draw-line #'(-1.5 . 0)
        \translate #'( 1.3 . 1.8)\arrow-head #X #RIGHT ##f
        }
     #}
    ))

% parentheses
startParenthesis = {
  \once \override ParenthesesItem.stencils = #(lambda (grob)
        (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
          (list (car par-list) point-stencil )))
}

endParenthesis = {
  \once \override ParenthesesItem.stencils = #(lambda (grob)
        (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
          (list point-stencil (cadr par-list))))
}




\paper {

  #(define-public (book-font font-factor)
     (set-global-fonts
      #:music "lilyjazz"
      #:brace "lilyjazz"
      ;;#:roman "lilyjazz-text"
      #:sans "lilyjazz-chord"
      #:factor font-factor ;;%(/ staff-height pt font-factor)
     )
  )

  #(define fonts (book-font 1.2))

 %#(define fonts
  %  (set-global-fonts
  %  #:music "lilyjazz"
  %  #:brace "lilyjazz"
  %  ;;#:roman "lilyjazz-text"
  %  #:sans "lilyjazz-chord"
  %  #:factor (/ staff-height pt 24)
  %))
  #(set-paper-size "a4")
  indent = 0\mm
  %between-system-space = 3\cm
  %between-system-padding = #2
  %%set to ##t if your score is less than one page:
  %ragged-last-bottom = ##t
  %ragged-bottom = ##f
  %page-count = #1
  %markup-system-spacing = #'((basic-distance . 12)
  %                           (minimum-distance . 3)
  %                           (padding . 8))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  %oddFooterMarkup = \markup {
  %  \fill-line {
 %     \on-the-fly \print-page-number-check-first
  %    \line{
  %      - \hspace #1 \commitDate \hspace #1 -
  %    }
  %  }
  %}
  %evenFooterMarkup = \oddFooterMarkup
}

\layout {
  \context {
    \Lyrics
    \override LyricText #'font-size = #+2
  }
}

