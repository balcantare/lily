%% Toplevel initialisation file.
%%
%% If this file is used as initialisation file
%% then each lilypond run will write the dependency
%% file $(output).dly
%% this will work if one pdf is produced
%%
%% the code was inspired by the work of Fr. Samuel
%% https://github.com/rpspringuel/lilypond_make/blob/mad-scientist_dependencies/with-deps.ly

\version "2.22.2"

\include "init.ly"

% Do not include this file (with-deps.ly) or init.ly in
% the list of prerequisite files (cdr (cdr ..)).
% filter out '<included string>' and remove duplicates

#(define prerequisite-files
   (delete-duplicates
     (remove
       (lambda (str)
         (or
	   (string-contains str (ly:get-option 'datadir))
           (string=? str "<included string>")
	 )
       )
       (cdr (cdr (ly:source-files)))
     )
   )
 )

#(define target-files (list (string-append (ly:parser-output-name) ".pdf")))

dlyport = #(open-file (string-append (ly:parser-output-name) ".dly") "w")

% Target list
#(format dlyport "~{~a~_~^~}:~_" target-files)
% Prerequisite list
#(format dlyport "~{~a~_~^~}~%" prerequisite-files)

#(close-output-port dlyport)