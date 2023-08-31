\version "2.24.0"


#(define (define-translator-property symbol type? description)
  (if (not (and (symbol? symbol)
	            (procedure? type?)
	            (string? description)))
      (ly:error "error in call of define-translator-property"))
  (if (not (equal? (object-property symbol 'translation-doc) #f))
      (ly:error (_ "symbol ~S redefined") symbol))

  (set-object-property! symbol 'translation-type? type?)
  (set-object-property! symbol 'translation-doc description)
  symbol)

#(for-each
  (lambda (x)
    (apply define-translator-property x))
    `((chordBassOnly ,boolean? "DOCME")
      ;; others
    ))

\layout {
  \context {
    \Score
    chordNameFunction =
      #(lambda (in-pitches bass inversion context)
         (let* ((slash-shord-separator
                  (ly:context-property context 'slashChordSeparator))
                (chord-root-namer (ly:context-property context 'chordRootNamer))
                (chord-note-namer
                  (ly:context-property context 'chordNoteNamer #f))
                (chord-name-lowercase-minor
                  (ly:context-property context 'chordNameLowercaseMinor))
                (chord-name-function
                  (ly:context-property context 'chordNameFunction))
                (chord-bass-only?
                  (ly:context-property context 'chordBassOnly #f))
                (bass-markup
                  (lambda (pitch)
                    (make-line-markup
                      (list
                        slash-shord-separator
                        ((or chord-note-namer chord-root-namer)
                         pitch
                         chord-name-lowercase-minor))))))
           (cond ((and chord-bass-only? (ly:pitch? bass))
                   (bass-markup bass))
                 ((and chord-bass-only? (ly:pitch? inversion))
                   (bass-markup inversion))
                 (else
                   (ignatzek-chord-names in-pitches bass inversion context)))))
  }
}

%{\new ChordNames
  \chordmode {
    b:m5-.7/fis
    \set chordBassOnly = ##t
    b:m5-.7/fis
  %}