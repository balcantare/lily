\version "2.24.0"

% Better approach: Each sheet uses its own unique variable name
% Sheet 1 uses sheet1StaffSize, Sheet 2 uses sheet2StaffSize, etc.

\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }

  \header {
    title = "Unique Variable Test"
    tagline = ##f
  }

  % Sheet 1: uses sheet1StaffSize = 20
  #(define sheet1StaffSize 20)
  \bookpart {
    \header { piece = "Score 1: sheet1StaffSize = 20" }
    \score {
      \new Staff \relative c' { c4 d e f }
      \layout {
        #(layout-set-staff-size sheet1StaffSize)
      }
    }
  }

  % Sheet 2: uses sheet2StaffSize = 16
  #(define sheet2StaffSize 16)
  \bookpart {
    \header { piece = "Score 2: sheet2StaffSize = 16" }
    \score {
      \new Staff \relative c' { c4 d e f }
      \layout {
        #(layout-set-staff-size sheet2StaffSize)
      }
    }
  }

  % Sheet 3: no variable - use default 24
  \bookpart {
    \header { piece = "Score 3: default 24" }
    \score {
      \new Staff \relative c' { c4 d e f }
      \layout {
        #(layout-set-staff-size 24)
      }
    }
  }
}
