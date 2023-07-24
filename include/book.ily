#(if
  (or (not (defined? 'current-book-staff-size))
      ;(not (equal? current-book-staff-size
      ;             book-staff-size))
      )
  (begin
    (if
      (not (defined? 'book-staff-size))
      (define book-staff-size 24)
    )
    (define current-book-staff-size book-staff-size)
    (set-global-staff-size book-staff-size)
  )
)

includeOnce =
#(define-void-function (filename) (string?)
   (if
    (not (defined? (string->symbol filename)))
    (begin
     (ly:parser-include-string
      (string-concatenate
       (list "\\include \"" filename "\"")))
     (primitive-eval (list 'define (string->symbol filename) #t)))))

\includeOnce "jazzchords.ily"
\includeOnce "jazzextras.ily"
\includeOnce "chordbass.ily"
\includeOnce "gitlog.ily"
\includeOnce "bookDefines.ily"

\paper {
  #(define fonts (book-font 1.2))
  #(define fileCommitDate (commit-date))
  oddFooterMarkup = \markup {
    \column{
    \vspace #0.5
    \fill-line {
      \line { }
      \line {- \hspace #1 \fileCommitDate \hspace #1 -}
      \line {
        #(if (and (defined? 'sheetCopyright)
                  (string? sheetCopyright))
             sheetCopyright
             "")
      }
    }}
  }
  evenFooterMarkup = \oddFooterMarkup
}
\header {
  %  title = \sheetName %\bookTitle
  tagline = ##f
}

%#(display (ly:source-files))

%\tocItem \sheetName