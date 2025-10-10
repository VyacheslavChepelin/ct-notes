#let template(
  author: none, 
  teacher: none, 
  course: none, 
  doc
) = {
  set text(lang: "ru")
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2cm, left: 1.5cm, right: 1.5cm),
    header: 
      box(
        width: 100%,
        inset: 10pt,
        stroke: (bottom: 1pt + black),
        grid(
          columns: (1fr, 2fr, 1fr),
          align: (left, center, right),
          link("https://vyacheslavchepelin.github.io/ct-notes/", [*CT Notes*]),
          text(weight: "medium", course),
          teacher,
        )
      ),
    numbering: "1",
  )
  
  set heading(numbering: "1.")

  show link: content => {underline(text(blue, content))}

  set quote(block: true, quotes: true)
  show quote: set align(center)
  
  context {
    set page(header: none, footer: none, numbering: none)
    align(center + horizon, text(16pt, weight: "bold", course))
    v(2cm)
    align(center, text(12pt)[Автор: #author])
    v(1cm)
  }
  pagebreak()
  outline()
  pagebreak()
  doc
}

#let statement(
  name: none,
  fill: none,
  frame: none,
  title: none,
  body: none,
  proof: none,
  stroke: none,
  qed: false,
  after: none
) = {
  block(
    width: 100%,
    fill: fill,
    
    stroke: (left: 2pt + frame),
    inset: 6pt,
    radius: 4pt,
    {
      text(weight: "bold", size: 1.15em, {
        underline({
          name
          if name != none [.]
        })
        if title != none [ #title]
      })
      if title != none or name != none {
        linebreak()
      }
      body
      if proof != none {
        v(0.5em)
        text(weight: "bold", size: 1.2em)[Доказательство:]
        linebreak()
      }
      proof
      if proof != none or qed {
        align(right)[*Q.E.D.*]
      }
      if after != none {
        v(0.5em)
      }
      after
    }
  )
}


#let theorem = statement.with(name: "Теорема", fill: rgb(245, 245, 255), frame: blue)
#let lemma = statement.with(name: "Лемма", fill: rgb(245, 245, 255), frame: green)
#let corollary = statement.with(name: "Следствие", fill: rgb(245, 255, 255), frame: aqua)
#let remark = statement.with(name: "Замечание", fill: rgb(250, 245, 255), frame: purple)
#let definition = statement.with(name: "Определение", fill: rgb("#E4EFFF"))
#let example = statement.with(name: "Пример", frame: black, fill: rgb("#F0F0FF"))
#let property = statement.with(name: "Свойство", fill:rgb("#F0F0FF"), frame: blue)
#let proof = statement.with(name: "Доказательство", fill: rgb(255, 245, 255), frame: fuchsia, qed: true)


#let proof = statement.with(name: "Доказательство",  frame: fuchsia, qed: true)

#let divides = $med dots.v med$
 #let def(body) = [#underline[*#body*]]
 #let smile = text(size: 3em, "\u{263a}")
 #let prod = $display(limits(product))$
#let double = $space space$
#let make = sym.supset.sq
#let see = $angle.spheric space$
#let dp(first, second)=$angle.l #first, #second angle.r$
#let sum=$limits(sum)$
#let lim=$limits(lim)$
#let proof=par(strong("Доказательство:"))
#let th=strong("Теорема:")
#let lm=strong("Лемма:")
#let defnot = strong("Обозначение:")
#let nb = strong("Замечание: ")
#let int=$display(integral)$
#let emptyset=$diameter$
#let qed=$space qed$
#let note=strong("Замечание:")
#let cor(..number)= {
  if number.pos().len() == 0 {
    strong("Следствие:")
  }
  else {
    strong("Следствие " + str(number.pos().at(0)) + ":")
  }
}


#let dx = $dif x$
#let dy = $dif y$
#let dv = $dif v$
#let dz = $dif z$
#let dt = $dif t$
#let algebra = $cal(a)$
#let limsup = $overline(lim)$
#let liminf = $underline(lim)$
#let smile = emoji.face.smile.slight
#let frown = emoji.face.frown.slight
#let wink = emoji.face.wink
#let pole(a, b) = $lr(|, size: #200%)_#pad(bottom: -13pt)[$#a$]^#pad(top: -13pt)[$#b$]$

#let gr(body) = text(fill: gray)[#body]
#let wh(body) = text(fill: white)[#body]
#let eps = $epsilon$

#let Lin(first, second) = $"Lin"(#first, #second)$
#let von = v(0.1cm)
#let vtw = v(0.2cm)
#let vth = v(0.3cm) 
#let vfo = v(0.4cm)
#let vfi = v(0.5cm)

#let Re = "Re"
#let Im = "Im"

#let list_depth = counter("list_depth")
#let clist_cnt = counter("clist_cnt")
#let clist = [
  #context clist_cnt.step()
]
#let llist = [
  #context clist_cnt.update(0)
]
#show enum: it => [
  #context list_depth.step()
  #it
  #context list_depth.update(0)
]
#show enum: it => [
  #context if (list_depth.get() == (0, )) and (clist_cnt.get() == (1, )) {
  table(columns: (1fr, auto, 1fr), inset: 0pt, stroke: none, [], [#it], [])
} else {
    [#it]
}
]
#show math.equation.where(block: true): e => box(width: 100%, inset: 0em, [
  #set align(center)
  #e
])
























#let statement_(
  name: none,
  fill: none,
  frame: none,
  title: none,
  body: none,
  proof: none,
  stroke: none,
  qed: false,
  after: none
) = {
  block(
    width: 100%,
    fill: fill,
    //stroke: (left: 2pt + frame),
    //inset: 4pt,
    radius: 4pt,
    {
      text(weight: "bold", size: 1.15em, {
        underline({
          name
          if name != none []
        })
        if title != none [ #title]
      })
      if title != none or name != none {
        linebreak()
      }
      body
      if proof != none {
        v(0.5em)
        text(weight: "bold", size: 1.2em)[Доказательство:]
        linebreak()
      }
      proof
      if proof != none or qed {
        align(right)[*Q.E.D.*]
      }
      if after != none {
        v(0.5em)
      }
      after
    }
  )
}

#let theorem_ = statement_.with(name: "Теорема", fill: rgb(255, 255, 255), frame: blue)
#let lemma_ = statement_.with(name: "Лемма", fill: rgb(245, 255, 245), frame: green)
#let corollary_ = statement_.with(name: "Следствие", fill: rgb(245, 255, 255), frame: aqua)
#let remark_ = statement_.with(name: "Замечание", frame: purple)

#let definition_ = statement_.with(name: "Определение.",  frame: black)
#let property_ = statement_.with(name: "Свойство:", frame: black)
#let example_ = statement_.with(name: "Пример.", frame: black)
#let proof_ = statement_.with(name: "Доказательство",  frame: fuchsia, qed: true)