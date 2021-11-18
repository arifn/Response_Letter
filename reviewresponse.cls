% Copyright Javier Sánchez-Monedero.
% Please report bugs and suggestions to (jsanchezm at uco.es)
%
% This document is released under a Creative Commons Licence 
% CC-BY-SA (http://creativecommons.org/licenses/by-sa/3.0/) 
%

\ProvidesClass{reviewresponse}[2014/01/29]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\InputIfFileExists{\CurrentOption}{}{%
  \PassOptionsToClass{\CurrentOption}{article}}}
\ProcessOptions \relax
\LoadClass{article}

\RequirePackage{a4wide}
\RequirePackage{palatino}
\RequirePackage{verbatim}
\RequirePackage{color}
\RequirePackage[hyphens]{url}
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}
\RequirePackage{fancyvrb}
\RequirePackage[authoryear]{natbib}
\RequirePackage{tcolorbox}
\RequirePackage[parfill]{parskip}
\RequirePackage{titlesec}

%%%%%%%%%%%% headings setup %%%%%%%%%%%%
\pagestyle{fancy}
% clear styles
\fancyhf{}
% odd pages -> chapter name
\fancyhead[LO]{\leftmark} 
% even pages
\fancyhead[RE]{\myJournal -- \myShortTitle}
% odd/even pages
\fancyhead[RO,LE]{\thepage}

\renewcommand{\sectionmark}[1]{\markboth{\textbf{#1}}{}}
% \renewcommand{\subsectionmark}[1]{\markright{\textbf{\thesection. #1}}} 

% line under headings
\renewcommand{\headrulewidth}{0.6pt}
% line over foot 
%\renewcommand{\footrulewidth}{0.6pt}

% increases heading weight
\setlength{\headheight}{1.5\headheight}
\fancyfoot{}

\newcommand{\newtext}[1]{{\leavevmode\color{blue}{#1}}}

% New revisor comment command

\titleformat{\subsection}{\normalfont\bfseries}{\thesubsection}{0pt}{}
\titleformat{\section}{\normalfont\Large\bfseries}{}{0pt}{}

\makeatletter
\renewcommand{\thesubsection}{Comment \thesection.\arabic{subsection}}
\makeatother

\newcommand{\rcomment}[2]
{
\begin{tcolorbox}[colback=white!5,colframe=white!45!black,title=\subsection{}\label{#1}\vspace{-2mm}]
#2
\end{tcolorbox}
}

\newcommand{\excerpt}[2]{
\begin{quotation}\noindent
  \begin{tcolorbox}[colback=white!5,colframe=white!45!black]
    #1
  \end{tcolorbox}
  #2 
\end{quotation}
}

% \newcommand{\excerpt}[2]{
% \begin{tabular}{|p{0.8\textwidth}}\noindent
%     #2 
%     % \raggedleft{\textit{#1}}
%     \begin{flushright}
%     (\textit{in #1})
%     \end{flushright}
% \end{tabular}
% }