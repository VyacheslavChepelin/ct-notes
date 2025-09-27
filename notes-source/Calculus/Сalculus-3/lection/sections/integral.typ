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





