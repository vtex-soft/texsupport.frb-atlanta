\ProvidesClass{frbaart}[2021/07/29 v1.04 template for Federal Reserve Bank of Atlanta article]

\newif\if@showmetapage \@showmetapagetrue
\newif\if@showinstructionpage \@showinstructionpagetrue
\DeclareOption{nometapage}{\@showmetapagefalse}
\DeclareOption{noinstructionpage}{\@showinstructionpagefalse}
\DeclareOption{draft}{\@showmetapagetrue\@showinstructionpagetrue}
\DeclareOption{final}{\@showmetapagefalse\@showinstructionpagefalse}

\ProcessOptions

\LoadClass[11pt]{article}

\setlength\floatsep    {10\p@ \@plus 1\p@ \@minus 2\p@}
\setlength\textfloatsep{10\p@ \@plus 1\p@ \@minus 2\p@}
\setlength\intextsep   {10\p@ \@plus 1\p@ \@minus 2\p@}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {10pt \@plus .2pt \@minus .2pt}%
                                   {6pt \@plus .2pt}%
                                   {\fontsize{14}{16}\normalfont \bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-6pt\@plus .2pt \@minus .2pt}%
                                     {1sp \@plus .2pt}%
                                     {\fontsize{12}{14}\normalfont \bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-6pt \@plus .2pt \@minus .2pt}%
                                     {1sp \@plus .2pt}%
                                     {\fontsize{11}{13}\normalfont \itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {6pt \@plus .2pt \@minus .2pt}%
                                    {-3pt}%
                                    {\normalfont\normalsize\itshape}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {6pt \@plus .2pt \@minus .2pt}%
                                       {-3pt}%
                                      {\normalfont\normalsize\itshape}}

\RequirePackage[noindentafter]{titlesec}
\newcommand{\periodafter}[1]{#1.}

\def\ttlf@paragraph {\ttlh@runin 
  {\normalfont \normalsize \itshape }
  {\@seccntformat {subparagraph}}{\z@ }{\ttl@passexplicit \periodafter}{}}
\def\ttlf@subparagraph {\ttlh@runin 
  {\normalfont \normalsize \itshape }
  {\@seccntformat {subparagraph}}{\z@ }{\ttl@passexplicit \periodafter}{}}


\def\ttl@straight@ii#1#2#3#4#5#6#7{%
  \edef\cur@lastskip{\the\lastskip}%
  \ttl@assign\@tempskipa#3\relax\beforetitleunit
  \@ifundefined{ttl@ps@#6}{}%
    {\PackageWarning{titlesec}{Page style in straight class ignored}}%
  \if@nobreak
    \ttl@titlespace{\@tempskipa}%
  \else
    \@ifundefined{#6break}%
      {\addpenalty{\@secpenalty}}%
      {\csname#6break\endcsname}%
    \addvspace{\@tempskipa}%
    \ifdim\bottomtitlespace<\z@
    \else
      \begingroup
       \@tempskipb\pagegoal
       \@tempskipa\pagegoal
       \ttl@addstretch  % \relax if nobottomtitle*
       \advance\@tempskipa-\bottomtitlespace\relax % not a register
       \pagegoal\@tempskipa
       \def\@textbottom{\vskip\z@\@plus.0001fil}%
       \penalty9999
       \pagegoal\@tempskipb
      \endgroup
    \fi
  \fi
  \@afterindenttrue
  \ifcase#5 \@afterindentfalse\fi
  \ttl@assign\@tempskipb#4\relax\aftertitleunit
  \ifdim\lastskip=\intextsep
      \vskip-\parskip
  \fi  
  \ttl@select{#6}{#1}{#2}{#7}%
  \ttl@finmarks
  \@ifundefined{ttlp@#6}{}{\ttlp@write{#6}}%
  \if@noskipsec
    \global\@nobreakfalse
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
        \clubpenalty\@M
        \hskip-\parindent
        \begingroup
          \@svsechd\unskip{\hspace{\@tempskipb}}%
        \endgroup
      \else
        \clubpenalty\@clubpenalty\everypar{}%
      \fi
      }%
  \else
    \par\nobreak
    \vspace{\@tempskipb}%
    \@afterheading
  \fi
  \ignorespaces}
  
\setcounter{secnumdepth}{1}
                                      
\renewcommand\footnotesize{%
     \@setfontsize\footnotesize{10}{12\p@ plus .1pt minus .1pt}%%
     \abovedisplayskip 6\p@ \@plus4\p@ \@minus1\p@
     \belowdisplayskip \abovedisplayskip
     \abovedisplayshortskip \abovedisplayskip
     \belowdisplayshortskip \abovedisplayskip}
   
\normalsize
\renewcommand{\baselinestretch}{1.15}

\RequirePackage{geometry}
\geometry{
  letterpaper,
  left=25mm,right=25mm,top=25mm,bottom=25mm
	}

\raggedright
\RequirePackage{parskip}  
\RequirePackage{etoolbox}  

\parindent=36pt
\parskip=6pt
\edef\documentparindent{\the\parindent}
\edef\documentparskip{\the\parskip}

\setlength{\footnotesep}{16pt}  
\setlength{\skip\footins}{25pt}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width 144\p@
  \kern0\p@}
\renewcommand\@makefntext[1]{%
    \parindent \z@
    \noindent
    \raggedright
    {\@makefnmark}\space #1}

\RequirePackage{caption}
\captionsetup{labelsep=colon,font={bf},%
  justification=raggedright,skip=6\p@,listformat=simple,singlelinecheck=off}
\def\caption@opt@singleline{indent=0pt}
  
\appto\@floatboxreset{%
  \csuse{@\@captype boxreset}%
  }
\def\@begin@figure@hook{\global\parskip=\z@
  \aftergroup\reset@parskip
  }
\def\@begin@table@hook{\global\parskip=\z@
  \aftergroup\reset@parskip
  }
\ifdefined\NewMirroredHookPair
  \AtBeginEnvironment{table}{\@begin@table@hook}
  \AtBeginEnvironment{figure}{\@begin@figure@hook}
\fi

\def\reset@parskip{\everypar=\expandafter{\the\everypar\parskip=\documentparskip}}  
  
\def\@tableboxreset{\small}
\def\thead#1{{\fontsize{11}{13}\selectfont #1}}
  
\def\firstnote@sep{\vskip3\p@ \let\firstnote@sep\relax}
\appto\@figureboxreset{\parskip=\z@}
\def\notefont{\fontsize{8}{10}\selectfont}  
\newcommand{\note}[2][Note]{%
  \firstnote@sep
  \notefont
  \vbox{\hsize=\textwidth #1: #2}\unskip
  }

\newif\if@after@float  
\newcommand\my@float@endH{\@endfloatbox
  \ifdim\lastskip=\intextsep
  \else
      \vskip\intextsep
  \fi
  \if@flstyle\setbox\@currbox\float@makebox\columnwidth\fi
  \box\@currbox
  \global\@after@floattrue
  \unskip
  \vskip\intextsep\relax}
  
\AtBeginDocument{\let\float@endH\my@float@endH}
  
\RequirePackage{hyperref}
\hypersetup{
  colorlinks,
  linkcolor=blue,
  citecolor=blue,
  citecolor=blue,
  urlcolor=blue,
  pdfborder={0 0 1},
  pdfstartview={FitH},
  hypertexnames=false,
  breaklinks,
  }

\def\@filebordercolor{0 0 1}
\def\@filecolor{blue}

\def\UrlFont{}

  
% "IBM Plex Sans for the body text and IBM Plex Serif for headers"
\RequirePackage[sfdefault]{plex-sans}
\def\plexseriffamily{IBMPlexSerif-TLF}
\def\plexmonofamily{IBMPlexMono-TLF}
\def\ttdefault{\plexmonofamily}

\usepackage[italic]{mathastext}
  
\def\@title{}
\def\titlefont{\fontfamily{\plexseriffamily}\bfseries\fontsize{30}{32}\selectfont}
\def\title#1{\gdef\@title{#1}}

\def\@subtitle{}
\def\subtitlefont{\fontsize{18}{20}\selectfont}
\def\subtitle#1{\gdef\@subtitle{#1}}


\newtoks\toksemails
\def\authorcommentsfont{\itshape}
\def\emailfont{\normalfont}
\def\@emailsep{\let\@emailsep\emailsep}
\def\emailsep{ or }
\def\email#1{\href{mailto:#1}{#1}}
\long\def\pemail#1{\global\toksemails=\expandafter{\the\toksemails \printemail{\email{#1}}}}
\def\printemail#1{\@emailsep {\emailfont #1}}

\def\address#1{}
\def\affiliation#1{#1}
\def\firstname#1{#1}
\def\surname#1{#1}
\def\bio#1{#1}

\newtoks\toksauthors
\def\authorsheadfont{\bfseries\fontsize{14}{14}\selectfont}
\def\personfont{\bfseries\fontsize{12}{14}\selectfont}
\def\person#1{{\personfont #1}}
\long\def\author#1{\global\toksauthors=\expandafter{\the\toksauthors \printauthor{#1}}}
\def\printauthor#1{\vskip3pt #1}

\def\metapersonfont{\bfseries}
\def\printmetaauthors{%
  \bgroup
    \let\personfont\metapersonfont
    \parskip=2pt
    \let\email\pemail
    \let\bio\@gobble
    \the\toksauthors
  \egroup
  }

\def\authorcomments{%
  \if.\the\toksemails.\else
    {\authorcommentsfont Comments to the authors are welcome at \the\toksemails.}\par
  \fi
  }
  
\newenvironment{aboutauthors}{
  \vskip 1.5em%
  {\authorsheadfont About the Authors:}\par
  }{\par}%
  
\RequirePackage{environ}
\RequirePackage{array}
\RequirePackage{amssymb}
\usepackage{graphicx}
\usepackage{multicol}
\usepackage{marvosym}

\def\uncheckedbox{\HollowBox\enskip}
\let\checkbox\uncheckedbox
\def\checkedbox{\CrossedBox\enskip}

\def\instructionstitlefont{\bfseries\fontsize{36}{40}\selectfont}
\def\instructionsbodyfont{\fontfamily{ptm}\fontsize{12}{14}\selectfont}

\def\instructionstitle{Instructions for Policy Hub}
\NewEnviron{instructionspage}{\expandafter\gdef\expandafter\@instructionspage\expandafter{\BODY}}%
\def\@instructionpage{%
  \if@showinstructionpage
    \def\selectnext{\def\checkbox{\checkedbox\global\let\checkbox\uncheckedbox}}%
    \thispagestyle{empty}
    \newpage
    \bgroup
    \null
    \nointerlineskip
    \vskip-\baselineskip 
    \vskip 4pt
    \parindent=\z@
    {\instructionstitlefont \instructionstitle}%
    \vskip 1.5em
    \instructionsbodyfont
    \begin{enumerate}
    \@instructionspage
    \end{enumerate}
    \egroup
  \fi
  }

  
\def\@acks{}
\NewEnviron{acks}{\expandafter\gdef\expandafter\@acks\expandafter{\BODY}}%
\def\acksheadfont{\bfseries\fontsize{12}{12}\selectfont}
\def\ackshead{\acksheadfont Acknowledgments:}
\def\printacks{%
  \if.\@acks.\else
    \vskip 1em%
    {\ackshead}\space\@acks \par%
  \fi
  }
\ifdefined\NewMirroredHookPair
  \AfterEndEnvironment{acks}{\printacks}
\else
  \appto\@afterend@acks@hook{\printacks}
\fi

\let\abstract\undefined
\let\endabstract\undefined
\def\@abstract{}
\NewEnviron{abstract}{\expandafter\gdef\expandafter\@abstract\expandafter{\BODY}}%
\def\abstractheadfont{\acksheadfont}
\def\abstracthead{\abstractheadfont Summary:}

\RequirePackage{enumitem}
\renewcommand\labelitemi{{\fontsize{15}{15}\selectfont\textbullet}}

\def\@findings{}
\NewEnviron{findings}{\expandafter\gdef\expandafter\@findings\expandafter{\BODY}}%
\def\findingsheadfont{\acksheadfont}
\def\findingshead{\findingsheadfont Key findings:}
\def\printfindings{%
  \bgroup
  {\findingshead}\par
    \begin{enumerate}[leftmargin=*]
      \@findings
    \end{enumerate}%
  \egroup
  }

\def\@affilhead{}
\def\@affilbody{}
\newcommand{\affil}[2][Center Affiliation:]{\gdef\@affilhead{#1}\gdef\@affilbody{#2}}

\def\printaffil{%
  {\affilheadfont \@affilhead}\space\@affilbody\par}
\def\affilheadfont{\acksheadfont}

\newtoks\tokskeywords
\def\keywords@sep{\vskip\z@}
\def\keywordsheadfont{\bfseries}  
\def\keywordsfont{}  
\newcommand{\keywords}[2][Keywords]{%
  \global\tokskeywords=\expandafter{\the\tokskeywords\printkeywords{#1}{#2}}
  }
\def\printkeywords#1#2{%
  \keywords@sep
  \keywordsfont
  {{\keywordsheadfont #1:} #2}\par
  }

\def\@doi{}
\def\doifont{\bfseries}
\def\doi#1{\gdef\@doi{#1}}

\def\metapagefont{\fontfamily{\plexseriffamily}\bfseries\fontsize{30}{32}\selectfont}
  
\long\def\@metapage{%
  \if@showmetapage
    \thispagestyle{empty}
    \newpage
    \null
    \nointerlineskip
    \vskip-\baselineskip 
    \vskip 4pt
    \parindent=\z@
    \let \footnote \thanks
    \if\@title\empty\else
      {\metapagefont \@title \par}%
    \fi
    \if\@subtitle\empty\else
      \vskip 0.5em%
      {\subtitlefont \@subtitle \par}%
    \fi
    \if.\the\toksauthors.\else
      \vskip 1.5em%
      \printmetaauthors
      \par
    \fi
    \if\@abstract\empty\else
      \vskip 0.5em%
      {\abstracthead}\par\@abstract \par
    \fi
    \ifx\@findings\empty\else
      \vskip 0.5em%
      \printfindings
    \fi
    \ifx\@affilbody\empty\else
      \vskip 0.5em%
      \printaffil
    \fi
    \if.\the\tokskeywords.\else
      \vskip 0.5em%
      \the\tokskeywords
    \fi
    \if\@doi\empty\else
      \vskip 1em%
      {\doifont \@doi}
    \fi
    \clearpage
  \fi
  }
  
\newbox\frontmatterbox
\def\frontmatter{%
  \thispagestyle{empty}%
  \setbox\frontmatterbox\vbox\bgroup
  }
  
\def\endfrontmatter{%
  \egroup
  \maketitle
  }
\def\maketitle{% 
  \let\saved@footnote\footnote
  \let\footnote\thanks
  \@instructionpage
  \newpage
  \@metapage
  \newpage
  \c@page=2
  \parindent=\z@
  \null
  \nointerlineskip
  \vskip-\baselineskip 
  \vskip 4pt
  \if.\@title.\else
    {\titlefont \@title \par}%
  \fi
  \if.\@subtitle.\else
    \vskip 0.5em%
    {\subtitlefont \@subtitle \par}%
  \fi
  \if.\@abstract.\else
    \vskip 1.5em%
    {\abstracthead}\space\@abstract \par
  \fi
  \let\footnote\saved@footnote
  }
  
\def\@articlenumber{0000-0}
\def\articlenumber#1{\def\@articlenumber{#1}}
\def\headline@font{\fontfamily{\plexseriffamily}\fontsize{10}{10}\selectfont}
\def\headline@text{Federal Reserve Bank of Atlanta \textit{Policy Hub} \textbullet\ No. \@articlenumber}
\def\footline@font{\fontsize{11}{11}\selectfont}
\def\ps@headings{%
  \def\@evenfoot{{\hfill\footline@font \thepage\hfill}}%
  \let\@oddfoot\@evenfoot
  \def\@oddhead{{\headline@font\headline@text\hfill}}
  \let\@evenhead\@oddhead
  } 
    
\pagestyle{headings}

\RequirePackage{afterpackage}

\AfterPackage{natbib}{
  \bibsep=6pt
  \setlength{\bibhang}{0.5in}
  } 
\appto\@thebibliograpgy{%
  \renewcommand{\baselinestretch}{1.15}
  }  

\newenvironment{response}{\itshape\selectfont}{}

\def\mainmatter{%
  \parindent=\documentparindent
  \clearpage
  }
  
\endinput