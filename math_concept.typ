// ============================================================
// 수학 개념 정리표 — 개념 2~3개, 정의 + 핵심 공식
// ============================================================

#set page(paper: "a4", margin: (x: 1.0cm, y: 1.0cm))
#set text(
  font: ("Noto Sans CJK KR", "Malgun Gothic", "Noto Sans KR", "sans-serif"),
  size: 10pt, lang: "ko",
)

// rect 기반 필기줄 (높이 보장)
#let wline() = rect(width: 100%, height: 0.5pt, fill: rgb("#c0c0c0"), stroke: none)
#let ufield(w: 80pt) = box(width: w, stroke: (bottom: 0.9pt + black), inset: (bottom: 4pt))[]

// 개념명 헤더 (38pt 고정)
#let concept-header(num) = block(
  width: 100%, height: 38pt,
  fill: rgb("#f5f5f5"),
  inset: (x: 14pt, top: 0pt, bottom: 0pt),
)[
  #v(12pt)
  #grid(
    columns: (auto, 1fr),
    align: horizon,
    text(weight: "bold", size: 12pt)[개념 #num],
    pad(left: 10pt)[
      #block(width: 100%, stroke: (bottom: 0.9pt + black), inset: (bottom: 3pt))[]
    ],
  )
]

// 정의 섹션 (130pt 고정)
#let def-block(h: 130pt) = block(
  width: 100%, height: h,
  fill: rgb("#f0f4ff"),
  inset: (x: 12pt, top: 9pt, bottom: 0pt),
)[
  #text(size: 8pt, weight: "bold", fill: rgb("#3949ab"))[📖 정의 / 설명]
  #v(7pt)
  #wline() #v(19pt) #wline() #v(19pt) #wline() #v(19pt) #wline() #v(19pt) #wline() #v(19pt) #wline()
]

// 공식 섹션 (201pt 고정)
#let formula-block(h: 201pt) = block(
  width: 100%, height: h,
  fill: rgb("#fff8e1"),
  inset: (x: 12pt, top: 9pt, bottom: 0pt),
)[
  #text(size: 8pt, weight: "bold", fill: rgb("#f57f17"))[✏️ 핵심 공식]
  #v(7pt)
  #wline() #v(19pt) #wline() #v(19pt) #wline() #v(19pt) #wline() #v(19pt)
  #wline() #v(19pt) #wline() #v(19pt) #wline() #v(19pt) #wline() #v(19pt) #wline() #v(19pt) #wline()
]

// ---------- 세로형 개념 블록 (개념 1, 2) — 370pt ----------
// header(38) + 정의(130) + divider(1) + 공식(201) = 370pt
#let concept-v(num) = block(
  width: 100%, height: 100%,
  stroke: 1pt + rgb("#d0d0d0"),
  radius: 8pt, clip: true,
)[
  #concept-header(num)
  #line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))
  #def-block(h: 130pt)
  #line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))
  #formula-block(h: 201pt)
]

// ---------- 가로형 개념 블록 (개념 3) — 340pt ----------
// header(38) + 2col grid(302pt) = 340pt
#let concept-h(num) = block(
  width: 100%, height: 340pt,
  stroke: 1pt + rgb("#d0d0d0"),
  radius: 8pt, clip: true,
)[
  #concept-header(num)
  #line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))
  #grid(
    columns: (1fr, 1.6fr),
    rows: (302pt,),
    column-gutter: 0pt,
    // 정의 (좌)
    block(width: 100%, height: 302pt, fill: rgb("#f0f4ff"),
      inset: (x: 12pt, top: 9pt, bottom: 0pt),
    )[
      #text(size: 8pt, weight: "bold", fill: rgb("#3949ab"))[📖 정의 / 설명]
      #v(7pt)
      #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt)
      #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt)
      #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt) #wline()
    ],
    // 공식 (우)
    block(width: 100%, height: 302pt, fill: rgb("#fff8e1"),
      stroke: (left: 0.5pt + rgb("#e0e0e0")),
      inset: (x: 12pt, top: 9pt, bottom: 0pt),
    )[
      #text(size: 8pt, weight: "bold", fill: rgb("#f57f17"))[✏️ 핵심 공식]
      #v(7pt)
      #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt)
      #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt)
      #wline() #v(21pt) #wline() #v(21pt) #wline() #v(21pt) #wline()
    ],
  )
]

// ============================================================
// 페이지 레이아웃
// ============================================================

#let page-content() = {
  // 헤더
  grid(
    columns: (1fr, auto, auto, auto),
    align: horizon,
    column-gutter: 12pt,
    text(size: 14pt, weight: "bold")[📐 수학 개념 정리표],
    [단원: #ufield(w: 90pt)],
    [날짜: #ufield(w: 70pt)],
    [이름: #ufield(w: 60pt)],
  )
  v(8pt)

  // 상단: 개념 1 & 2 (2열, 370pt)
  grid(
    columns: (1fr, 1fr),
    rows: (370pt,),
    column-gutter: 10pt,
    concept-v(1),
    concept-v(2),
  )
  v(7pt)

  // 하단: 개념 3 (전체 폭, 340pt)
  concept-h(3)
}

// 양면 인쇄용 2페이지
#page-content()
#pagebreak()
#page-content()
