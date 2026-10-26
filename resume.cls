\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/10/26 One-page resume]

%==================================================
% ATS notes
%   - single column, no tables, no text boxes, no graphics, no header/footer
%   - standard section names, contact details as plain text
%   - Type 1 fonts with T1 encoding, so every glyph extracts as real text
%==================================================

\LoadClass[10pt,a4paper]{article}

\RequirePackage[top=0.42in,bottom=0.42in,left=0.5in,right=0.5in]{geometry}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage{charter}
\RequirePackage[protrusion=true,expansion=true,tracking=true]{microtype}
\RequirePackage{xcolor}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}

\definecolor{ink}{HTML}{111111}
\definecolor{accent}{HTML}{1F3A68}
\definecolor{muted}{HTML}{4A4A4A}

\hypersetup{colorlinks=false,pdfborder={0 0 0},pdfauthor={Bishnu Prasad Kar},pdftitle={Bishnu Prasad Kar - Resume}}
\urlstyle{same}

\pagestyle{empty}
\color{ink}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\RaggedRight
\raggedbottom

% Keep keywords whole for parsers that read line by line.
\hyphenpenalty=10000
\exhyphenpenalty=10000
\tolerance=9999
\emergencystretch=3em

\setlist[itemize]{leftmargin=1.1em,labelsep=0.45em,itemsep=1.2pt,topsep=1.5pt,parsep=0pt,partopsep=0pt,label={\footnotesize$\bullet$}}

%==================================================
% Sections: capitals over a full-width rule (no letter-spacing: it splits words in extracted text)
%==================================================

\newcommand{\sectionlabel}[1]{\MakeUppercase{#1}}
\titleformat{\section}
  {\fontsize{10.8}{13}\selectfont\bfseries\color{accent}}{}{0pt}{\sectionlabel}
  [\vspace{-7pt}\rule{\textwidth}{0.6pt}]
\titlespacing*{\section}{0pt}{8pt}{4.5pt}

\newcommand{\resumesection}[1]{\section*{#1}}

%==================================================
% Header: name, then two lines of contact details
%==================================================

\newcommand{\sep}{\enspace\textcolor{muted}{|}\enspace}

% #1 name, #2 and #3 contact lines
\newcommand{\resumeheader}[3]{%
\begin{center}
{\fontsize{22}{24}\selectfont\bfseries #1}\par
\vspace{5pt}
{\small #2}\par
\vspace{1pt}
{\small #3}\par
\end{center}
\vspace{-6pt}%
}

%==================================================
% Entries
%==================================================

% Two lines: what and when, then where.
% \rightskip is reset inside each group so \hfill still works under \RaggedRight.
% #1 title, #2 dates, #3 organisation, #4 location
\newcommand{\resumeentry}[4]{%
{\rightskip=0pt\relax\noindent\textbf{#1}\hfill #2\par}%
{\rightskip=0pt\relax\noindent\textit{#3}\hfill\textit{#4}\par}%
}

% One line: name and stack, dates on the right.
% #1 name, #2 link, #3 stack, #4 dates
\newcommand{\resumeproject}[4]{%
{\rightskip=0pt\relax\noindent\href{#2}{\textbf{#1}}\enspace\textcolor{muted}{|}\enspace\textit{#3}\hfill #4\par}%
}

% Space between entries in a section.
\newcommand{\entrygap}{\vspace{4pt}}

\newcommand{\skillline}[2]{\textbf{#1}: #2\par\vspace{1.5pt}}
