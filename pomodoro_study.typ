// ============================================================
// 뽀모도로 공부 기록표 — 15분 공부 + 15분 휴식 × 4세션
// ============================================================

#set page(
  paper: "a4",
  margin: (x: 1.0cm, y: 1.0cm),
)

#set text(
  font: ("Noto Sans CJK KR", "Malgun Gothic", "Noto Sans KR", "sans-serif"),
  size: 10pt,
  lang: "ko",
)

// ---------- 헬퍼 ----------

#let hline() = line(length: 100%, stroke: 0.45pt + rgb("#cccccc"))

#let underline-field(w: 80pt) = box(
  width: w,
  stroke: (bottom: 0.9pt + black),
  inset: (bottom: 4pt, x: 2pt),
)[]

// ---------- 세션 블록 (study: 236pt + 1pt divider + rest: 41pt = 278pt) ----------

#let session-block(num) = block(
  width: 100%,
  height: 100%,
  radius: 9pt,
  clip: true,
  stroke: 1pt + rgb("#d0d0d0"),
)[
  // 공부 영역 — 고정 높이로 배경색 꽉 채움
  #block(
    width: 100%,
    height: 188pt,
    fill: rgb("#fff8f8"),
    inset: (x: 14pt, top: 11pt, bottom: 0pt),
  )[
    #grid(
      columns: (auto, 1fr, auto),
      align: horizon,
      text(size: 20pt)[🍅],
      pad(left: 8pt)[#text(weight: "bold", size: 12pt)[세션 #num]],
      text(size: 8.5pt, fill: rgb("#c0392b"), weight: "bold")[📚 공부 15분],
    )
    #v(11pt)
    #hline() #v(19pt)
    #hline() #v(19pt)
    #hline() #v(19pt)
    #hline() #v(19pt)
    #hline() #v(19pt)
    #hline() #v(19pt)
    #hline() #v(19pt)
    #hline()
  ]

  // 구분선
  #line(length: 100%, stroke: 0.6pt + rgb("#e0e0e0"))

  // 휴식 영역 — 고정 높이
  #block(
    width: 100%,
    height: 41pt,
    fill: rgb("#f4fff8"),
    inset: (x: 14pt, y: 0pt),
  )[
    #v(12pt)
    #text(size: 18pt)[🎮]
    #text(size: 8.5pt, fill: rgb("#27ae60"))[ 휴식 15분 — 충분히 쉬어요! ☺]
  ]
]

// ============================================================
// 페이지 레이아웃 (함수로 감싸서 2페이지 복사)
// ============================================================

#let page-content() = {

// 헤더
grid(
  columns: (1fr, auto, auto),
  align: horizon,
  column-gutter: 14pt,
  text(size: 15pt, weight: "bold")[🍅 뽀모도로 공부 기록표],
  [날짜: #underline-field(w: 80pt)],
  [이름: #underline-field(w: 70pt)],
)

v(9pt)

// 4세션 그리드 (2×2)
grid(
  columns: (1fr, 1fr),
  rows: (230pt, 230pt),
  column-gutter: 10pt,
  row-gutter: 10pt,
  session-block(1),
  session-block(2),
  session-block(3),
  session-block(4),
)

v(10pt)

// 수업 리뷰 섹션
block(
  width: 100%,
  stroke: 1.3pt + rgb("#3498db"),
  radius: 9pt,
  inset: (x: 16pt, y: 13pt),
)[
  #text(size: 12pt, weight: "bold", fill: rgb("#2980b9"))[📝 오늘 수업 리뷰]
  #v(9pt)
  #grid(
    columns: (1.6fr, 1fr, 1fr),
    column-gutter: 20pt,
    align: top,
    [
      #text(size: 9pt, weight: "bold")[✏️ 오늘 배운 것]
      #v(7pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline()
    ],
    [
      #text(size: 9pt, weight: "bold")[⭐ 잘된 점]
      #v(7pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline()
    ],
    [
      #text(size: 9pt, weight: "bold")[💭 아쉬운 점]
      #v(7pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline() #v(15pt)
      #hline()
    ],
  )
]
} // end page-content

// 1페이지
#page-content()

// 2페이지 (양면 인쇄용 복사)
#pagebreak()
#page-content()
