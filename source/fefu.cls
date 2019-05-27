\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fefu}[2014/08/16 Example LaTeX class]
\LoadClass[14pt]{extarticle}

\newcommand{\@FEFUhassubfigure}{false}

\DeclareOption{subfigure}{\renewcommand{\@FEFUhassubfigure}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage{fontspec}
\setmainfont{Times New Roman}

\usepackage{polyglossia}
\setdefaultlanguage{russian}
\setotherlanguage{english}
\PolyglossiaSetup{russian}{indentfirst=true}

\RequirePackage[a4paper,left=2.5cm,right=1cm,top=2cm,bottom=2cm]{geometry}
\RequirePackage{ulem}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{multicol}
\RequirePackage{calc}
\RequirePackage{xifthen}
\RequirePackage[explicit]{titlesec}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[style]{abstract}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\ifthenelse{\equal{\@FEFUhassubfigure}{false}}{
	\RequirePackage{tocloft}
}{
	\RequirePackage{subfig}
	\RequirePackage[subfigure]{tocloft}
}

\newcommand{\@FEFUschool}{THE SCHOOL}
\newcommand{\setschool}[1]{\renewcommand{\@FEFUschool}{#1}}

\newcommand{\@FEFUdepartment}{the department}
\newcommand{\setdepartment}[1]{\renewcommand{\@FEFUdepartment}{#1}}

\newcommand{\@FEFUdepartmenthead}{T.H.Head}
\newcommand{\setdepartmenthead}[1]{\renewcommand{\@FEFUdepartmenthead}{#1}}

\newcommand{\@FEFUgroup}{Б0000а}
\newcommand{\setgroup}[1]{\renewcommand{\@FEFUgroup}{#1}}

\newcommand{\@FEFUsupervisor}{}
\newcommand{\@FEFUsupervisortitle}{}
\newcommand{\setsupervisor}[2]{
	\renewcommand{\@FEFUsupervisor}{#1}
	\renewcommand{\@FEFUsupervisortitle}{#2}
}

\newcommand{\@FEFUdaya}{}
\newcommand{\@FEFUmontha}{}
\newcommand{\@FEFUyeara}{}
\newcommand{\@FEFUdayb}{}
\newcommand{\@FEFUmonthb}{}
\newcommand{\@FEFUyearb}{}
\newcommand{\setdates}[6]{
	\renewcommand{\@FEFUdaya}{#1}
	\renewcommand{\@FEFUmontha}{#2}
	\renewcommand{\@FEFUyeara}{#3}
	\renewcommand{\@FEFUdayb}{#4}
	\renewcommand{\@FEFUmonthb}{#5}
	\renewcommand{\@FEFUyearb}{#6}
}

\newcommand{\@FEFUweeks}{}
\newcommand{\setweeks}[1]{\renewcommand{\@FEFUweeks}{#1}}

\newcommand{\@FEFUplace}{}
\newcommand{\setplace}[1]{\renewcommand{\@FEFUplace}{#1}}

\newcommand{\@FEFUfemale}{false}
\newcommand{\setfemale}{\renewcommand{\@FEFUfemale}{true}}

\newlength{\@FEFUunderlinelength}
\setlength{\@FEFUunderlinelength}{\widthof{\_}}
\newcommand{\@FEFUunderline}[1]{\underline{\hspace*{#1\@FEFUunderlinelength}}}

\newlength{\@FEFUleftcolumnwidth}
\setlength{\@FEFUleftcolumnwidth}{230pt}

\newlength{\@FEFUrightcolumnwidth}
\setlength{\@FEFUrightcolumnwidth}{210pt}

\newlength{\@FEFUlength}
\newcommand{\@FEFUpreunderline}[2]{
	\setlength{\@FEFUlength}{#2-\widthof{#1}}%
	\underline{\hspace{\@FEFUlength}}#1
}
\newcommand{\@FEFUpostunderline}[2]{
	\setlength{\@FEFUlength}{#2-\widthof{#1}}%
	#1\underline{\hspace{\@FEFUlength}}
}

\newcommand{\@FEFUdate}{<<\@FEFUunderline{4}>>\@FEFUunderline{15} \the\year\ г.}

\newcommand{\makereporttitle}{
	\begin{titlepage}
		\setstretch{1}
		\begin{center}
			\includegraphics[scale=0.5]{fefu}\\
			{\fontsize{10}{12}\selectfont МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО  ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ}\\
			{\fontsize{11}{12}\selectfont Федеральное государственное автономное образовательное учреждение высшего образования\\}
			{\bf {«Дальневосточный федеральный университет»}\\(ДВФУ)}\\
			\vskip 14pt
			\leaders\vrule width \textwidth\vskip2pt
			\vskip 1pt
			\leaders\vrule width \textwidth\vskip0.5pt
			\vskip 18pt
			{\bf \@FEFUschool}\\
			\vskip 12pt
			{\bf \@FEFUdepartment}
			\vskip 20pt
			{\bf О\ Т\ Ч\ Ё\ Т}
			\vbox to 70pt {\vfil\@title\vfil}
		\end{center}
		\setlength{\columnsep}{1.5cm}
		\begin{multicols}{2}
			\vbox to 65pt {}
			\noindent Отчёт защищен:\\
			\@FEFUpostunderline{с оценкой }{\@FEFUleftcolumnwidth}\\
			
			\noindent Зав.кафедрой
			\vskip 14pt
			\noindent\@FEFUpreunderline{\@FEFUdepartmenthead}{\@FEFUleftcolumnwidth}\\
			
			\centerline{\@FEFUdate}
			\vskip 28pt
			{
				\fontsize{12}{14}\selectfont%
				\noindent Регистрационный № \@FEFUunderline{6}
				\vskip 24pt
				\noindent\@FEFUdate
			}
			\vfill\null
			\columnbreak
			\noindent \ifthenelse{\equal{\@FEFUfemale}{true}}{Выполнила студентка}{Выполнил студент} гр. \@FEFUgroup\\
			\ifthenelse{\equal{\@author}{}}{
				\@FEFUpostunderline{\@FEFUunderline{15}\ }{\@FEFUrightcolumnwidth}\\
				{\indent\fontsize{8}{10}\selectfont\textit{(Ф.И.О.)}\hspace{0.27\@FEFUleftcolumnwidth}\textit{(подпись)}}
			}{
				\noindent\@FEFUpostunderline{\@author\ }{\@FEFUrightcolumnwidth}\\
				{\indent\fontsize{8}{10}\selectfont\hspace{0.4\@FEFUleftcolumnwidth}\textit{(подпись)}}
			}\\
			Руководитель практики\\
			\ifthenelse{\equal{\@FEFUsupervisortitle}{}}{
				\underline{\hspace{\@FEFUrightcolumnwidth}}\\
				{\indent\fontsize{8}{10}\selectfont\textit{(должность, уч.звание)}}
			}{
				\noindent\hbox to \@FEFUrightcolumnwidth {\@FEFUsupervisortitle}\\
				{\indent\fontsize{8}{10}\selectfont\textit{(должность, уч.звание)}}				
			}\\
			\ifthenelse{\equal{\@FEFUsupervisor}{}}{
				\@FEFUpostunderline{\@FEFUunderline{15}\ }{\@FEFUrightcolumnwidth}\\
				{\indent\fontsize{8}{10}\selectfont\textit{(Ф.И.О.)}\hspace{0.27\@FEFUleftcolumnwidth}\textit{(подпись)}}
			}{
				\noindent\@FEFUpostunderline{\@FEFUsupervisor\ }{\@FEFUrightcolumnwidth}\\
				{\indent\fontsize{8}{10}\selectfont\hspace{0.4\@FEFUleftcolumnwidth}\textit{(подпись)}}
			}\\
			\@FEFUdate\\
			\vskip 28pt
			{
				\fontsize{12}{14}\selectfont%
				\noindent Практика пройдена в срок\\
				\begin{tabular}{@{}lccc}
					с & <<\@FEFUdaya>> & \@FEFUmontha & \@FEFUyeara г.\\
					по & <<\@FEFUdayb>> & \@FEFUmonthb & \@FEFUyearb г.
				\end{tabular}\\
				(\@FEFUweeks\ недель)
				\vskip 12pt
				\noindent\textit{\uline{на \@FEFUplace}}
			}
		\end{multicols}
		{\setstretch{1.25}\centering{г. Владивосток\\\the\year}\par}
	\end{titlepage}
	\newpage
	\clearpage
	\setcounter{page}{2}
}

\newcommand{\maketableofcontents}{
	\thispagestyle{empty}
	\hypertarget{sec:contents}{}
	\tableofcontents
	\newpage
}

\title{}
\author{}

\setstretch{1.5}
\setlength\parindent{1.25cm}

\fancypagestyle{plain}{\fancyhf{}\fancyfoot[R]{\thepage}}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{plain}

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cfttoctitlefont}{\normalfont\bfseries}

\titlespacing{\section}{\parindent}{0pt}{0pt}
\titleformat{\section}[block]{\bfseries\normalsize}{\thesection.~}{0pt}{\hyperlink{sec:contents}{#1}}
\titlespacing{name=\section,numberless}{\parindent}{0pt}{0pt}
\titleformat{name=\section,numberless}[block]{\bfseries\normalsize}{}{0pt}{\phantomsection\addcontentsline{toc}{section}{#1}\hyperlink{sec:contents}{#1}}
\titlespacing{\subsection}{\parindent}{0pt}{0pt}
\titleformat{\subsection}[block]{\bfseries\normalsize}{\thesubsection.~}{0pt}{\hyperlink{sec:contents}{#1}}
\titlespacing{name=\subsection,numberless}{\parindent}{0pt}{0pt}
\titleformat{name=\subsection,numberless}[block]{\bfseries\normalsize}{}{0pt}{\phantomsection\addcontentsline{toc}{section}{#1}\hyperlink{sec:contents}{#1}}
\titlespacing{\subsubsection}{\parindent}{0pt}{0pt}
\titleformat{\subsubsection}[block]{\bfseries\normalsize}{\thesubsubsection.~}{0pt}{\hyperlink{sec:contents}{#1}}
\titlespacing{name=\subsubsection,numberless}{\parindent}{0pt}{0pt}
\titleformat{name=\subsubsection,numberless}[block]{\bfseries\normalsize}{}{0pt}{\phantomsection\addcontentsline{toc}{section}{#1}\hyperlink{sec:contents}{#1}}

\renewcommand{\abstracttextfont}{\normalfont\normalsize}
\setlength{\absleftindent}{0pt}
\setlength{\absrightindent}{0pt}
\setlength{\abstitleskip}{\lineskip}
\renewcommand{\abstitlestyle}[1]{\section*{#1}}

\setlist[itemize]{leftmargin=1.5\parindent,itemsep=-1ex}
\setlist[enumerate]{leftmargin=1.5\parindent,itemsep=-1ex}