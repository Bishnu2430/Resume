\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/09/26 ATS-optimised one-page resume]

%==================================================
% ATS notes
%   - single column, no tables, no text boxes, no graphics, no header/footer
%   - standard section names, plain-text contact lines
%   - Type 1 fonts so every glyph extracts as real text
%   - ASCII hyphens in date ranges (some parsers choke on en dashes)
%==================================================

% extarticle gives a true 9pt base size; the text stays selectable, so ATS parsing is unaffected.
\LoadClass[10pt,a4paper]{extarticle}

\RequirePackage[top=0.38in,bottom=0.32in,left=0.45in,right=0.45in]{geometry}

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}

\hypersetup{colorlinks=false,pdfborder={0 0 0}}
\urlstyle{same}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\RaggedRight
\raggedbottom
\linespread{0.97}\selectfont

% A plain ASCII hyphen as the bullet: extracts as "-" in every parser, unlike a bullet glyph.
\setlist[itemize]{leftmargin=10pt,itemsep=0pt,topsep=1pt,parsep=0pt,partopsep=0pt,label=-}

% No hyphenation: keeps keywords whole for parsers that read line by line.
\hyphenpenalty=10000
\exhyphenpenalty=10000
\tolerance=9999
\emergencystretch=3em

%==================================================
% Sections: plain bold capitals plus a rule
%==================================================

\titleformat{\section}{\normalsize\bfseries\uppercase}{}{0pt}{}
\titlespacing*{\section}{0pt}{4pt}{1.5pt}
\renewcommand{\thesection}{}

\newcommand{\resumesection}[1]{%
\section{#1}%
\vspace{-5pt}\hrule\vspace{3pt}%
}

%==================================================
% Header: name, target title, then contact lines
%==================================================

\newcommand{\resumeheader}[4]{%
\begin{center}
{\fontsize{17}{19}\selectfont\bfseries #1}

\vspace{3pt}
{\small #2}

\vspace{3pt}
{\footnotesize #3}

\vspace{2pt}
{\footnotesize #4}
\end{center}
\vspace{2pt}%
}

%==================================================
% Entries: one text line, title first, date last
%==================================================

% One line per heading: role, then employer, then the date on the right.
% \rightskip is reset inside the group so \hfill still works under \RaggedRight.
\newcommand{\entryline}[3]{%
{\rightskip=0pt\relax\noindent\textbf{#1}, #2\hfill #3\par}%
}

% #1 role, #2 employer, #3 dates, #4 bullet list
\newcommand{\resumeentry}[4]{%
\entryline{#1}{#2}{#3}%
#4%
\vspace{3pt}%
}

% #1 name, #2 one-line description, #3 dates, #4 stack, #5 bullets
\newcommand{\resumeproject}[5]{%
{\rightskip=0pt\relax\noindent\textbf{#1} -- #2\hfill #3\par}%
\textit{#4}\par
\begin{itemize}#5\end{itemize}%
\vspace{3pt}%
}

\newcommand{\skillcategory}[2]{\textbf{#1}: #2\par\vspace{1.5pt}}

\newcommand{\publication}[2]{#1. \textit{#2}\par\vspace{1.5pt}}

\newcommand{\plainitem}[1]{#1\par\vspace{1.5pt}}
