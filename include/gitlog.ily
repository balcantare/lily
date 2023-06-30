\version "2.19.82"
#(use-modules (ice-9 popen))
#(use-modules (ice-9 rdelim))


#(define comml    (object->string (command-line)))
#(define loc      (+ (string-rindex comml #\space ) 2))
#(define commllen (- (string-length comml) 2))
#(define filen    (substring comml loc commllen))
#(define filedir  (dirname filen))
#(define filebn   (basename filen))

#(define commitDate
  (let* ((port (open-input-pipe
                 (string-join
                  (list
                    ;;"export LD_LIBRARY_PATH=/lib64:$LD_LIBRARY_PATH &&"
                    "cd" filedir "&&"
                    ;;"git rev-parse --quiet --is-inside-work-tree >/dev/null 2>&1"
                    ;;"&&"
                    "git"
                    "log -n 1"
                    "--pretty=format:%cd --date=format:\"%d.%m.%Y\""
                    "--quiet"
                    "--" filebn
                    "2>/dev/null")
                  " ")))
         (str  (read-delimited "" port)))
   (close-pipe port)
   (if (eof-object? str) "" str)))

#(define commit-date
   (lambda ()
     (let* ((filename (if (defined? 'sheet-filename)
                          sheet-filename
                          filebn))
             (port (open-input-pipe
                   (string-join
                    (list
                      "cd" filedir "&&"
                      "git"
                      "log -n 1"
                      "--pretty=format:%cd --date=format:\"%d.%m.%Y\""
                      "--quiet"
                      "--" filename
                      "2>/dev/null")
                    " ")))
           (str  (read-delimited "" port))
           )
       (close-pipe port)
       (if (eof-object? str) "~" str))
     )
   )
%#result

%{
#(define-markup-command (commitDate layout props) ()
   (let* ((result (string-split
                   (commitDate_internal)
                   #\newline)))
       (interpret-markup layout props
         #{ \markup \column #result #})))

%}