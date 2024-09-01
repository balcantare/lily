\version "2.24.0"
sheetCopyright = "©friedensingen.de"
\include "../include/book.ily"

\bookpart {
  \paper{
    tocTitleMarkup = \markup \huge \column {
      \fill-line { \null "Inhalt" \null }
      \hspace #1
    }
  }
  \header {
    title = ##f
    composer = ##f
    arranger = ##f
    tagline = ##f
    subtitle = ##f
  }
  \markup {
    \fill-line {
      \override #'(baseline-skip . 4)
      \center-column {
        	\line { \abs-fontsize #26 "Noten der"}
	\vspace #1.5
	\line { \abs-fontsize #26 "Straßenmusik"}
	\vspace #1.5
	\line { \abs-fontsize #26 "für den Frieden"}
	\vspace #0.5
        \line { \abs-fontsize #14 "Teil I, 24pt"}
        \line { \abs-fontsize #14 "friedensingen.de"}
        \vspace #4
      }
    }
  }
  \markuplist \table-of-contents
}

\includeSheet "../bwchor/AmaniLeo.ly"   % 2
\includeSheet "DasWeicheWasserBm.ly"      % 3
\includeSheet "DerEinfacheFrieden.ly"
\includeSheet "DerPfahl.ly"             % 4
\includeSheet "DieErdeIstUnsereMutter.ly" % 5
\includeSheet "../balcantare/HappyXMas.ly"
\includeSheet "HeuteUndHier.ly"           % 6
\includeSheet "HevenuSchalomAlechem.ly"   % 7
\includeSheet "../bwchor/HinehMatov.ly"   % 8
\includeSheet "LasstUnsFriedenSchaffen.ly" % 9
\includeSheet "../bwchor/NgaIwiE.ly"       % 10
\includeSheet "../bwchor/OdYavoShalomAleinu.ly" % 11
\includeSheet "PlanetDesFriedens.ly"
\includeSheet "SagMirWoDieBlumenSind.ly" % 12
\includeSheet "../bwchor/SolangeUnsreLiederKlingen.ly" % 13
\includeSheet "UnserKreisDerSeiOffen.ly"
\includeSheet "UnsreHeimat.ly"
\includeSheet "UnterDemPflaster.ly"
\includeSheet "WeShallOvercome.ly"                % 14
\includeSheet "WerMoechteNichtImLebenBleiben.ly"  % 15
\includeSheet "WirSindEins.ly"
\includeSheet "WirTragenEinLichtInDieDunkelheit.ly"
\includeSheet "../bwchor/WoMenschenSichVergessen.ly"
\includeSheet "ZogenEinstFuenfWildeSchwaene.ly"   % 16
