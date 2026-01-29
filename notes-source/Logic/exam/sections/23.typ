#import "../template.typ":*
#import "@preview/mitex:0.2.6": *

= Индукция

#def[def:] *Принцип математической индукции*. 

Какое бы ни было $phi(x)$, если $phi(0)$ и при всех $x$ выполнено $phi(x)-> phi(x')$, то
при всех $x$ выполнено и само $phi(x)$.

#def[def:] *Принцип полной математической индукции*

Какое бы ни было $psi(x)$, если $psi(0)$ и при всех $x$ выполнено $( forall  t.t  <= x -> psi(t))-> psi(x')$, то
при всех $x$ выполнено и само $psi(x)$.

#def[def:] Назовём вполне упорядоченное отношением $( in)$ множество $S$ *наследственным подмножеством* $A$, если 
$ forall  x.x  in A -> ( forall  t.t  in x -> t  in S) -> x  in S$.

#theorem(body:[
  Единственным наследственным подмножеством вполне упорядоченного множества является оно само.
], proof:[
  Пусть $B  subset.eq  A$ --- наследственное и $B eq.not A$.
Тогда существует $a =  min (A  without  B)$. Тогда $( forall  t.t  in a -> t  in B) -> a  in B$ по наследственности $B$,
и выполнено $ forall  t.t  in a -> t  in B$ (по минимальности $a$). Значит, $a  in B$.

])

#theorem(name:[ Ограниченная трансфинитная индукция],body:[
Если для $phi(x)$ (некоторого утверждения теории множеств) и некоторого ординала $eps$ (ограничения) выполнено
$forall  x.x  in  eps  -> ( forall  t.t  in x -> phi(t)) -> phi(x)$,
то $ forall  x.x  in  eps  -> phi(x)$.
],proof:[
  Рассмотрим $S = { x in  eps  | phi(x) }$. Тогда $x  in S$ равносильно 
$x in eps \& phi(x)$.
Тогда перепишем: $ forall  e.e  in  eps  -> ( forall  x.x  in e -> x  in S) -> e  in S$.
Отсюда по теореме о наследственных множествах $S =  eps $.
])

#theorem(name:[ Неограниченная трансфинитная индукция],body:[
Если для $phi(x)$ (некоторого утверждения теории множеств) выполнено
$ forall  x."ординал"(x) -> ( forall  t.t  in x -> phi(t)) -> phi(x)$,
то $ forall  x."ординал"(x) -> phi(x)$.

*ИЛИ*

Для ординала $eps$ подмножество $S  in  eps $ --- наследственное, если и только если одновременно:
- Если $x  in  eps $ и $x = nothing$, то $x  in S$;
- Если $x  in  eps $ и существует $y$: $y' = x$, то $y  in S -> x  in S$;
- Если $x  in  eps $ и $x$ --- предельный, то $( forall  t.t  in x -> t  in S) -> (x  in S)$.

],proof:[
$(->)$ очевидно. Докажем $(<=)$: пусть $S$ не наследственное: 
$E := {e  in  eps   |  ( forall  t.t  in e -> t  in S) \&e in.not  S }$
и $E eq.not nothing$. Тогда пусть $e =  min E$.

1. $e = nothing$ или предельный. Тогда $( forall  t.t  in e -> t  in S) -> (e  in S)$.
2. $e = y'$. Тогда $y  in  eps $ ($ eps $ --- ординал) и 
$( forall  t.t  in y -> t  in S) -> (y  in S)$ (так как $e$ минимальный, для которого $S$ не наследственное).
По условию, $(y  in S) -> (e  in S)$, отсюда $( forall  t.t  in e -> t  in S) -> (e  in S)$.

])

#theorem(body:[
 Если $alpha$ --- кардинальное число, $alpha >= aleph_0$, 
то $alpha dot  alpha = alpha$.  
], proof:[
  Трансфинитная индукция: $phi(x) := x < omega or x  dot   x = x$

1. База: $x = nothing$. Тогда 
$phi(nothing) equiv nothing < omega or |nothing times nothing| = nothing$,
что доказуемо.
2. Переход: $ forall  y.y < x -> phi(y)$, тогда $phi(x)$. Три случая:
   1. $x < omega$. Тогда $phi(x)$ истинно (аналогично базе).
   2. $x = omega$. Счётный случай (рассмотрим отдельно).
   3. $x > omega$. Общий случай (рассмотрим отдельно).

Счётный случай: $omega < omega or |omega  dot   omega| = omega$

Тогда $omega times omega$ упорядочим так: $chevron.l p,q chevron.r prec chevron.l s,t chevron.r$,
если:
1. $max(p,q) < max(s,t)$
2. $max(p,q) = max(s,t)$ и $q < t$
3. $max(p,q) = max(s,t)$, $q = t$ и $p < s$

Очевидно, можно построить биекцию между так упорядоченными значениями и $omega$.


Общий случай: $|alpha  dot   alpha| = alpha$ TODO

Аналогично счётному случаю, $alpha  times  alpha$ упорядочим так: $chevron.l p,q chevron.r prec chevron.l s,t chevron.r$,
если:
1. $p  union q < s  union t$
2. $p  union q = s  union t$ и $q < t$
3. $p  union q = s  union t$, $q = t$ и $p < s$

- Легко заметить, что это --- линейный порядок (показав, что $p prec.not q$ и $q prec.not p$ влечёт $p = q$)
- ... и полный порядок. Найти наименьший в $S eq.not nothing$ возможно, рассмотрев $m_1 :=  min { p  union q | chevron.l p,q chevron.r  in S}$ и
$M_1 := { chevron.l p,q chevron.r | chevron.l p,q chevron.r  in S, p  union q = m_1\}$,
затем $m_2 :=  min {q | chevron.l p,q chevron.r  in M_1 }$,
$M_2 := {chevron.l p,q chevron.r | chevron.l p,q chevron.r  in M_1, q = m_2}$.
Тогда требуемым наименьшим в $S$ будет $ min { p | chevron.l p,q chevron.r  in M_2}$
- Тогда $chevron.l alpha times alpha, (prec)chevron.r$ соответствует какой-то ординал $tau $ 
и сохраняющая порядок биекция $t:  tau ->alpha times alpha$. 
- Заметим, что $x < omega$ тогда и только тогда, когда $ union( union t(x)) < omega$
(очевидно из того, что $|{z | "ординал"}(z), z < x}|=|{p | p prec t(x)}|$).
- Покажем, что $| tau | = alpha$.

Докажем $ tau  = alpha$

Очевидно, что $ tau  > alpha$ (так как $| tau | = |alpha times alpha| > alpha$). Но пусть $ tau  > alpha$.

- Тогда $t(alpha) = chevron.l zeta, eta chevron.r$ определено (у $alpha$ есть образ).
- Пусть $ sigma  :=  zeta  union  eta$. Очевидно, $chevron.l  zeta,  eta chevron.r prec.eq chevron.l  sigma , sigma  chevron.r$
и $ sigma   in alpha$.
- Каков образ $t$ на этом начальном отрезке?
${t(x) | x < alpha}  subset.eq  {chevron.l p,q chevron.r | p,q <  sigma }$.
Поэтому $alpha < |( sigma +1) times ( sigma +1)|$. 
- С другой стороны, $ sigma  < alpha$. Поскольку $alpha$ --- кардинал (т.е., в частности, предельный ординал), 
то $ sigma +1 < alpha$ и $| sigma +1| < alpha$. 
- По предположению индукции, $| sigma +1|<omega or | sigma +1| = | sigma +1| dot  | sigma +1|$,
по свойствам $(prec)$ имеем $ sigma > omega$.
- Отсюда $alpha < |( sigma +1) times ( sigma +1)| = | sigma +1| < alpha$, что невозможно.

])


