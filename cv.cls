\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2026/09/26 Academic CV]

%==================================================
% Academic CV: navy accent, tables, photo. Designed to be read by people,
% unlike the plain one-page resume which is tuned for parsers.
%==================================================

\LoadClass[10pt,a4paper]{extarticle}

\RequirePackage[top=0.6in,bottom=0.6in,left=0.62in,right=0.62in]{geometry}

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc}
\RequirePackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{amssymb}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{fancyhdr}
\RequirePackage[hidelinks]{hyperref}

\definecolor{navy}{HTML}{2342B8}
\definecolor{ink}{HTML}{1B2130}
\definecolor{slate}{HTML}{4C566A}
\definecolor{mist}{HTML}{EEF1FA}
\definecolor{hair}{HTML}{D3DAE6}

\hypersetup{colorlinks=true,urlcolor=navy,linkcolor=navy}
\urlstyle{same}

\color{ink}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\RaggedRight
\raggedbottom
\hyphenpenalty=10000
\exhyphenpenalty=10000
\tolerance=9999
\emergencystretch=3em

\setlist[itemize]{leftmargin=12pt,itemsep=1pt,topsep=2pt,parsep=0pt,partopsep=0pt,label=\textcolor{navy}{\small$\blacktriangleright$}}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[L]{\footnotesize\color{slate}Bishnu Prasad Kar}
\fancyfoot[R]{\footnotesize\color{slate}\thepage\ / \pageref{LastPage}}

%==================================================
% Section headings: navy caps with a two-tone rule
%==================================================

\titleformat{\section}
{\large\bfseries\color{navy}}{}{0pt}{\MakeUppercase}
[{\vspace{-7pt}\textcolor{navy}{\rule{2.2cm}{1.6pt}}\textcolor{hair}{\rule{\dimexpr\textwidth-2.2cm\relax}{1.6pt}}}]
\titlespacing*{\section}{0pt}{11pt}{5pt}
\renewcommand{\thesection}{}
\newcommand{\cvsection}[1]{\section{#1}}

%==================================================
% Header with photo
%==================================================

\newcommand{\photo}[2]{%
\begin{tikzpicture}
\clip[rounded corners=7pt] (0,0) rectangle (#2,#2);
\node[anchor=south west,inner sep=0] at (0,0) {\includegraphics[width=#2]{#1}};
\end{tikzpicture}%
}

% #1 name, #2 tagline, #3 contact line 1, #4 contact line 2, #5 photo path
\newcommand{\cvheader}[5]{%
\begin{tikzpicture}
\node[fill=mist,rounded corners=8pt,inner sep=12pt,text width=\dimexpr\textwidth-24pt\relax] {
  \begin{minipage}[c]{\dimexpr\textwidth-24pt-3.3cm\relax}
    {\fontsize{22}{24}\selectfont\bfseries\color{navy} #1}\\[3pt]
    {\small\color{ink} #2}\\[6pt]
    {\footnotesize\color{slate} #3}\\[2pt]
    {\footnotesize\color{slate} #4}
  \end{minipage}\hfill
  \begin{minipage}[c]{3cm}
    \raggedleft\photo{#5}{2.9cm}
  \end{minipage}
};
\end{tikzpicture}
\vspace{2pt}%
}

%==================================================
% Entries and tables
%==================================================

% #1 title, #2 organisation or stack, #3 dates
\newcommand{\cventry}[3]{%
{\rightskip=0pt\relax\noindent\textbf{\color{ink}#1}\hfill{\footnotesize\color{slate}#3}\par}%
{\small\itshape\color{slate}#2}\par\vspace{1pt}%
}

% tabularx cannot be wrapped in a custom environment (it scans for its own \end),
% so the label/content tables are written inline with this column spec.
\newcolumntype{L}{>{\raggedright\arraybackslash\bfseries\color{navy}}p{3.7cm}}

\newcommand{\cvline}[2]{\textbf{\color{navy}#1}: #2\par\vspace{2pt}}
\newcommand{\cvplain}[1]{#1\par\vspace{2pt}}

% #1 authors, #2 title, #3 venue and date, #4 note
\newcommand{\cvpublication}[4]{%
{\small\color{slate}#1}\par
\textbf{#2}\par
{\small\color{slate}#3}\par
{\small #4}\par\vspace{5pt}%
}
