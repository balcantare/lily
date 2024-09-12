\version "2.24.0"
\include "../include/book.ily"

\bookpart {
  \paper{
    %% Übersetzung der Inhaltsverzeichnisüberschrift nach französisch:
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
  \markup { \fill-line { \center-column {
	  \line {\abs-fontsize #20 "Balcantare Liederbuch"}
	  \null
	} } }
  \markuplist \table-of-contents

}

\includeSheet "../bwchor/BuntSindSchonDieWaelder.ly"
\includeSheet "LesChampsElysees.ly"
\includeSheet "../bwchor/CuecaBoliviana.ly"
\includeSheet "../frchor/DieErdeIstUnsereMutter.ly"
%\includeSheet "../balcantare/DisLeurQueLonSaime.ly"
%\includeSheet "../bwchor/EinHochAufDasLeben.ly"
\includeSheet "../bwchor/EPoiTaiTai.ly"
%\includeSheet "../bwchor/HinehMatov.ly"
\includeSheet "../frchor/HeuteUndHier.ly"
\includeSheet "../frchor/HevenuSchalomAlechem.ly"
\includeSheet "../bwchor/HomeIsWhereMyHeartIs.ly"
\includeSheet "../bwchor/IchWuenscheDirMusik.ly"
%\includeSheet "../bwchor/KamperTrinklied.ly"
\includeSheet "../bwchor/KeineKleider.ly"
\includeSheet "../bwchor/KeinSchoenerLand.ly"
\includeSheet "../bwchor/Landlied.ly"
\includeSheet "../bwchor/MateAroha.ly"
\includeSheet "../bwchor/MoegeDieStrasse.ly"
\includeSheet "../bwchor/NgaIwiE.ly"
\includeSheet "../bwchor/OdYavoShalomAleinu.ly"
\includeSheet "../frchor/UnterDemPflaster.ly"
\includeSheet "../bwchor/WasAuchGeschieht.ly"
\includeSheet "../bwchor/WasWollenWirTrinken.ly"
\includeSheet "../frchor/WeShallOvercome.ly"
\includeSheet "../bwchor/WoMenschenSichVergessen.ly"
\includeSheet "../frchor/ZogenEinstFuenfWildeSchwaene.ly"
% \includeSheet "TumBalalaike.ly"
