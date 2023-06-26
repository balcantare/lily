#(set-global-staff-size 24)
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
  #(define fileCommitDate (commit-date fileName))
  oddFooterMarkup = \markup {
    \fill-line {
       \line{
        - \hspace #1 \fileCommitDate \hspace #1 -
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}
\header {
  %  title = \sheetName %\bookTitle
  tagline = ##f
}

%#(display (ly:source-files))

%\tocItem \sheetName