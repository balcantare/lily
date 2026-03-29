\version "2.24.0"
\language "english"

%% Transposition Macro using Quint (Fifth) Space

%% Helper: titlecase a string (capitalize first character)
#(define (string-titlecase str)
  (if (> (string-length str) 0)
      (string-append (string (char-upcase (string-ref str 0))) (substring str 1))
      str))

%% Helper: check if argument is a symbol or a list of symbols
#(define (symbol-or-list? x)
  (or (symbol? x) (list? x)))

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
  (let* ((q (modulo q 13))
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

%% Calculate target pitch using quint space
%% Preserves the octave from sheetTonality
#(define (calc-target-pitch)
  (if (not (and (defined? 'transposeFor) transposeFor))
      #f
      (let* ((sp-val (if (and (defined? 'sheetTonality) sheetTonality) sheetTonality (ly:make-pitch 0 0 0)))
             (sp-oct (ly:pitch-octave sp-val))
             (fp-sym (if (symbol? transposeFor) transposeFor (string->symbol "c")))
             (fp-val (if (ly:pitch? transposeFor) transposeFor (quint->pitch (note->quint fp-sym))))
             (sq (pitch->quint sp-val))
             (fq (pitch->quint fp-val))
             (tq (modulo (- sq fq) 13))
             (os (get-octave-adjustment))
             (bp (quint->pitch tq)))
        (ly:make-pitch (+ sp-oct os) (ly:pitch-notename bp) (ly:pitch-alteration bp)))))

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
        (let ((sp (if (and (defined? 'sheetTonality) sheetTonality) sheetTonality (ly:make-pitch 0 0 0))))
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
