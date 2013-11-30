% pytutorial.cls for The Python Tutorial zh-cn

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{TikZHardWay}[2013/11/30 Document class (Python Tutorial)]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\PassOptionsToClass{hyperref}{ctexart}

\LoadClass{ctexart}

%----------- Loading Packages
\RequirePackage{tcolorbox}
\RequirePackage{fancyvrb}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{accsupp}
\RequirePackage{setspace}
\RequirePackage{environ}
\RequirePackage{graphicx}
\RequirePackage{textcomp}
\RequirePackage{amsmath} % for \text
\RequirePackage{makeidx}
\RequirePackage{framed}
\RequirePackage{ifthen}
% \RequirePackage[toc]{multitoc}
\RequirePackage{eso-pic} % Required for specifying an image background in the title page
\RequirePackage{paralist}
\RequirePackage{booktabs}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{metalogo}

%----------- geometry
\geometry{left = 3.5cm, right = 3.5cm, top = 4.5cm, bottom = 4.5cm}

%----------- titleformat
\CTEXsetup[name = {习题,:~}, number = {\arabic{section}}]{section}

%----------- titlepage
\let\OLDmaketitle\maketitle
\renewcommand{\maketitle}{\begingroup\thispagestyle{empty}\AddToShipoutPicture*{\put(6,5){\includegraphics[width = .98\paperwidth, height = .986\paperheight]{background.pdf}}}\OLDmaketitle\endgroup}

%----------- Tips' Environments
\newenvironment{jingg}{
\begin{tcolorbox}[left=1mm,top=1mm,bottom=1mm,fontupper={\textbf{警示：}},
colback=red!20,coltext=black]
}{
\end{tcolorbox}
}
\newenvironment{note}{
\begin{tcolorbox}[left=1mm,top=1mm,bottom=1mm,fontupper={\textbf{提示：}},
colback=green!20,coltext=black]
}{
\end{tcolorbox}
}

%----------- Code Highlighting
\newcommand\emptyaccsupp[1]{\BeginAccSupp{ActualText={}}#1\EndAccSupp{}}

\lstset{
        literate     =*{>}{{\textcolor{blue}>}}{1}{.}{{\textcolor{blue}.}}{1},
        basicstyle   =\ttfamily\small\setstretch{1},
        stringstyle  =\color{red},
        xleftmargin  = 4mm,
        xrightmargin = 4mm,
        breaklines
}

\lstnewenvironment{python}[1][]{
\lstset{
        language         =python,
        otherkeywords    ={\ , \}, \{},
        keywordstyle     =\color{blue},
        emph             ={access,and,break,class,continue,def,del,elif,else,except,exec,finally,for,from,global,if,import,in,is,lambda,not,or,pass,print,raise,return,try,while,with},
        emphstyle        =\color{orange}\bfseries,
        emph             ={[2]True, False, None, self},
        emphstyle        =[2]\color{green},
        emph             ={[3]from, import, as},
        emphstyle        =[3]\color{blue},
        upquote          =true,
        morecomment      =[s]{"""}{"""},
        commentstyle     =\color{gray}\slshape,
        literate         =*{:}{{\textcolor{blue}:}}{1}{=}{{\textcolor{blue}=}}{1}{-}{{\textcolor{blue}-}}{1}{+}{{\textcolor{blue}+}}{1}{*}{{\textcolor{blue}*}}{1}{/}{{\textcolor{blue}/}}{1}{!}{{\textcolor{blue}!}}{1}{(}{{\textcolor{blue}(}}{1}{)}{{\textcolor{blue})}}{1}{<}{{\textcolor{blue}<}}{1}{>}{{\textcolor{blue}>}}{1}{\%}{{\textcolor{blue}\%}}{1},
        literate         =*{[}{{\textcolor{blue}[}}{1}{]}{{\textcolor{blue}]}}{1}{:}{{\textcolor{blue}:}}{1}{=}{{\textcolor{blue}=}}{1}{-}{{\textcolor{blue}-}}{1}{+}{{\textcolor{blue}+}}{1}{*}{{\textcolor{blue}*}}{1}{/}{{\textcolor{blue}/}}{1}{!}{{\textcolor{blue}!}}{1}{(}{{\textcolor{blue}(}}{1}{)}{{\textcolor{blue})}}{1}{<}{{\textcolor{blue}<}}{1}{>}{{\textcolor{blue}>}}{1},
        showstringspaces =true,
        alsoletter       ={1234567890},
        framexleftmargin =1mm,
        framextopmargin  =1mm, 
        frame            =shadowbox, 
        rulesepcolor     =\color{blue},
        numbers          =left,
        numberstyle      =\emptyaccsupp,
        #1
}}{}
% \RequirePackage{pycode}

%----------- fancyvrb
\DefineShortVerb*{\|}

%----------- define colors
\definecolor{TitleColor}{rgb}{0.126,0.263,0.361}
\definecolor{InnerLinkColor}{rgb}{0.208,0.374,0.486}
\definecolor{OuterLinkColor}{rgb}{0.216,0.439,0.388}

%----------- hypersetup
\hypersetup{colorlinks,breaklinks,
                linkcolor=InnerLinkColor,filecolor=OuterLinkColor,
                menucolor=OuterLinkColor,urlcolor=OuterLinkColor,
                citecolor=InnerLinkColor,
                bookmarksnumbered}

%----------- graphicspath
\graphicspath{{./figures/}}

% From footmisc.sty: allows footnotes in titles
\let\FN@sf@@footnote\footnote
\def\footnote{\ifx\protect\@typeset@protect
    \expandafter\FN@sf@@footnote
  \else
    \expandafter\FN@sf@gobble@opt
  \fi
}
\edef\FN@sf@gobble@opt{\noexpand\protect
  \expandafter\noexpand\csname FN@sf@gobble@opt \endcsname}
\expandafter\def\csname FN@sf@gobble@opt \endcsname{%
  \@ifnextchar[%]
    \FN@sf@gobble@twobracket
    \@gobble
}
\def\FN@sf@gobble@twobracket[#1]#2{}

% Some custom font markup commands.
\newcommand{\strong}[1]{{\bf #1}}
\newcommand{\code}[1]{\texttt{#1}}
\newcommand{\bfcode}[1]{\code{\bfseries#1}}
\newcommand{\email}[1]{\textsf{#1}}

\newcommand{\TikZ}{Ti{\itshape k}\/Z}