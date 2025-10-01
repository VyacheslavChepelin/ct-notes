#import "../template.typ":*

= Интеграл 

#definition_(title:[Разбиение множества E], body:[ Разбиением множества E называется его разбиение на конечное количество множеств, то есть:
$
E = union.big.sq E_i 
$])


#definition(title:[Ступенчатая функция], body:[
$f: X -> RR$ --- называется *ступенчатой*, если:
$ exists e_i: X = union.sq.big_"кон." e_i: space forall i space f stretch("|", size: #150%)_#pad(bottom: -8pt, $e_i$) = "const" $
  При этом такое разбиение называется *допустимым*.
])
_Пример_: Характеристическая функция $chi_e_k = cases(1\, quad &x in e_k, 0 \,quad & x in.not e_k)$ 


#property_(name:[Свойства], body:[
+ Если $f, g$ --- ступенчатые функции, то $exists$ разбиение, допустимое для обоих
+ $f, g$ --- ступенчатые, $alpha in RR$. Тогда:
  
$ f + g, space f g, space  max(f, g), space  min(f, g), space  abs(f), space  alpha f - "ступенчатые" $
])
Доказательство этих свойств очевидно




#definition(title: [Лебеговские множества.], body:[
  Пусть есть $f: E subset X -> overline(RR)$ и  $a in RR$. Тогда следующие 4 множества называются *Лебеговскими*:
  + $ E(f < a) = {x in E, space f(x) < a} $ 
+ $ E(f <= a) = {x in E, space f(x) <= a} $
+ $ E(f >= a) = {x in E, space f(x) >= a} $
+ $ E(f > a) = {x in E, space f(x) > a} $
])


#def[Замечания:]

- $E(f > a) = (E(f <= a))^c$
- $E(f<=a) = limits(inter.big)_(n in NN) E(f < a + 1/n)$

TODO: те ли замечания?

#definition(title:[Измеримая функция], body:[
$(X, algebra, mu)$ --- пространство с мерой. Возьмем 
$f: E subset X -> overline(RR)$, $E in algebra$.
Тогда $f$ --- *измерима* на $E$, если $ forall a in RR :space E(f < a) in algebra $
(аналогично для еще 3х случаев)
])

#def[Замечание:]
Если $f$ измеримо на $X$ говорят, что $X$ просто *измеримо*. Если $X = RR^m$, $algebra = cal(m)^m $, то говорят, что $X$ *измеримо по Лебегу*

TODO: так ли это??!?!?!?

TODO: пропущено замечание про эквивалентность, потому что не разобрал


#property_(name:[Свойства:], body:[
+ $f$ --- измерима $=> forall a in RR: space E(f = a) = E(f >= a) inter E(f <= a)$ --- измеримо 
+ $f$ --- измерима $=> forall alpha in RR: space alpha f$ --- измерима
+ $f$ --- измерима на $E_k$ $=> f$ --- измерима на $E = union.big E_k$
+ $f$ --- измерима на $E$,  $E' subset E, E' in algebra =>$ измерима на $E'$
+ $f != 0$ на E, измерима $=> 1 / f$ --- измерима
+ $f >= 0, space alpha > 0$ --- измерима $=> f ^ alpha $ --- измерима
])


#theorem(title:[Об измеримости пределов и супремумов.], body:[
$f_n$ --- измеримые функции на $X$. Тогда:
+ $sup f_n, space inf f_n$ --- измеримы.
+ $limsup f_n, space liminf f_n$ --- измеримы.
+ Если $forall x quad exists lim_(n -> + infinity)(f_n (x)) = f(x)$, то $f$ --- измерима.

], proof: [
  1) Пусть $ g(x) := sup f_n (x)$\
  Докажем, что $ X(g>a) = union.big_n X(f_n > a) $
  Если это верно, то справа стоит счетное объединение измеримых множеств $=>$ оно измеримо

  Чтобы это показать, докажем включение в обе стороны.
  
  Покажем, что $ X(g>a) subset union.big_n X(f_n > a) $
    Рассмотрим какой-нибудь $x in X(g>a)$. По определению множества $X(g > a) : space  g(x) > a => sup f_n (x) = g(x) > a$. Тогда по техническому описанию $sup : space exists n: f_n (x) > a$. Значит $x$ лежит в правой части тоже.

  Покажем, что $ X(g>a) supset union.big_n X(f_n > a) $
   Рассмотрим какой-нибудь $x in union.big_n X(f_n > a)$. Это значит, что $exists n: space x in X(f_n > a)$.
   
   По определению этого множества $f_n (x) > a => g(x) = sup f_n (x) > a$

TODO: скопировал 2 и 3 пункт с прошлого года, так как не понял, распишите их нормальной
   
   2) Распишем верхни предел по определению (для нижнего все будет аналогчино)\
  $see  s_n := sup (f_n (x), f_(n+1) (x), dots)$\
  Заметим, что по предыдущему пункту $s_n$ --- измерим (т.к. она $sup$ измеримых)\
  
  $limsup f_n (x) = inf_n (s_n)$\
  Аналогично $limsup f_n (x)$ --- измерима, т.к. $s_n$ измеримы #vtw
3)  
Очевидно: так как если $exists lim => overline(lim) = lim = underline(lim)$
])

#def[Следствие.] $f$ - измеримо $=> |f|, f^+, f^-$ - измеримы 

#theorem(title:[Характеризация измеримых функций с помощью ступенчатых], body:[

$f: X -> overline(RR)$, $f >= 0$,$f$ --- измеримо.
Тогда $exists f_n$ --- ступенчатые функции:

+ $0 <= f_n <= f  $
+ $forall x : space lim_(n -> + infinity) f_n (x) = f(x)$

], proof:[
  #align(center)[#image("../assets/integral-stairs.png", width: 50%)]
Выберем $n in NN$ и нарежем ось "$y$" сначала на $n$ отрезков длины 1, а потом каждый из них на отрезки длины $1/n$.
И введем следующие обозначения:

$ e^((n))_k := X(k /n <= f < (k+1)/n), space k = 0, 1, dots, n^2-1 $
$ e^((n))_(n^2) = X(f >= n) $

Заметим, что $X$ разбилось на $n^2+1$ дизъюнктных кусков: $X = union.big.sq_k e^((n))_k$.

#def[Замечание:] Концептуально функция не обязательно убывающая, мы просто делим на куски и возможно, что $e_k^((n))$ будут не непрерывны, как на рисунке.

Построим теперь ступенчатую функцию $g_n:$\
$ 0 <= g_n := sum_(k=0)^n^2 k/n dot chi_e_k^((n)) <= f $ 

Левое неравенство очевидно, т.к. каждое из слагаемых не меньше 0\
Правое неравенство следует из того, что на $e_k^((n))$ значение функции $f >= k/n$, а в сумме мы рассматриваем функцию, у которой на $e_k^((n))$ значение в точности равно $k/n$. Неравенство становится очевидным.

Найдем предельную функцию:
$ lim_(n->oo) g_n (x) = f(x) =  cases(gap: #5pt, + infinity comma quad & "если" f(x) = +infinity comma ("т.к." forall n: space x in e^((n))_(n^2) => g_n (x) = n),
f(x) comma quad & "если" f(x) < +infinity comma ("т.к. НСНМ" n > f(x) space x in e^((n))_k =>^((star)) abs(f(x) - g_n (x)) < 1/n)) $

$(star):$ Т.к. $n > f(x)$, то $k < n^2$, а по определению $e^((n))_k$ значения на этом множестве $g_n$ отличаются от $f$ не более, чем на $(k+1)/n - k/n = 1/n$.

Теперь определим $f_n$ так, чтобы они были монотонными:\
$ f_n (x) := max(g_1, g_2, dots, g_n) $
Очевидно, что $f_n = max(g_1,..., g_n)$, $0<= f_n <= f_(n+1) <= f$ и они ступенчатые.

])

Todo: сверьте следствия

*Следствие 1:*

$f: X -> overline(RR)$ --- измеримая. Тогда $exists f_n$ --- ступенчатые, что:
+ $forall x space forall n: space  abs(f_n) <= abs(f)  $
+ $forall x : space lim_(n -> + infinity) f_n (x) = f(x)$
#def[Доказательство:]

Очевидно, что $f^+, f^-$ --- измеримы, и при этом $f^+, f^- >= 0$. 
Тогда по теореме:
+ $exists h_n$ --- ступ. $: double h_n arrow.t, double  0 <= h_n <= f^+, double lim h_n = f^+$
+ $exists g_n$ --- ступ. $: double g_n arrow.t, double  0 <= g_n <= f^-, double lim g_n = f^-$
По свойству ступенчатых функций 
$h_n - g_n$ --- тоже ступенчатая. И при этом: $h_n - g_n -> f^+ - f^- = f$ 
Тогда $see f_n := h_n - g_n$ и  докажем что они подходят.

Второе условие выполнено за счет предпоследней строчки 
Докажем первое условие, 
по определению срезок: $ forall x : space f^+(x) = 0 "или" f^-(x) = 0 $
Поэтому $ forall x  space forall n:  space abs(f_n) =  abs(h_n (x) - g_n (x)) = h_n (x) "или" g_n (x) $ 
И при этом $ h_n (x) <= f^+ (x) <= abs(f) " и " g_n (x) <= f^- (x) <= abs(f) $
Получается, что $abs(f_n) < abs(f)$ --- ровно то, что надо

#align(right)[*Q.E.D.*]

*Следствие 2:*\
$f, g$ --- измеримы. Тогда $f g$ --- тоже измеримо\


#def[Доказательство:]

Рассмотрим $ f_n -> f, space g_n -> g$ --- ступенчатые из нашей теоремы.
При этом $f_n, space g_n$ --- конечные (т.к. сутпенчатые). Тогда по свойству поточечной сходимости:
$ f_n g_n -> f g $ 

(будем считать, что $0 dot plus.minus infinity = 0$)

#align(right)[*Q.E.D.*]


*Следствие 3:*\
$f, g$ --- измеримы. Считаем, что $exists.not x space  f(x) = plus.minus infinity, space  g(x) = minus.plus infinity$.
Тогда $f + g$ --- измеримо
#proof
$exists f_n, space  g_n$ --- ступенчатые из нашей теоремы.
Тогда по свойству поточечной сходимости:
$ f_n + g_n -> f + g $ 
#align(right)[*Q.E.D.*]



 == Преобразование меры $Omega$ при сдвигах и линейных отображениях

 

#theorem(name:[
  Лемма о сохранении измеримости при непрерывном отображении
], body:[
$T: RR^m -> RR^n$ --- непрерывно,
$forall E in cal(M)^m: lambda_m E = 0$ выполняется: $lambda T (E) = 0$. Тогда: $ forall A in cal(M)^m space : T A in cal(M)^n $  
], proof:[
Прямое следствие регулярности меры Лебега:
$ A = union.big_(n=1)^infinity F_n union cal(С), $ $F_n$ --- компакт, $lambda cal(N) = 0$.
$ T A  = union.big_(n=1)^infinity T (F_n)union T cal((С)) $
$T (F_j)$ --- компакт (как образ компакта), $ space lambda T cal((С)) = 0 => T A$ --- измеримо.  
])


#theorem(name:[Теорема о сохранении измеримости при гладком отображении],
body:[
  $O subset RR^m$ - открытая. $Phi:O -> RR^m$, 
  $Phi in C^1$

  Тогда $forall A subset O$ - измеримых по Лебегу $Phi(A)$ тоже измеримо по Лебегу
], proof:[
  $Phi$ - непрерывно. Откуда достаточно проверить, что $lambda A = 0 => lambda Phi(A) = 0$. Тогда сработает предыдущая лемма и мы победим.
  
  $lambda E = 0 <=> exists$ меры $(B_k)$, $E subset limits(union.big )B_k, sum lambda B_k < epsilon$

  TODO: Рассписать то, что сверху лучше

  
   Рассмотрим два случая:
 
+ $make A subset underbracket(overline(P), "замкн.\nпар-ед") subset O$.  Т.к. $overline(P)$ --- компакт, а $Phi'$ --- непрерывно, то она достигает своего максимума:
$ L := max_(x in overline(P)) thick norm(Phi'(x)) $
  Тогда по теореме Лагранжа:
$ forall x, y in overline(P) : space abs(Phi(x) - Phi(y)) <= L dot abs(x - y) $ 
  Отсюда следует следующие включение для образа шара:
  $ Phi(B(x_0, r)) subset B(Phi(x_0), L r) $ 

  TODO ?????????

  Потом шар в куб
  не пон
  
]
  
)


#theorem(name:[Теорема о мерах, инвариантных относительно сдвигов],
body:[
$mu$ --- мера на $cal(m )^m$
1. Пусть $mu$ --- инвариантна, относительно сдвигов, т.е:
  $ forall A in cal(m)^m space forall v in RR^m quad mu(A) = mu(A + v) $
2. Для любого ограниченного $A in cal(m)^m : space mu(A) < + infinity$
Тогда $ exists k in [0, + infinity] quad mu = k dot lambda quad (<=> forall A in cal(m)^m : space mu A = k dot lambda A) $  
])



#theorem_(name:[Лемма], body:[
$(X, cal(A), \_), (X', cal(A)', nu')$ --- два пространства с мерой. $T : X -> X'$ --- биекция.
Тогда $ nu := nu' compose T, quad (nu : cal(A) -> RR) - "мера" $  
], proof:[
  Проверим счетную аддитивность
$ A = union.big.sq A_k$\
Тогда должно быть:
$ nu A = nu'(T A) = nu'(T(union.big.sq A_k)) = nu'(union.big.sq T A_k) = sum nu' (T A_k) = sum nu A_k $ #vtw
Получается счетная аддитивность есть, значит $nu$ --- мера\
])


#theorem(title:[(Инвариантность относительно ортогонального преобразования)],body:[
$T : RR^m -> RR^m $ - линейное отображение, ортогонально. Тогда:

$ forall A in cal(m)^m : T(A) in cal(m)^m " и " lambda A = lambda T(A) $
  
],proof:[
  1. $T(A) in cal(m)^m$ по теореме 1, так как T - гладкая функция.
  2. У нас сохранение меры $mu A = lambda (T(A))$, так как $T$ биективно (? это вроде как следует из того, что оно ортогонально, но я чет сомневаюсь)
    При этом $mu$ инвариантна относительно сдвигов:
  $ mu (A + nu) = lambda (T(A + nu)) = lambda (T(A) + T nu) + lambda(T(A))= mu A $ 

  Заметим также, что $T$ шар с центром в 0 переводит в шар с центром в 0 того же радиуса
  $ T(B(0, r)) = B(0, r) $
 Откуда $lambda T(B(0, r)) = mu B(0, r)$. Уже откуда получаем, что $mu < + infinity$ на любом ограниченном. Откуда выполнена теорема о мерах, инвариантных относительно сдвигов и в данном случае $k=1$.
])
#theorem(name:[Теорема о преобразовании меры Лебега при линейном отображении], body:[
$V in Lin(RR^m, RR^m)$\
Тогда $ forall E in cal(M)^m quad V(E) in cal(M)^m " и " lambda(V(E)) = |det V| dot lambda E $  
], proof:[
Рассмотрим два случая:
1. $det V = 0 => dim(Im thin  V) <= m-1$. А тогда $lambda (I m thin V) = 0 => lambda (V E) = 0$. Получили, что хотели
2. $det V != 0$ Пусть $mu E := lambda V(E)$ --- мера инвариантная относительно сдвигов $=> exists k: mu = k lambda$\
   Найдем $k.$ Пусть $E := $ единичный  куб на векторах $g_i$. $V(g_i) =  s_i h_i$ (по предыдущей лемме), тогда $V(E)$ --- параллепипед, порожденный векторами $s_i h_i$. Посчитаем: $ mu E = lambda V(E) = (s_1 dots s_m) quad lambda E = 1 $
   Получили, что $k = |det V|$  
])





















#pagebreak()

== Сходимость по мере и сходимость почти везде


#definition(title:[Множество полной меры], body:[
  $E$ --- #def[множество полной меры] в $X => mu(X without E) = 0$
])

#theorem(title:[Измеримость функции непрерывной на множестве полной меры], body:[
    $E subset RR^2, e subset E, lambda_m(e) =0$
    $f: E -> RR$ непрерывны на $E' = E without e$. 
    
    Тогда $f$ измеримая.
], proof:[
  $E'(f < a) = H$ - открытое подмножество в $E'$ по топологическому определению

  $exists G$ - открытое в $RR^m$ такое что $H = G inter E'$
  $ E(f<a) = E'(f<a) union e(f<a) $
  $E'(f<a)$ --- измеримое, $e(f<a)$ - подмножество $e$, имеющего $lambda e = 0$.
])


 // = Сходимость почти везде и сходимость по мере
// 24 14.00
#definition(title:[Свойство, выполняющееся почти везде],body:[
$(X, algebra, mu), space E in algebra$, 
$w(x)$ --- высказывание, зависящее от $x$, 
$w(x)$ выполняется (истинно) *почти везде*, если
$ mu e = 0, " где" e = {x in E | space w(x) - "ложно"} $
]) 
*Свойства:*

Пусть $forall n$ задано высказывание $omega_n (x)$ и оно выполняющееся почти везде.\
Тогда мегаутверждение $w(x) := w_1 (x) and w_2 (x) and dots$ --- выполняющееся почти везде.  



#definition(title:[Сходимость почти везде], body:[
$f, f_n: E -> overline(RR) $,
$ f_n -> f$ *почти везде*, если:
$ mu{x in E | space  f_n (x) arrow.not f(x)} = 0 $  
])
*Свойства:*
+ $f_n, f: X -> overline(RR), space mu - "полная", space f_n -> f$ почти везде на $X$ и $forall n space f_n$ --- измеримая, тогда $f$ --- измерима
+ $mu$ --- полная мера, $f$ --- измерима, $g$ --- еще одна функция и $f = g$ почти везде, тогда $g$ --- измерима

#definition(title:[Сходимость по мере], body:[
  $(X, algebra, mu)$ --- пространство с мерой, 
$f_n, f: X -> overline(RR)$ --- измеримы, почти везде конечны.

Тогда $f_n -> f$ *по мере* $mu space $ (при $n -> +infinity$)
$ f_n arrow.long.double_mu f: quad forall eps > 0 quad  mu X(abs(f_n - f) >= eps) -> 0 $
])

#theorem(name:[Теорема Лебега о сходимости почти везде и сходимости по мере], body:[
$f_n, f: X -> overline(RR)$ --- измеримы, почти всюду конечны,
$f_n -> f$ --- почти всюду,
$mu X < + infinity$

Тогда:
$ f_n arrow.long.double_mu f $  
], proof:[
Подменим $f_n, f$ --- на множествах меры 0, так чтобы $f_n -> f$ всюду и $f, f_n$ --- конечны\
- Рассмотрим частный случай: \
  $f_n -> 0 quad forall x$ последовательность $f_n (x)$ --- монотонна по $n$, и тогда $f eq.triple 0$:
$ X(abs(f_n - f) >= eps) = X(abs(f_n) >= eps) supset X(abs(f_(n+1)) >= eps) supset dots $
$ inter.big_n X(|f_n| >= eps) = emptyset double  => double  underbracket( mu X(|f_n| >= eps) -> 0, "по непрерывности сверху") $
- Общий случай:\
  $f_n -> f $\
  $phi_n (x) := sup_(k>=n) abs(f_k (x) - f(x)) $ \ #vtw
  Заметим, что: $forall x: space phi_n (x) -> 0$, причем $phi_n >= 0$ и монотонна, тогда по частному случаю:
$ X(abs(f_n - f) >= eps) subset X(phi_n >= eps) $
$ mu X(abs(f_n - f) >= eps) <= mu X(phi_n >= eps) -> 0 $

  
])





#theorem(name:[Теорема Рисса], body:[
$(X, algebra, mu)$,  $f_n, f: X -> overline(RR)$ --- измеримы, почти всюду конечны, $f_n arrow.long.double_mu f$ - сходимость по мере

Тогда $exists n_k$ - строго возрастающая последовательность, по которой $f_n_k -> f$ почти везде при $k -> oo$


],
proof:
[
  TODO: Дописать доказательство:

  Набросок: 
  
  Построим возрастающую $n_k$ так чтобы $mu X (abs(f_n - f) >= 1/k) < 1/(2^k)$

  Проверим, что $f_n_k -> f$ п.в.
  $ 
  E_k = union.big_(j = k)^(+oo) X (abs(f_n_j - f) >= 1/j) \
  E_1 supset E_2 supset ... \
  cases(E_0 = inter.big_(k = 1)^(+oo) E_k,
  mu E_k <= sum_(j = k)^(+oo) mu X (abs(f_n_j - f) >= 1/j) <= sum 1/(2^i) = 2/(2^k) -> 0) =>
  mu E_0 = 0
  $
  Осталось проверить, что для всех $x$ не в $E_0$ $f_n_k (x) -> f(x)$:
  
  $exists n, x in.not E_n$, т.е. при $j >= n, |f_n_j (x) - f_(x)| < 1/j$, то есть $f_n_j (x) -> f(x)$
])


#pagebreak()

== Наконец-то интеграл
У нас есть $(X, algebra, mu)$

#definition(title:[Интеграл ступенчатой функции (Альфа Версия)], body: [
  $f = sum lambda_k chi_E_k, f >= 0, X = union.sq.big_"кон" E_k$

  Полагаем:
  $ integral_X f dif mu := sum underbracket(lambda_k mu E_k, 0 dot oo = 0) in [0, +oo] $
])

#property_(name:[Свойства], body:[
  + Интеграл не зависит от разложения
    
    $f = sum tilde(lambda_j) chi_F_j$

    Тогда $f = sum_(k, j) tilde(lambda_k) chi_(E_k inter F_j)$

    $integral_X f = sum_(k, j) lambda_k mu(E_k inter F_j)$
  + $f <= g => integral_X f <= integral_X g$
])


#definition(title:[Бета-версия интеграла], body: [
  $f$ - измерима, $f >= 0$

  $ integral_X f dif mu := sup_(0 <= underbracket(g, "ступ.") <= f)(integral_X g dif mu) $
])

#remark_(name:[Замечания], body:[
  + Если $f$ - ступ., то в силу свойства 2.
  + $f >= 0 => 0 <= integral_X f dif mu <= +oo$ 
  + $g$ - ступ., $g <= f => integral_X g <= integral_X f$
])

#definition(title:[Суммируемая функция], body:[
  $f$ --- суммируемая функция, если $int_X f^+, int_X f^-$ --- конечны (положительная и отрицательная срезка)\
])

TODO: тут чет другое хотят в условии определения, что?
#definition(title:[Интеграл суммируемой функции], body: [
  $f$ - измерима и суммируемая функция, $f^+ = max(f, 0), f^- = max(-f, 0)$. Тогда: 

  $ integral_X f dif mu := integral_X f+ dif mu + integral_X f- dif mu $

])

#definition(title:[Интеграл по подмножеству],body: [
  $(X, algebra, mu)$ - пространство с мерой, $E in algebra, f$ - измерима на $X$
  $ integral_E f dif mu := integral_X f chi_E dif mu $
  Здесь $f$ --- суммируема на $E$, если $integral_E f^+, integral_E f^-$ конечны 
])
  
  #remark_(name: [Замечания], body:[
    $alpha$ - определение: $f$ - ступ., $integral_E f = sum lambda_k mu (E_k inter E)$

    $beta$ - определение: $integral_E f = sup_(0 <= underbracket(g, "ступ., на" Е) <= f)(integral_E g dif mu) $
  ])

  TODO: Раздать стилька
  
  #property_(name:[Свойства], body:[
    + Монотонность (по функции):
    
      $f, g$ --- суммируемы, $f <= g$. Тогда $integral_X f <= integral_X g$
      Доказательство
      + $f, g >= 0$ - очевидно
      + $f, g$ - любого знака - TODO просто расписать неравенства
      #remark_(body:[
        $f$ - сумм. $<=> integral |f|$ - конечен
        - $arrow.double.l: f^+, f^- <= |f|$
        - $arrow.double.r: |f| = f^+ + f^-$ - интегрируем, но пока не умеем :(
        //#circle(radius: 1.03em, align(center + horizon, [:(]))
      ])
    + $integral_E 1 dif mu = mu E, integral_E 0 dif mu = 0$
    + $mu E = 0, f$ - изм. $=> integral_E f dif mu = 0$
      
    
    + $integral_E (-f) dif mu = - integral_E d dif mu$
    
      $alpha > 0, integral_E alpha f dif mu = alpha integral_E f dif mu$
      
    + $integral_E f dif mu$ - существует $ => abs(integral_E f dif mu) <= integral_E |f| dif mu$
      
      Доказательство: $-|f| <= f <= |f|$
    + $f$ - изм. на $E, mu E < +oo, a <= f <= b$

      Тогда $a mu E <= integral_E f dif mu <= b mu E$

      *Следствие:* $mu E < +oo, f$ - изм., огр. $=> f$ - сумм. 
      
    + $f$ - сумм. на $E => f$ - почти везде конечен на $E$ 
      
      Суть доказательства: если f больше нуля  и интеграл по E конечен и равен супремуму интегралов ступенчатых функций на E. Если мера множества бесконечности f - $tilde(E)$ больше нуля, то $g := n chi_tilde(E)$
  ])

  #theorem_(name:[Лемма], body:[
    $A = union.big.sq A_k$ --- измеримо,
$g >= 0$ --- ступенчатая. Тогда:
$ int_A g dif mu = sum_(i=1)^infinity int_A_i g dif mu $
  ], proof:[
    Т.к. $g$ --- ступенчата, предствим ее в виде $g = sum_("кон") lambda_i chi_E_i$, где $E_i$ --- допустимое разбиение\
Тогда найдем интеграл:
$ int_A g = sum_(i, "кон.") lambda_i mu(E_i inter A)  =sum_(i, "кон.") lambda_i sum_(k=1)^(+oo)  mu(E_i inter A_k) = $  $ =  sum_i sum_k lambda_i mu(E_i inter A_k) =^((star)) sum_k sum_i lambda_i mu (E_i inter A_k) = sum_k int_A_k g dif mu $

$(star):$ в прошлом семестре обсуждалось, что в рядах можно переставлять слагаемые, если все слагаемые неотрицательные, а у нас именно такие     
  ])

  TODO: украл у прошлого года, обмозговать
 #theorem(name:[ Счетная аддитивность интеграла (по множеству)],
body:[
  $A = union.big.sq A_k$ --- измеримо,
$f >= 0: X -> overline(RR)$ --- измерима на $A$:
Тогда: $ int_A f dif mu = sum_(i=1)^infinity int_A_i f dif mu $
], proof:[
  Давайте докажем два неравенства $(<=), (>=)$.\
$(<=)$:\
$see$ ступенчатую функцию $g$: $0<=g<=f$:
$ int_A g = sum int_A_i g <= sum int_A_i f  $
По определению интеграла для измеримой функции:
$ int_A f = sup_g int_A g  <= sum int_A_i f $
$(>=)$: 
+ $make A = A_1 union.sq A_2$\
  Возьмем ступенчатые функции $g_1, g_2$ с общим  разбиением $E_k:$ \
  $ 0<= &g_1 <= f dot chi_A_1 quad 0 &<= g_2 <= f dot chi_A_2 $
  Т.е. функция $g_1$ тождественный $0$ вне $A_1$, а на $A_1: space  g_1 <= f$. Аналогично для $g_2$\
  Найдем их явное представление:
  $ g_1 &= sum lambda'_i chi_E_i quad g_2 = sum lambda''_i chi_E_i $
  Тогда очевидно, что когда мы их сложим, они будут меньше $f$ на всем $A$ (т.к. $A_1, A_2$ --- дизъ. то ровно одна из $g_1, g_2$ на ней $!= 0$, а каждая из них по отдельности меньше $f$) 
  $ 0 <= g_1 + g_2 <= f dot chi_A $
  Проинтегрируем все это дело:
  $ int_A_1 g_1 + int_A_2 g_2 =^((star)) int_A (g_1 + g_2) <= int_A f $
  $(star): $ равенство станет очевидным, если написать интеграл по определению\
  Теперь перейдем к  $sup$ по $g_1:$
  $ int_A_1 f + int_A_2 g_2 <= int_A f $
  И перейдем к $sup$ по $g_2:$
  $  int_A_1 f + int_A_2 f<= int_A f $ #vfo
+ $make A = union.sq.big_(i=1)^n A_i$ --- доказывается индукцией по   1-му пункту #vfo
+ $A = union.big.sq_(i=1)^(+infinity) A_i = A_1 union.sq A_2 union.sq dots union.sq A_n union.sq B_n$, где $B_n = union.sq.big_(i=n+1)^(+ infinity) A_i$ #v(0.15cm)
  $ int_A f = sum_(i=1)^n int_A_i f + int_B_n f >= sum_(i=1)^n int_A_i f $ 
  Делаем предельный переход при $n-> +oo$ и получаем нужное нам неравенство
]) 


