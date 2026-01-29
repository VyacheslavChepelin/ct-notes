#import "../template.typ":*
#import "@preview/mitex:0.2.6": *

= Аксиома выбора

#def[def:] *Аксиома выбора*.Из любого семейства дизъюнктных непустых множеств $cal(A)$ можно выбрать непустую трансверсаль --- 
множество $S$, что $|S union A| = 1$ для каждого $A in cal(A)$. Иначе, $S in times cal(A)}$.

Теорема: функциональный вариант аксиомы выбора

#theorem(title:[Функциональный вариант аксиомы выбора], body:[
  Пусть $cal(A)$ --- семейство непустых множеств.
  
  Тогда существует $f : cal(A) -> union cal(A)$, причём $forall a.a  in   cal(A) -> f(a)  in   a$
], proof:[
  Пусть $X(A) = {chevron.l A, a chevron.r | a  in   A }$, 
по семейству $cal(A)$ рассмотрим ${X(A) | A in  cal(A)}$
- непустых: если $A in  cal(A)$, $A eq.not nothing$, то $X(A) eq.not nothing$;
- дизъюнктное: если $A_0,A_1 in  cal(A)$, $A_0 eq.not A_1$, то $X(A_0) inter X(A_1) = nothing$

тогда по аксиоме выбора $exists f.f  in   times cal(A)$.
])

#theorem(name:[Теорема. Лемма Цорна], body:[
  Если задано $chevron.l M, (prec.eq) chevron.r$ и для всякого линейно упорядоченного $S subset.eq M$ выполнено
$"upb"_M S eq.not nothing$, то в $M$ существует максимальный элемент.
])

#theorem(name:[Теорема Цермело], body:[
  На любом множестве можно задать полный порядок.
])
#theorem(name:[Теорема], body:[
  У любой сюръективной функции существует частичная обратная.
])
#theorem(name:[Теорема], body:[
  Аксиома выбора $->$ лемма Цорна: без доказательства.
])

Назовём (для данного раздела) упорядоченным множеством пару $chevron.l S, (prec_S)chevron.r$. Отношение порядка $(prec_S)$ может быть как строгим, так и нестрогим.

#def[def:]  Будем говорить, что $chevron.l S, (prec_S)chevron.r$ --- *начальный отрезок* $chevron.l T, (prec_T) chevron.r$,
если:
- $S subset.eq T$;
- если $a,b  in   S$, то $a prec_S b$ тогда и только тогда, когда $a prec_T b$;
- если $a  in   S$, $b  in   T without  S$, то $a prec_T b$.

Будем обозначать это как $chevron.l S, (prec_S)chevron.r subset.sq.eq   chevron.l T, (prec_T)chevron.r$ или как $S  subset.sq.eq  T$, если порядок на множествах понятен из контекста.

#theorem(body:[
Отношение "быть начальным отрезком" является отношением нестрогого порядка.
])

#theorem(name:[Теорема о верхней грани],body:[
  Если семейство упорядоченных множеств $X$ линейно упорядочено отношением "быть начальным отрезком", то у него есть верхняя грань.
], proof:[
  Пусть $M = union { T |chevron.l T, (prec) chevron.r  in   X }$ и
$(prec)_M = union { (prec) |chevron.l T, (prec) chevron.r  in   X }$.

Покажем, что если $chevron.l A, (prec_A)chevron.r  in   X$, то $A  subset.sq.eq  M$.

Рассмотрим определение:
- $A subset.eq M$ --- выполнено по построению $M$;
- если $a,b  in   A$, то $a prec_A b$ влечёт $a prec_M b$ (по построению $M$). Если же $a prec_M b$, но $a prec.not_A b$, то существует $A'$, что $a,b  in   A'$ и $a prec_{A'} b$. Тогда $A subset.sq.eq.not  A'$ и $A' subset.sq.eq.not  A$, что невозможно по линейности порядка;
- если $a  in   A$, $b  in   M without  A$, то найдётся $B$, что $b in   B$, отчего $a prec_B b$ (так как $A  subset.sq.eq  B$)  и $a prec_M b$ (по построению $M$).
  Тогда $chevron.l M, (prec_M)chevron.r$ --- требуемая верхняя грань.
])

#theorem(body:[
Лемма Цорна $->$ теорема Цермело  
], proof:[
Пусть $S = {chevron.l P, (prec)chevron.r  | P subset.eq X, (prec)" --- полный порядок" }$.

Например, для $X = \{0,1\}$ множество
$S = \{
chevron.l nothing,nothing chevron.r,
chevron.l \{0\},nothing chevron.r,
chevron.l\{1\},nothing chevron.r,
chevron.l X, 0 prec 1 chevron.r,
chevron.l X, 1 prec 0 chevron.r
\}$

Введём порядок на $S$ как $( subset.sq.eq)$. Заметим, что это --- частичный, но не линейный порядок. 

Например, $chevron.l X, 0 prec 1chevron.r$ несравним с $chevron.l X, 1 prec 0chevron.r$.

По теореме о верхней грани любое линейно упорядоченное подмножество 
$chevron.l T, ( subset.sq.eq) chevron.r$ (где $T subset.eq S$) имеет
верхнюю грань.

Например, 
для $\{chevron.l nothing,nothing chevron.r,
chevron.l \{0\},nothing chevron.r,
chevron.l X, 0 prec 1 chevron.r\}$ это $chevron.l X, 0 prec 1 chevron.r$.

По лемме Цорна тогда есть $chevron.l R, ( subset.sq.eq_R)chevron.r = max S$. Заметим, что $R = X$, потому что иначе пусть
$a  in   X without  R$. Тогда положив $M =chevron.l R union{a}, ( subset.sq.eq subset.eq_R)union{x prec a | x  in   R} chevron.r$
получим, что $M$ тоже вполне упорядоченное (и потому $M  in   S$), значит, $R$ не максимальное. 




])

#theorem(body:[Теорема Цермело $->$ у сюръективных функций существует частичная обратная.], proof:[
  
Рассмотрим сюръективную $f: A -> B$. Рассмотрим семейство $R_b = { a  in   A | f(a) = b}$.
Построим полный порядок на каждом из $R_b$. Тогда $f^{-1}(b) = min R_b$.
  
])

#theorem(body:[Существует частичная обратная у сюръективных функций $->$ существует трансверсаль у семейства непустых дизъюнктных множеств.], proof:[
Пусть дано семейство непустых дизъюнктных множеств $cal(A)$. 
Рассмотрим $f: union cal(A) -> cal(A)$, что
$f(a) = union{ A  in   cal(A) | a  in   A }$. Поскольку элементы $cal(A)$ дизъюнктны,
$f(a)  in   cal(A)$ при всех $a$. Тогда существует $f^{-1}: cal(A) -> union cal(A)$. Тогда 
${ f^{-1}(A) | A in  cal(A) }  in   times cal(A)$.
], )
