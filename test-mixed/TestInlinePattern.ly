\version "2.24.0"

% Test: Each sheet defines its own variable AND uses it immediately
% before the next sheet can overwrite it

\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }

  \header {
    title = "Inline Pattern Test"
    tagline = ##f
  }

  % Simulate Sheet 1 being included
  #(define sheetStaffSize 20)
  \bookpart {
    \header { piece = "Sheet 1: Should be 20pt" }
    \score {
      \new Staff \relative c' {
        c4 d e f
      }
      \layout {
        %#(display (list "Score 1 sheetStaffSize:" sheetStaffSize))
        #(layout-set-staff-size sheetStaffSize)
      }
    }
  }

  % Simulate Sheet 2 being included
  #(define sheetStaffSize 16)
  \bookpart {
    \header { piece = "Sheet 2: Should be 16pt" }
    \score {
      \new Staff \relative c' {
        g4 a b c
      }
      \layout {
        %#(display (list "Score 2 sheetStaffSize:" sheetStaffSize))
        #(layout-set-staff-size sheetStaffSize)
      }
    }
  }

  % Simulate Sheet 3 - no sheetStaffSize defined
  % What happens? The value from Sheet 2 (16) persists!
  \bookpart {
    \header { piece = "Sheet 3: No define - What size?" }
    \score {
      \new Staff \relative c' {
        e4 f g a
      }
      \layout {
        %#(display (list "Score 3 sheetStaffSize:" (if (defined? 'sheetStaffSize) sheetStaffSize "undefined")))
        #(layout-set-staff-size (if (defined? 'sheetStaffSize) sheetStaffSize 24))
      }
    }
  }
}
