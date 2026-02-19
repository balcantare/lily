\version "2.24.0"

% Test: What happens when multiple sheets define sheetStaffSize?

\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }

  \header {
    title = "Variable Scope Test"
    tagline = ##f
  }

  % Sheet 1: defines sheetStaffSize = 20
  #(define sheetStaffSize 20)
  \bookpart {
    \header { piece = "Score 1: sheetStaffSize = 20" }
    \score {
      \new Staff \relative c' { c4 d e f }
      \layout {
        #(layout-set-staff-size (if (defined? 'sheetStaffSize) sheetStaffSize 24))
      }
    }
  }

  % Sheet 2: defines sheetStaffSize = 16
  #(define sheetStaffSize 16)
  \bookpart {
    \header { piece = "Score 2: sheetStaffSize = 16" }
    \score {
      \new Staff \relative c' { c4 d e f }
      \layout {
        #(layout-set-staff-size (if (defined? 'sheetStaffSize) sheetStaffSize 24))
      }
    }
  }

  % Sheet 3: does NOT define sheetStaffSize
  % What value does it see? 16 from previous, 24 default, or error?
  \bookpart {
    \header { piece = "Score 3: no sheetStaffSize defined" }
    \score {
      \new Staff \relative c' { c4 d e f }
      \layout {
        #(layout-set-staff-size (if (defined? 'sheetStaffSize) sheetStaffSize 24))
      }
    }
  }
}
