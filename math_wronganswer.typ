// ============================================================
// 수학 오답 노트 — 문제 1개 깊이 분석
// ============================================================

#set page(paper: "a4", margin: (x: 1.0cm, y: 1.0cm))
#set text(
  font: ("Noto Sans CJK KR", "Malgun Gothic", "Noto Sans KR", "sans-serif"),
  size: 10pt, lang: "ko",
)

#let wline() = rect(width: 100%, height: 0.5pt, fill: rgb("#c0c0c0"), stroke: none)
#let ufield(w: 80pt) = box(width: w, stroke: (bottom: 0.9pt + black), inset: (bottom: 4pt))[]

// ============================================================
// 페이지 레이아웃
// ============================================================

#let page-content() = {
  // 헤더
  grid(
    columns: (1fr, auto, auto, auto),
    align: horizon,
    column-gutter: 12pt,
    text(size: 14pt, weight: "bold")[✏️ 수학 오답 노트],
    [출처: #ufield(w: 90pt)],
    [날짜: #ufield(w: 70pt)],
    [이름: #ufield(w: 60pt)],
  )
  v(8pt)

  // 문제 공간 (240pt)
  block(
    width: 100%, height: 240pt,
    fill: rgb("#fff5f5"),
    stroke: 0.9pt + rgb("#ef9a9a"),
    radius: 8pt,
    inset: (x: 14pt, top: 10pt, bottom: 0pt),
  )[
    #text(size: 9pt, weight: "bold", fill: rgb("#c62828"))[📋 문제]
    #v(8pt)
    #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
    #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
    #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline()
  ]
  v(8pt)

  // 내 풀이 | 왜 틀렸나 (2열, 400pt)
  grid(
    columns: (1.8fr, 1fr),
    rows: (400pt,),
    column-gutter: 10pt,
    // 내 풀이 (오답)
    block(
      width: 100%, height: 400pt,
      fill: rgb("#fff8f0"),
      stroke: 0.9pt + rgb("#ffb74d"),
      radius: 8pt,
      inset: (x: 14pt, top: 10pt, bottom: 0pt),
    )[
      #text(size: 9pt, weight: "bold", fill: rgb("#e65100"))[❌ 내 풀이 (오답)]
      #v(8pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline()
    ],
    // 왜 틀렸나
    block(
      width: 100%, height: 400pt,
      fill: rgb("#f0f4ff"),
      stroke: 0.9pt + rgb("#90caf9"),
      radius: 8pt,
      inset: (x: 14pt, top: 10pt, bottom: 0pt),
    )[
      #text(size: 9pt, weight: "bold", fill: rgb("#1565c0"))[💡 왜 틀렸나?]
      #v(8pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt)
      #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline() #v(17pt) #wline()
    ],
  )
  v(8pt)

  // 재도전 체크박스 (~60pt)
  block(
    width: 100%,
    fill: rgb("#f1f8e9"),
    stroke: 1.2pt + rgb("#43a047"),
    radius: 8pt,
    inset: (x: 18pt, y: 14pt),
  )[
    #text(size: 10pt, weight: "bold", fill: rgb("#2e7d32"))[🔄 재도전]
    #h(20pt)
    #text(size: 9.5pt)[
      □ 1차 #h(4pt) #ufield(w: 55pt) #h(20pt)
      □ 2차 #h(4pt) #ufield(w: 55pt) #h(20pt)
      □ 3차 #h(4pt) #ufield(w: 55pt) #h(20pt)
      □ 완전 정복! ✓
    ]
  ]
}

// 양면 인쇄용 2페이지
#page-content()
#pagebreak()
#page-content()
