\version "2.24.2"
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
	  \line {\abs-fontsize #20 "Balcantare Konzert"}
	  \null
	} } }
  \markuplist \table-of-contents

}

book= "balcantare"
\includeSheet "AiMoridschej.ly"
\includeSheet "AjDevlaleKojOdi.ly"
\includeSheet "AndroVerdan.ly"
\includeSheet "Ederlezi.ly"
\includeSheet "AvenNashasTusa.ly"
\includeSheet "OpaCupaDm.ly"
\includeSheet "LjubljuZiganaJana.ly"
\includeSheet "AiDaNjaeBudjitje.ly"
\includeSheet "Rutschejok.ly"
\includeSheet "Nastenka.ly"
\includeSheet "NaneTsocha.ly"
\includeSheet "KerenSchaworaleDrom.ly"
\includeSheet "SchukaHisOZiro.ly"
\includeSheet "ForSephora.ly"
\includeSheet "DorogojDlinnoyu.ly"
\includeSheet "Werila.ly"
\includeSheet "Valenki.ly"
\includeSheet "../bwchor/LisomLisom.ly"
\includeSheet "BeljevinaZemljaFina.ly"
\includeSheet "XekinaiSamiotissa.ly"
\includeSheet "JovanoJovanke.ly"
\includeSheet "CrvenFesic.ly"
\includeSheet "AjdeJano.ly"
\includeSheet "DoluNaPtschelina.ly"

% \includeSheet "AndoAnTriskell.ly"
% \includeSheet "AvecQueLaMarmotte.ly"
% \includeSheet "Biserka.ly"
% \includeSheet "CineAPusCarciumaNDrum.ly"
% \includeSheet "CsardasReinhard.ly"
% \includeSheet "CrvenFesic.ly"
% \includeSheet "DanserEncore.ly"
% \includeSheet "Democratie.ly"
% \includeSheet "DisLeurQueLonSaime.ly"
% \includeSheet "DisLeurQueLonSaimeDt.ly"
% \includeSheet "DjelemDjelem.ly"
% \includeSheet "DjindjiRindjiBubamaro.ly"
% \includeSheet "DereGelior.ly"
% \includeSheet "Devojko.ly"
% \includeSheet "DvaDubi.ly"
% \includeSheet "EchJablotschka.ly"
% \includeSheet "../bwchor/EinHochAufDasLeben.ly"
% \includeSheet "FairfieldFancy.ly"
% \includeSheet "FontaineLaJolie.ly"
% \includeSheet "FroehlicherKreis.ly"
% \includeSheet "HdzezSoModrjaZelenja.ly"
% \includeSheet "Ivanica.ly"
% \includeSheet "JaVstretilVac.ly"
% \includeSheet "LesChampsElysees.ly"
% \includeSheet "Mandschuri.ly"
% \includeSheet "MasurischesSommerliedchen.ly"
% \includeSheet "OjLivadoRosnaTravo.ly"
% \includeSheet "PodmowskojeWecera.ly"
% \includeSheet "RomanoDrom.ly"
% \includeSheet "Schiffsjungentanz.ly"
% \includeSheet "Schwarzerdner.ly"
% \includeSheet "StoMiEMilo.ly"
% \includeSheet "StripTheWillow.ly"
% \includeSheet "StadtDerMusik.ly"
% \includeSheet "TheStarOfCountyDown.ly"
% \includeSheet "TumBalalaike.ly"
% \includeSheet "UtcaUtca.ly"
