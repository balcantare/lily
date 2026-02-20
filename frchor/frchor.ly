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
        \line { \abs-fontsize #14 "friedensingen.de"}
        \vspace #4
      }
    }
  }
  \markuplist \table-of-contents
}

\includeSheet "AllesWohlDemVolke.ly"   
\includeSheet "../bwchor/AmaniLeo.ly"
\includeSheet "BrotUndRosen.ly"
\includeSheet "DasLaecheln.ly"
\includeSheet "DasWeicheWasserBm.ly"      
\includeSheet "DerEinfacheFrieden.ly"
\includeSheet "DerPfahl.ly"             
\includeSheet "DieErdeIstUnsereMutter.ly" 
\includeSheet "DieWeissenTaubenSindMuede.ly"
\includeSheet "../balcantare/DisLeurQueLonSaimeDt.ly"
\includeSheet "../bwchor/EinHochAufDasLeben.ly"
\includeSheet "EinTaennleinSchliefZurWinternacht.ly"
\includeSheet "FriedenWieDasEigneLeben.ly"
\includeSheet "HabMutKeineAngst.ly"
\includeSheet "../balcantare/HappyXMas.ly"
\includeSheet "HeuteUndHier.ly"           
\includeSheet "HevenuSchalomAlechem.ly"   
\includeSheet "../bwchor/HinehMatov.ly"   
\includeSheet "JetztWirdFriedenGemacht.ly" 
\includeSheet "LasstUnsFriedenSchaffen.ly" 
\includeSheet "../bwchor/MateAroha.ly"     
\includeSheet "NeinMeineSoehneGebIchNicht.ly" 
\includeSheet "../bwchor/NgaIwiE.ly"       
\includeSheet "../bwchor/OdYavoShalomAleinu.ly" 
\includeSheet "OLittleTownOfBethlehemDeD.ly"
\includeSheet "OmManiPadmeHum.ly"
\includeSheet "PeaceShalomSalamaleikum.ly"
\includeSheet "PlanetDesFriedens.ly"
\includeSheet "RuestigeRentner.ly"
\includeSheet "SagMirWoDieBlumenSind.ly" 
\includeSheet "SagMirWoDieBlumenSindDeSb.ly" 
\includeSheet "../bwchor/SolangeUnsreLiederKlingen.ly"
\includeSheet "SterneUeberStillenStrassen.ly"
\includeSheet "../balcantare/StillSenktSichDieNachtHerniederC.ly"
\includeSheet "SuesserDieGlockenNieKlingenC.ly"
\includeSheet "TschuessLied.ly"
\includeSheet "UnsereErdeIstUnserGroessterSchatz.ly"
\includeSheet "UnserKreisDerSeiOffen.ly"
\includeSheet "UnsreHeimat.ly"
\includeSheet "UnterDemPflaster.ly"
\includeSheet "WeitInDerChampagne.ly"         
\includeSheet "WeShallOvercome.ly"                
\includeSheet "WerMoechteNichtImLebenBleiben.ly"  
\includeSheet "WirSindEins.ly"
\includeSheet "WirTragenEinLichtInDieDunkelheit.ly"
\includeSheet "Friedenstuechtig.ly"
\includeSheet "../bwchor/WoMenschenSichVergessen.ly"
\includeSheet "ZogenEinstFuenfWildeSchwaene.ly"   
