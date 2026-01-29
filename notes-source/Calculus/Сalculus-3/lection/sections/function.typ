#import "../template.typ":*

= Функциональные последовательности и ряды

== Равномерная сх-сть посл. функций

Посл-ть функций $cal(N)-> cal(F)$ или $n->f_n$

#definition(title:[Поточечная сходимость последовательностей функций], body:[
  $f_0, f_n:E subset X -> RR$

  $f_n$ сходится поточечно к $f_0$ на множестве $E$, если 

  $ forall x in E: exists lim_(n -> +infinity) f_n(x) = f_0(x) $
  
  $ forall x in E double forall epsilon > 0 double exists N: space forall n > N double abs(f_n (x) - f_0 (x)) < epsilon $
])

#definition(title:[Равномерная сходимость последовательностей функций],body:[
  $f_n$ сх-ся к $f_0$ равномерно на множестве $E$, если
  
  $ a_n := sup_(x in E) |f_n (x) - f_0(x)| ->0 $

  Обозначается $f_n arrows_(n-> +oo) f_0$
])

Замечание:  из равномерной сходимости следует поточечная.


$cal(F):= {f: X -> RR - "огр"}$

Тогда $rho(f_1,f_2) = limits(sup)_(x in X) |f_1(x) - f_2(x)|$ - это метрика!


#theorem(title:[Стокс, Зайдель], body:[
  $f_n,f_0: X -> RR, c in X, f_n$ - непр. в $c$. $f_n arrows f_0$ на $X$. Тогда $f_0$ - непр. в $c$.
], proof:[
  $ |f_0 (x) - f_0 (c)|<= |f_0(x) - f_n (x)| + |f_n (x) - f_n (c)| + |f_n (c) - f_0(c)| $
  $ forall epsilon > 0: exists N: forall n >  N: sup_X|f_n (x) -f_0(x)|<eps $
  Заметим, что тогда правую часть неравенства можно оценить сверху при предельном переходе благодаря вышесказанным неравенствам. 
$ |f_0(x) - f(c)| <= underbrace(|f_0(x) - f_n (x)|, (star)) + underbrace(|f_n (x) - f_n (c)|, (star star)) + underbrace(|f_n (c) - f_0(c)|, (star)) < epsilon $
Так как $f_n$ непрерывна в $c => forall epsilon > 0 double exists U(c): space forall x in U(c) double |f_n (x) - f_n (c)| < epsilon/3.$ Выполнена $(star star)$\
Так как $f_n arrows.rr f "на " X => forall epsilon > 0 double exists N: space forall n > N double forall x in X double |f_0 (x) - f_n (x)| < epsilon/3.$ Выполнены $(star)$\
Итого мы получили:
$ forall epsilon > 0 double exists U(c): space forall x in U(c) double |f_0(x) - f(c)| < epsilon $
])

*Следствие:* $f_n arrows f$ на $X$, $f_n in C(X)$. Тогда $f in C(x)$

*Замечание:* Теорема верна для случая $X$ - топологическое пространство

*Замечание:* Для доказательства непрерывности в $c$ мы могли попросить окрестность точки, что $f_n arrows f$

#theorem(title:[], body:[
$X$ --- компакт, $f_1, f_2 in C(X):  rho(f_1, f_2) = limits(max)_X abs(f_1-f_2)$ 

Тогда $C(X)$ --- полное МП
  
], proof:[

$f_n in C(X)$ - фундаментальная.

$ forall eps > 0: exists N: forall m,n: sup_X |f_n (x) - f_m (x)|< eps $

$ forall x_0: forall eps>0: exists N: forall m,n: |f_n(x_0)-f_m(x_0)| < eps $

Последовательность $f_n (x_0)$ - фунд. Откуда $exists lim f_n (x_0) = f(x_0)$

В формуле с переделом перейдем $m$ к $+ infinity$.

$ forall x_0: forall eps: exists N:forall m,n > N: |f_n (x_0)-f_m ( x_0)|< eps$

Это перейдет в :


$ forall x_0: forall eps: exists N:forall  n > N: |f_n (x_0)-f ( x_0)|<eps $

])

*Следствие:* Критерий Больцано-Коши для расходимости: $forall eps > 0 : exists: forall$


== Предельный переход под знаком интеграла

$f_n = n x^(n-1)(1-x^n), x in[0,1]: forall x: lim f_n (x) = f_0(x) equiv 0 $

$int_0^1 f_n(x) = 1/2 != int_0^1 f_1(x)$

#theorem(body:[
  $f_n in C([a,b]), f_n arrows f$. Тогда: $ int_a^b f_n -> int_a^b f $
], proof:[
  $f$ -  непрерывная на $[a,b]$ по одной из прошлых теорем

  $ |integral_a^b f_n - integral_a^b f| <= integral_a^b |f_n - f|<= max(|f_n -f|) (b-a) $
  Ну и все.
])

*Следствие:* правило Лейбница

$f: [a,b] times [c,d] -> RR$, $f,f'_y$ - непр на $[a,b]times [c,d]$

$Phi(y) = int_a^b f(x,y)d x$, $y in [c,d]$

Тогда $Phi$ - дифф по $y$ на $[c,d]$ и $Phi'_y = int_a^b f'_y (x,y)d x$


#theorem(name:[Правило Лейбница], body:[
 $f: X times chevron.l c,d chevron.r -> RR$
 1. $forall y in chevron.l  c, d chevron.r, x |-> f(x,y)$ сумм.
 2. $forall $почти всех $x,forall y: exists f'_y (x,y)$
 3. $f'_y$ удовлетворяет $L_("loc")(y_0)$

 Тогда:
 $ Phi(y) = integral_X f(x,y) d mu (x) "дифф в " y_0 quad Phi'(y_0) = int_X f'_y (x,y_0)d mu(x`) $
])


#theorem(title:[О предельном переходе под знаком производной], body:[

$f_n in C^1 (chevron.l a, b chevron.r)$,
$f_n -> f_0 "на" chevron.l a, b chevron.r$,
$
f'_n arrows phi "на" chevron.l a, b chevron.r$. Тогда
$ f_0 in C^1(dp(a, b)) quad " и " quad  f'_0 = phi "на" dp(a, b) $

То есть:
$ quad space f_n -> f_0 $ #v(-0.35cm)
$ d /(d x) arrow.b quad quad arrow.b.dashed $ #v(-0.35cm)
$ quad space f'_n arrows phi $

  
], proof:[
  $x_0, x_1 in dp(a, b), quad f'_n arrows phi$ на $[x_0, x_1]$. Тогда
$ int_(x_0)^(x_1) f'_n (x) dif x  quad space -->_(n->+infinity) space int_(x_0)^x_1 phi(x) dif x$, тк $f_n (x_1) - f_n (x_0) --> f_0 (x_1) - f_0 (x_0)$

$int_(x_0)^(x_1) phi(x) dif x = f_0 (x_1) - f_0 (x_0)$ - при всех $x_0, x_1 in dp(a, b)$
по теореме Барроу. Откуда:

$ f_0$ --- первообразная $phi$; $quad f'_0 = phi$


])

#pagebreak()

== Расходимость и сходимость функций рядов

#definition(title:[Ряд сходится поточечно], body:[ряд $sum f_n (x)$ сходится поточечно к сумме $S(x)$, если:
$ forall x : limits(sum)_(n=1)^(+infinity) f_n (x) = S(x) $
])


#definition(title:[Ряд сходится равномерно ], body:[ряд $sum f_n (x)$ сходится равномерно на  E к сумме $S(x)$, если:
$ S_N(x)arrows_(X  in E) S(x) $
])

Замечание. Если ряд $sum f_n (x)$ равномерно сходится, то $f_n (x) arrows 0 $


#theorem(title:[Признак Вейерштрасса ], body:[
  $sum u_n (x), x in X$

  $exists c_n$ - вещественная последовательность, что $forall x in X: |u_n (x)|<= c_n$

  И пусть $sum c_n$ сходится. Тогда:

  $sum u_n (x)$ равномерно сходится на $X$
], proof:[
  Для $x = x_0: |u_n (x_0)| <= c_n, sum c_n$ сходится, откуда $sum u_n$ (абсолютно) сходится

  $sup_(x in X) |sum_(n= N+1)^(+ infinity) u_n (x)|<= sum_(n = N+1)^(+ infinity) c_n ->0$, при $n -> infinity$
])

#theorem(name:[Критерий Больцано-Коши для расходимости последовательностей], body:[
  $forall eps : exists N : forall n,m > N : forall x |f_n (x) - f_m(x)| < eps$
])

#theorem(name:[Теорема 1 (Тосса - кого-то)], body:[
  $u_n (x) : X -"м.п" -> RR, x in X, u_n$ - непрерывна в $x_0$.

  $s(x) = sum u_n (x)$ - сходится поточечно. Пусть еще $sum u_n (x)$ - сходится 

  TODO
])

#theorem(name:[Теорема 2],body:[
  TODO
])

#theorem(name:[Теорема 3], body:[
  TODO
])



#theorem(name:[Теорема 2 со штрихом], body:[
 $u_n in C(a,b), limits(sum) u_n(x)$ - равномерно сходится на $[a,b]$,
 $S(x)=limits(sum)_(n=1)^(+ infinity)u_n(x)$. Тогда:

 $ integral_a^b S(x) d x = sum_(n=1)^(+infinity) integral_a^b u_n(x) d x $
],proof:[
  Сделать замену $f_n->S_n$ и посмотреть на прошлую теорему
])
Замечание: По теореме 1 $S(x)$ непрерывна

#theorem(name:[Теорема 3 со штрихом о дифференцировании ряда по параметру], body:[
  $u_n in C^1 (chevron.l a,b chevron.r)$
  1. $limits(sum)_(n=1)^(+infinity) u_n (x)  =S(x)$ - в смысле поточечной сходимости
  2. $limits(sum) u'_n(x) = phi(x)$ в смысле равномерной сходимости на $(chevron.l a,b chevron.r)$

  Тогда $S(x) in C^1(chevron.l a,b chevron.r)$ и $S'(x)= phi(x), x in chevron.l a,b chevron.r$
],proof:[
  Из теоремы 3. $phi -> phi, f_n -> S_n, f -> S$
])


#theorem(name:[Теорема 4 со штрихом о почленном предельном переходе в суммах], body:[
 $u_n(x):E subset X - "м.п" -> RR$, $x_0$ - предельная точка $E$
 1. $exists$ конечный $lim_(x->x_0) u_n (x) = a_n$
 2. $sum_(n=1)^(+ infinity)u_n (x)$ равномерно  сходится на $E$
 Тогда:
 1. $sum a_n$ сходится
 2. $lim_(x->x_0) sum_(n=1)^(+infinity) u_n(x) = sum a_n $
],proof:[
  Из теоремы 4. Хаха нет

  $S_n^a = limits(sum)_(k=1)^n a_k$, $S_n (x)= sum_(k=1)^n u_n (x)$

  Достаточно проверить, что $S_n^a$ - фундаментальная или что выполнено:
  $ forall  eps > 0 : exists N: forall n, m = n+p > N: |S_n^a - S_(n+p)^a| < eps $

  Для этого
  $ |S_(n+p)^a -  S_n^a |<= |S_(n+p)^a - S_(n+p)(x)| + |S_(n+p)(x) - S_n (x)| + |S_n (x) - S_n^a| $

  $forall eps > 0: exists N_1: forall n > N_1: forall x:|S_(n+p)(x) - S_n (x)|<eps/3$

  А теперь надо, чтобы края были меньше $eps/3$, а это очевидно достигается из того, что $lim u_n (x) = a_n$

  TODO кажется, что то что написано выше очевидно, но кохась зачем-то расписал на доске, стоит ли вставлять это в конспект?
  
])

#theorem(name:[Теорема 4], body:[
  $f_n : E subset X -> RR$, $x_0$ - предельная точка $E$

  1. $f_n (x) ->_(x-> x_0)A_n$
  2. $f_n (x) arrows_(n-> +infinity) S_(x)$ равномерно на E

  Тогда:
  1. $exists lim_(n-> + infinity) A_n = A in RR$
  2. $S(x) ->_(x->x_0)A $
], proof:[
  Из теоремы 4 со штрихом.
  $u_1 = f_1, u_2 = f_2 - f_1$ и так далее, $a_k = A_k - A_(k-1)$
])


#theorem(name:[Теорема 4 с двумя штрихами], body:[
  $f : E times G -> RR, E subset X, G subset Y$, $x_0, y_0$ - предельная точка $G$

  1. $lim_(x->x_0) f(x,y) = : h(y)$ - существует и конечна при всех $y in G$
  2. $lim_(y->y_0) f(x,y) = : r(x)$ - существует и конечна при всех $x in E$
  3. 1 или 2 равномерно сходится

  Тогда $exists lim_(y -> y_0) h(y), exists lim_(x-> x_0) r(x)$ и они равны
])

P.S. Это повторение одного и  того же разными словами уже начинает надоедать

#theorem(title:[Признак Дирихле равномерной сходимости ряда], body:[
  $sum a_n (x) b_n (x), x in X$
  1. Частичные суммы ряда $sum a_n$ равномерно ограничена, те:
  $ exists C_A: forall N: forall x in X: |sum_(n=1)^N a_n (x)|<= C_A $
  2. $b_n arrows_(n -> + infinity) 0$ равномерно на $X$

    $b_n -> 0$ монотонно по $n$ при каждом фиксированном $x$
  Тогда $sum a_n (x) b_n (x)$ равномерно сходится на $X$
], proof:[
  $A_N (x) = a_1 (x) + ... + a_N (x)$

  Суммирование по частям:
  $ sum_(k= N)^M a_k b_k = A_M b_M - A_(N-1) b_(N) + sum_(k= N)^(M-1) (b_k - b_(k+1))A_k $

  Для ряда будем проверять равномерную сходимость по критерию Коши

  $ |sum_(k=N)^M a_k (x) b_k(x)| <=  |A_M b_M| + |A_(N-1) b_(N)| + sum_(k= N)^(M-1) |(b_k - b_(k+1))A_k| <= C_A (|b_M|+ |b_N| + sum_(k=N)^(M-1) |b_k - b_(k+1)|) $
  $ <= C_A (|b_m| + |b_N| + |b_M| + |b_N|) $

  $forall eps >0: exists N_1: forall x,forall M,N > N_1: |b_M (x)|<= eps/(4 C_A), |b_N (x)|<= eps/(4 C_A)$ и тогда будет выполнено $|sum_(k=N)^M a_k (x) b_k (x)|<= eps$
])

#theorem(title:[Признак Абеля], body:[
$sum a_n (x), b_n (x), x in X$
  
  1. $sum a_n (x)$ - равномерно сходится на $x in X$
  2. $b_n (x)$ - равномерно ограничено на $X$

  $b_n (x)$ монотонно по n

  Тогда $sum a_n (x) b_n (x)$ равномерно сходится на $X$
])
Доказательство признака Абеля аналогично признаку Дирихле

#pagebreak()

== Степенные ряды.

#definition(title:[Степенной ряд], body:[
  $sum_(n=0)^(+ infinity) a_n (z - z_0)^n, a_n in CC, z_0 in CC $
])

$B(z_0,r)$ - шар в комплексной плоскости

#theorem(name:[Теорема о круге сходимости],
  body:[
$sum a_n (z - z_0)^n$. Тогда есть 3 взаимоисключаемых варианта
1. ряд $(A)$ сходится при всех $z in CC$
2. ряд сходится  только при $z = z_0$
3. $exists R in (0, + infinity)$ при $|z - z_0| < R$ ряд абсолютно сходится, при  $|z - z_0|> R$ расходится
  ], proof:[
    Изучим ряд на абсолютную сходимость. $sum |a_n| |z-z_n|^n $

    Признак Коши: $overline(lim) root(n,|a_n||z-z_n|^n) = |z-z_n| overline(lim) root(n, |a_n|) <1$, тогда ряд асболютно сходится

  Возьмем $R = display(1/(limits(limsup)_(n->+infinity) root(n, abs(a_n))))$
  
  Заметим, что ряд будет расходиться при $|z-z_0| > R$. 

  Тогда получаем как раз наши 3 случая:

- $limits(limsup)_(n->+infinity) root(n, abs(a_n)) = +infinity space =>space z=z_0 quad$ --- случай 1
- $limits(limsup)_(n->+infinity) root(n, abs(a_n)) = 0 space=>space z in CC$ #h(1cm)--- случай 2
- Иначе $abs(z-z_0) < 1/(limits(limsup)_(n->+infinity) root(n, abs(a_n)))$

$R$ --- *радиус сходимости степенного ряда $(A)$*

  ]
)

#theorem( name:[Теорема о непрерывности степенного ряда], body:[
  $(A) - "степенной ряд"$\
$R$ --- радиус сходимости $(A)$\ 
$0 < R <= +infinity =>$\


1. #underline[_Равномерная сходимость ряда:_]
$ forall r in (0, R): space "ряд" (A) space - "равномерно сходится в" overline(B(z_0, r)): $
$ sup_(z in B(z_0, r)) abs(sum_(n >= N) a_n (z - z_0)^n) ->_(N -> +infinity) 0 $
#v(0.4cm)
2. #underline[_Непрерывность функции степенного ряда:_]
$ f(z) = sum_(n=0)^(+infinity) a_n (z-z_0)^n space-"непрерывна в" B(z_0, R) $
], proof:[
  1. _Признак Вейерштрасса:_
  
  $ exists (c_n): space forall x, n: space abs(u_n (x)) <= c_n =>
   sum_(n=0)^(+infinity) c_n space - "сходится" space => space sum_(n=0)^(+infinity) u_n (x) space - "сходится" $ 
 
  $display(sum_(n=0)^(+infinity) a_n (underbracket(underbracket((z_0+r), (star)) - z_0, < R))^n) space$ --- сходится абсолютно по теореме о круге сходимости  $ space =>$\ #v(0.6cm)
  $=> display(sum)_(n=0)^(+infinity) abs(a_n) r^n space$ --- сходится  $space => space (A)$ равномерно сходится  по Вейерштрассу\ 
  #v(0.6cm)
  $(star)$ -- мы подставили вместо $z$ самую правую точку на замкнутом шаре
2. Возьмём $z: space abs(z-z_0) < r < R$\
  В $B(z_0, r)$ есть равномерная сходимость ряда $(A)$\ 
  По Стоксу-Зайдлю $f$ непрерывна в $z$.
])



#lemma(title:[], body:[
  $w,w_0 in CC$,
$n in NN$,
$abs(w) <= r, space abs(w_0) <= r$. Откуда:
$ abs(w^n - w_0^n) space <= space n r^(n-1) abs(w - w_0) $

], proof:[
  $abs(w^n - w_0^n) = abs(w-w_0) dot abs(w^(n-1) + w^(n-2) dot w_0 + dots + w dot w_0^(n-2) + w_0^(n-1)) space <= space abs(w-w_0)dot r^(n-1) n$
])

#theorem(title:[О дифференцировании степенного ряда], body:[
  $A = display(sum)_(n=0)^(+infinity) a_n (z-z_0)^n$, 
$A' = display(sum)_(n=1)^(+infinity) n a_n (z-z_0)^(n-1)$,
$ f(z) = A$,
$R in (0, +infinity]$ --- радиус сходимости $(A) =>$
1. $ R - "радиус сходимости" A' $
2. $ forall z in B(z_0, R): space f'(z) = A' $
], proof:[
  1. Вместо $A'$ рассмотрим $(z-z_0) A' = sum_(n=1)^(+infinity) n a_n (z-z_0)^n$. Заметим, что он имеет тот же радиус сходимости, что и $A'$

  $ display(R' = 1/(limsup root(n, n abs(a_n))) =  1/(limsup root(n, n) dot limsup root(n, a_n)) space = space R) $
  
  2. Возьмём $a in B(z_0, r)$, $ space r < R$
  $ display(f'(a) = lim_(z->a) (f(z)-f(a))/(z-a) = lim_(z->a) sum_(n=0)^(+infinity) a_n ((z-z_0)^n - (a-z_0)^n)/((z-z_0)-(a-z_0)) = mat(delim: "[", &w=z-z_0; &w_0 = a-z_0) = lim_(w->w_0) sum_(n=0)^(+infinity) a_n (w^n - w_0^n)/(w-w_0)) $
  $display(cases(reverse: #true,
    "По лемме": abs(a_n (w^n - w_0^n)/(w-w_0)) <= abs(a_n) n r^(n-1),
    r<R: space display(sum)_(n=0)^(+infinity) abs(a_n) n r^(n-1) space - "сходится" 
  ) space => space sum_(n=0)^(+infinity) a_n (w^n - w_0^n)/(w-w_0) space - "равномерно сходится по Вейерштрассу")$

  По теореме о предельном переходе в суммах :  
  $ lim_(w->w_0) sum_(n=0)^(+infinity) a_n (w^n - w_0^n)/(w-w_0) space=space sum_(n=0)^(+infinity) lim_(w->w_0) a_n (w^n - w_0^n)/(w-w_0) space=space sum_(n=1)^(+infinity) n a_n w_0^(n-1) space=space sum_(n=1)^(+infinity) n a_n (a-z_0)^(n-1) $
])

*Следствие 1.* $f(z) = sum_(n=0)^(+ infinity) a_n (z-z_n)^n, 0 < R < + infinity$. Тогда $f in C^(+infinity) (B(z_0, R))$ и все ее производные можно найти почленным дифференцированием

*Следствие 2.* $f(x) = sum a_n (x-x_0)^n$, $x_0 in RR, a_n in RR$. Тогда $F(x) = a_n/(n+1) sum_(n=0)^(+infinity) ((x-x_0)^(n+1)) + С $ имеет тот же радиус сходимости $R$ и выполняется $ integral_(x_0)^x f(x) d x = F(x) $
где константа равна 0.

Радиус сходимости понятно почему. А интеграл равен потому что:
$ display(int_(x_0)^x f(t) dif t = int_(x_0)^x sum_(n=0)^(+infinity) a_n (t-x_0)^n dif t space =^"по равномерной"_"сходимости" space sum_(n=0)^(+infinity) a_n int_(x_0)^x (t-x_0)^n dif t= sum_(n=0)^(+infinity) a_n (x-x_0)^(n+1)/(n+1)) $


*Пример:*
$f(x) = "arcctg" x, space x in (-1,1)$
$ display(f'(x) = -1/(1+x^2) = -1+x^2-x^4 +dots) $
$ display(f(x) = int_0^x f'(x) dif x = C - x + x^3/3 - x^5/5 + dots) $
$ display(f(0) = pi/2 space => space f(x) = pi/2 - x + x^3/3 - x^5/5 + dots) $ 

#pagebreak()
== Экспонента как функция комплексной переменной

$z in CC$,
$exp(z) = sum_(n=0)^(+infinity) z^n/n! $

*Свойства:*
+ $exp(0) = 1$
+ $exp'(z) = exp (z)$
+ $overline(exp(z)) = exp(overline(z))$
+ $exp(v+w) = exp(v) dot exp(w)$

*Доказательство:*
+ $display(exp(0) = sum_(n=0)^(+infinity) 0^n/n! = 1)$ 

+ $display(exp'(z) = sum_(n=1)^(+infinity) z^(n-1)/(n-1)! = sum_(n=0)^(+infinity) z^n/n! = exp(z))$ 

+ $display(overline(exp(z)) = overline(sum_(n=0)^(+infinity) z^n/n!) = sum_(n=0)^(+infinity) overline(z)^n/n! = exp(overline(z)))$ 

+ $ exp(v) dot exp(w) = (sum_(n=0)^(+infinity) v^n/n!) (sum_(k=0)^(+infinity) w^k/k!) =^((star)) sum_(n=0)^(+infinity) (sum_(j=0)^n (v^j w^(n-j))/(j! (n-j)!)) = sum_(n=0)^(+infinity) 1/n! sum_(j=0)^n (v^j w^(n-j) n!)/(j! (n-j)!) =^((star star)) sum_(n=0)^(+infinity) 1/n! (v+w)^n $

  $(star):$ Сделали суммирование по диагоналям\
  $(star star):$ Свернули сумму по биному Ньютона


Вернемся к свойствам

5. $x in RR: exp(i x) = Cos x + i Sin x$, $exp(- i x) = Cos x - i Sin x$
  
1. $Cos x  = (exp(i x) + exp( - i x))/(2), Sin x =(exp(i x) - exp( - i x))/(2i) $
2. $Cos x = sum_(k=0)^(+infinity)(-1)^k x^(2k)/(2k!), Sin x = sum_(k=0)^(+infinity) (-1)^k (x^(2k+1))/((2k+1)!)  $
3. $T(x) = exp (i x) = e^(i x)$

#pagebreak()
== Метод Абеля суммирования рядов

#theorem(name:[Теорема Абеля],body:[
  $c_n in CC$, 
$display(sum_(n=0)^(+infinity) c_n)$ --- сходится, $display(f(x) = sum_(n=0)^(+infinity) c_n x^n)$,
$x in (-1, 1) $. Тогда:
$ lim_(x->1-0) f(x) = sum_(n=0)^(+infinity) c_n $
], proof:[Идейно мы хотим показать непрерывность в точке в $x=1$

$c_n x^n$ --- непрерывно на $[0,1] $ (в том числе в $1$), $f(x)$ задана на $[0, 1)$

Докажем равномерную сходимость $sum_(n=0)^(+infinity) c_n x^n "на" [0, 1]$, по признаку Абеля:
+ $prime.double c_n (x)prime.double =  c_n $ --- равномерно сходится (так как сходится и не зависит от $x$)
+ $prime.double b_n (x) prime.double = x^n$ --- при фиксированном $x$ монотонна по $n$, и стремится к 0 \
  #h(2.8cm)$b_n$ равномерно ограничена$: space (exists M:=1: space forall x in X double forall n double abs(x^n) < M)$
])

Следствие.

$sum_(n=0)^(+infinity) a_n = A$,
$sum_(n=0)^(+infinity) b_n = B$,
$ c_n := a_0 b_n + a_1 b_(n-1) + dots + a_n b_0$ --- суммирование по диагоналям

$ sum_(n=0)^(+infinity) c_n = C = A dot B$

== Ряды Тейлора

#definition(body:[
  $f: chevron.l a,b chevron.r -> RR, x_0 in (a,b)$. $f$ - разлагается в степенной ряд в окрестности $x_0$. То есть:
  $ exists u(x_0) : f(x) = sum c_n (x-x_0)^n , "при" x in U(x_0) $
])

*Замечание:* Тогда $f in C^(infinity)(U(x_0))$ 

#theorem(name:[Единственность разложения функции в ряд], body:[
  Разложение в точке $x_0$ функции $f$ единственно.
], proof:[
Посмотрим на $c_n$, заметим, что они однозначно задаются: $c_n = (f^((n))(x_0))/n!$. А это то, что нам и надо
])

#definition(title:[Ряд Тейлора], body:[
  $f in C^infinity (U(x_0))$. Тогда назовем $sum (f^((n))(x_0))/n! (x-x_0)^n$ - формальным рядом Тейлора функции в точке $x_0$
])
*Замечания:*
1. Ряд Тейлора может сходиться не к функции.

2. Ряд Тейлора может расходиться при $x != x_0$

TODO: пример функции с расход рядом  Тейлора (последние 10 минут 11 лекции)

Пример:

$e^x = sum x^n/(n!)$, и синус, косинус с большой буквы теперь у нас совпадают с нашими!!!

#theorem(title:[Разложение бинома в ряд Тейлора],body:[
  $ (1+x)^sigma = 1 + sigma x + (sigma (sigma-1))/2! x^2 + dots + display(binom(sigma, n)) x^n + dots space = space sum_(n=0)^(+infinity) display(binom(sigma, n)) x^n = S(x) $ 
], proof:[
  При $abs(x) < 1:$
$S(x)$ --- сходится по признаку Даламбера:
$ display(abs(a_(n+1)/a_n) = abs((sigma-n)/(n+1) x) = abs(((sigma+1)/(n+1) - 1) x)), quad lim_(n->+infinity) display(abs(a_(n+1)/a_n)) space < space 1 $
$"Покажем, что:" S'(x) (1+x) = sigma S(x) $

$ display(S'(x) = sigma + (sigma (sigma-1))/2 dot 2x + display(binom(sigma, 3)) dot 3x + display(binom(sigma, n+1)) dot (n+1) x^n + dots = sum_(n=1)^(+infinity) display(binom(sigma, n)) dot x^(n-1) n) $
$ display(x S'(x) = sigma x + (sigma (sigma-1))/2 dot 2x^2 + display(binom(sigma, 3)) dot 3x^3 + display(binom(sigma, n)) dot n x^n + dots = sum_(n=1)^(+infinity) display(binom(sigma, n)) x^n n) $

$ display(binom(sigma, n+1)) dot (n+1) + display(binom(sigma, n)) dot n = display(binom(sigma, n)) (((n+1)(sigma-n))/(n+1) + n) = sigma display(binom(sigma, n)) $ 

$ "Введем: "display(f(x) = S(x)/((1+x)^sigma)) $
$display(f'(x) = (S'(x) (1+x)^sigma - sigma (1+x)^(sigma-1) S(x))/(1+x)^(2 sigma) = (S'(x) (1+x) - sigma S(x))/(1+x)^(sigma + 1) = 0 => f(x) = C) $

Откуда:
$f(0) = 1  =>  f(x) = 1$\ 
])


#pagebreak()
== Лирическое отступление

#definition(title:[Локальная ???],body:[
$f: X times Y -> overline(RR), (X , algebra, mu),  a in Y$ - м.п., $f in L_("loc")(a)$, если:

$ exists g(x) "- сумм," exists U(a): forall y in U(a): forall "п.в." x: |f(x,y)|<= g(x) $
])


#theorem(name:[Теорема Лебега о мажорированной сходимости], body:[
  $f: X times Y -> overline(RR): forall y: x-> f(x,y)$ измеримо. 
  
  1. При почти всех $x: exists lim_(y->y_0) f(x,y) = phi(x)$

  2. $f in L_("loc") (y_0)$

  Тогда $ lim_(y -> y_0)integral_(X) f(x,y) d mu (x) = integral_X phi(x) d mu (x) $
])
Доказательство: По Гейне очев (нет, дайте кто-нибудь док-во)

#theorem(title:[Правило Лейбница] ,body:[
  $f: X times chevron.l a,b chevron.r -> RR$
  1. $forall y:  x |-> f(x,y)$ суммируема
  2. при п. в.$x:$ $forall y : exists f '_y (x,y)$
  3. $f'_y$ - удовлетворяют $L_("loc") (y_0)$

  Тогда функция $cal(J)(y) = integral_(X) f(x,y) d mu (x)$ - дифф. $y_0$ и $J' (y_0) = integral_X f'_y d mu$
], proof:[

  Введем $F(x,h) = (f(x, y_0 + h) -f(x,y_0))/h$.

  $ (J(y_0+h) - J(y_0))/h = integral_X F(x,h) d mu (x)-->_(h -> 0)^(s star) integral f'_y (x, y_0) d mu (x) $

  $star$ - здесь мы пользуемся прошлой теоремой. Нам надо проверить удовлетворению $L_("loc")$ у $F$:  $ |F(x,h)| =_("по т Лагранжа") |f'_y (x, y_0 + theta h)|<= g(x) $
])

Следствие 1. $arcsin x = x + sum_(n=1)^(+infinity) ((2n-1)!!)/(2n!!) x^(2n+1)/(2n+1)$


#theorem(title:[Теорема о разложимости функции в ряд Тейлора], body:[ 
$f in C^infinity (x_0 - h, x_0 + h)$ Тогда равноосильно
1. $f "раскладывается в ряд в" V(x_0)  $
2. $exists delta, C, A > 0: space forall n  
in NN : forall x :abs(x-x_0) < delta: abs(f^((n)) (x)) <= C A^n n! $], proof:[
  $2 => 1$

  $ f(x) = sum^n f^((k))/k! (x-x_0)^k +  (f^((n+1))(overline(x)))/(n+1)! (x-x_0)^(n+1) $

  Все что надо проверить, это то, что $r_n -> 0:$
  $ |r_n| <= (C A^(n+1)(n+1)!)/((n+1)!) |x-x_0|^(n+1) = C(A |x -x_0|)^(n+1) -->_(|x-x_0| < 1/(2A))0 $

  Аккуратно, про окрестности и дельту сказать и все

  1 => 2: Возьмем $x_1 != x_0,$  $x_1 in dot(V)(x_0)$

  $display(abs((f^((n)) (x_0))/n! (x_1-x_0)^n) space <= space C)$ --- ограничено, так как ряд сходится

  $display(abs(f^((n)) (x_0)) <= (C n!)/abs(x_1-x_0)^n = C B^n n!)$,
$display(B = 1/abs(x_1-x_0))$

Пусть теперь $|x-x_0| < 1/(2B)$

$ f^((n))(x) = (sum f^((k))/k!(x-x_0)^k)^((m))   <=  abs(sum_(k=m)^(+infinity) (f^((k))(x_0))/k! k (k-1) dots (k-m+1) abs(x-x_0)^(k-m)) space <= \

<= sum_(k=m)^(+infinity) abs(f^((k))(x_0))/k! k (k-1) dots (k-m+1) abs(x-x_0)^(k-m) space <= \

<= space sum_(k=m)^(+infinity) (C B^k k!)/k! k (k-1) dots (k-m+1) abs(x-x_0)^(k-m) =\ 
=C B^m sum k!/((k-m)!) (B |x-x_0|)^(k-m) = (c B^m m!)/(1 - (B|x-x_0|))^(m+1) $
  
])

