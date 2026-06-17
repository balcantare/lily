\version "2.24.0"

includeOnce =
#(define-void-function (filename) (string?)
   (if
    (not (defined? (string->symbol filename)))
    (begin
     (ly:parser-include-string
      (string-concatenate
       (list "\\include \"" filename "\"")))
     (primitive-eval (list 'define (string->symbol filename) #t)))))

%% Detect the directory of this file (book.ily) to include sibling files
%% This allows book.ily to be included from anywhere in the project
#(define *book-ily-dir*
  (let* ((loc (*location*))
         (file-info (ly:input-file-line-char-column loc))
         (file-path (and (pair? file-info) (car file-info))))
    (if (and file-path (string? file-path))
        (dirname file-path)
        "include")))

%% Helper function to include files from the same directory as book.ily
%% Uses includeOnce mechanism to prevent duplicate includes
#(define (include-from-here filename)
  (if (not (defined? (string->symbol filename)))
      (begin
       (ly:parser-include-string
        (string-concatenate (list "\\include \"" *book-ily-dir* "/" filename "\"")))
       (primitive-eval (list 'define (string->symbol filename) #t)))))

%% Include sibling files from the same directory as book.ily
#(include-from-here "jazzchords.ily")
#(include-from-here "jazzextras.ily")
#(include-from-here "chordbass.ily")
#(include-from-here "gitlog.ily")
#(include-from-here "bookDefines.ily")
#(include-from-here "transposition.ily")
#(include-from-here "cornerTab.ily")

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

%#(display (ly:source-files()))

%\tocItem \sheetName
