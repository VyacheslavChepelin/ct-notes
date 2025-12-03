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