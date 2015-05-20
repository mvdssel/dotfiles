LaTeX
=====
TeX in Keynote / TextEditor / ...
---------------------------------
    $ brew cask install latexit

inhoudsopgave
-------------
[source](http://www.andy-roberts.net/writing/latex/contents)

Om de lijst te printen:

    \tableofcontents

Hoe diep moeten delen worden weergegeven?

    \setcounter{tocdepth}{1}

Alternatieve lijsten:

    \listoffigures
    \listoftables

Als je een ster gebruikt, dan zal deze geen nummering krijgen en niet
worden opgenomen in de TOC. Wil je deze toch opnemen, dan maak je gebruik
van:

    \section*{Geen nummering}
    \addcontentsline{type}{section_level}{entry}

Bijvoorbeeld:

    \section*{Preface}
    \addcontentsline{toc}{section}{Preface}

Lijst van afkortingen
---------------------
Benodigde package:

    \usepackage{nomencla}

LaTeX constructie van lijst:

    \makenomenclature

Waar je de lijst wilt weergeven: (optie past interlinie afstand aan?)

    \printnomenclature[5em]

Bij afkortingen:

    \nomenclature{Resource Description Framework}{RDF}

Opties:

    \renewcommand{\nomname}{Nieuwe titel}
    \newcommand{\nom}[2]{#1 (#2)\nomenclature{#1}{#2}}

Index (register)
----------------

    \usepackage{makeidx}
    \makeindex
    Dit woord \index{woord} moet in de index.
    \printindex

PDF Hyperlinks & Bookmarks
--------------------------
hyperref is the package that adds clickable links for the table of
contents and all the internal references in the document into the
produced PDF file. The bookmarks option adds the bookmarks too
into the PDF.

    \usepackage[bookmarks]{hyperref}

documentclass
-------------
makes LaTeX indicate hyphenation and justification problems with a
small square in the right-hand margin of the problem line so they
can be located quickly by a human. It also suppresses the inclusion
of images and shows only a frame where they would normally occur.

    \documentclass[draft]{...}

Subfigure in Beamer
-------------------

    \documentclass{beamer}
    \usepackage[caption=false]{subfig}

    \begin{document}

    \begin{frame}
        \begin{figure}
            \centering
            \subfloat[First subfigure\label{fig:a}]{\textcolor{blue}{\rule{3cm}{3cm}}}\quad
            \subfloat[Second subfigure\label{fig:b}]{\textcolor{blue}{\rule{3cm}{3cm}}}
            \caption{A figure}
            \label{fig:1}
        \end{figure}
    \end{frame}

    \end{document}

graphicx
--------
Dit zorgt ervoor dat er geen afbeeldingen gerenderd worden en
bijgevolg het compilatieproces versneld wordt.

    \usepackage[final|draft]{graphicx}

Zort ervoor dat latex automatisch in de opgegeven directories gaat
zoeken bij het invoegen van figuren. Hierdoor moet je niet meer het
volledige pad opgeven bij het invoegen van figuren.

    \graphicspath{{figuren/}{nog_een_dir_met_figuren/}}

Zorgt voor automatische plaatsing van figuren door latex.

    \begin{figure}
        \includegraphicx{afbeelding.jpg}
    \end{figure}

caption
-------
Zort voor mooie captions.

    \usepackage[small,bf,hang]{caption}

bibliografische verwijzingen
----------------------------
Voor auteur-jaar citaties (van Dessel, 1992).

    \usepackage[round]{natbib}

Compileren van document met bibtex-databank.

    $ bibtex naam-van-ons-document-zonder-extensie

voetnoot
--------

    \footnote{mijn voetnoot}

