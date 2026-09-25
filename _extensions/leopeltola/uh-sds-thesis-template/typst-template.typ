#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  lang: "en",
  region: "US",
  font: "libertinus serif",
  fontsize: 11pt,
  sectionnumbering: none,
  pagenumbering: "1",
  toc: false,
  toc_title: "Table of Contents",
  toc_depth: none,
  toc_indent: 1.5em,
  
  // Custom structural inputs mapped via typst-show.typ
  major-track: none,
  supervisor: none,
  location: none,
  keywords: none,
  logo-path: none,
  
  doc,
) = {
  // --- GLOBAL DOCUMENT CONFIGURATION ---
  set page(
    paper: "a4",
    margin: (top: 3cm, bottom: 3cm, left: 3.5cm, right: 2.5cm),
    numbering: none, // Explicitly start with no page numbers for page 1 & 2
  )
  set par(justify: true, leading: 0.75em)
  set text(lang: lang, region: region, font: font, size: fontsize)
  set heading(numbering: sectionnumbering)
  show heading: it => block(below: 1.2em, above: 1.8em)[#it]

  // --- PAGE 1: COVER PAGE ---
  place(top + left, dx: -5mm, dy: -5mm)[
    #if logo-path != none {
      image(logo-path, width: 32%)
    }
  ]
  
  // Center Title & Subtitle
  align(center + horizon)[
    #block(width: 85%)[
      #text(size: 24pt, weight: "bold")[#title]
      #if subtitle != none {
        v(1cm)
        text(size: 16pt, style: "italic", fill: gray.darken(40%))[#subtitle]
      }
    ]
  ]
  
  // Right-aligned Metadata Info
  align(bottom + right)[
    #block(spacing: 1.2em)[
      #set text(size: 11pt, weight: "regular")
      #grid(
        columns: 1,
        gutter: 0.8em,
        align: right,
        [Author: #strong(authors)],
        if major-track != none [Track: #major-track],
        if supervisor != none [Supervisor: #supervisor],
        [Date: #date],
        if location != none [#location]
      )
    ]
  ]
  
  pagebreak()

  // --- PAGE 2: INFO & ABSTRACT PAGE ---
  align(top + left)[
    #block(spacing: 1.5em)[
      #text(size: 16pt, weight: "bold")[#title]
      #v(0.5em)
      #grid(
        columns: (auto, 1fr),
        row-gutter: 0.8em,
        column-gutter: 1.5em,
        [*Author:*], [#authors],
        [*Date:*], [#date],
        [*Keywords:*], [#if keywords != none {keywords} else [---]]
      )
    ]
    
    #v(2cm)
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(1cm)
    
    #text(size: 13pt, weight: "bold")[Abstract]
    #v(0.5em)
    #if abstract != none {
      abstract
    } else {
      [No abstract provided.]
    }
  ]
  
  pagebreak()

  // --- PAGE 3: TABLE OF CONTENTS ---
  if toc {
    align(top + left)[
      #outline(
        title: if toc_title != none { toc_title } else { "Table of Contents" },
        depth: toc_depth,
        indent: toc_indent
      )
    ]
    pagebreak()
  }

  // --- MAIN CONTENT RULES (Resets pagination for actual body pages) ---
  set page(
    numbering: pagenumbering,
    header: context {
      // Modern context-aware page matching
      if here().page() > 2 {
        align(right)[#text(size: 8pt, fill: gray)[#title]]
      }
    }
  )
  counter(page).update(1) // Forces body page to physically show up as Page 1

  doc
}

// Clean aesthetic rules for tables
#set table(
  inset: 7pt,
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black) } else { (bottom: 0.5pt + gray.lighten(50%)) }
)