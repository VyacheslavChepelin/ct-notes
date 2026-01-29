#import "../template.typ":*

= Векторные поля и криволинейный интеграл

== Начало


$gamma: [a, b] -> RR^m$ --- непрерывна\ #von
$gamma'(t) = vec(gap: #5pt, gamma'_1 (t), gamma'_2 (t), dots.v, gamma'_m (t) ) = vec(gap: #5pt, x'_1 (t), x'_2 (t), dots.v, x'_m (t))$ --- для удобства обозначений координатные функции будут $x_i$ вместо $gamma_i$\ #vth
Тогда $gamma$ --- кусочно гладкая, если существует дробление\
$ a = t_0 < t_1 < t_2 < dots < t_n = b: space  forall t in { 1, dots, n}: space gamma stretch("|", size: #150%)_#pad(bottom: -8pt, $[t_(k-1), t_k]$) - "гладкая" $

#definition(title:[Векторное поле в $RR^m$], body:[
  $V : O subset RR^m-> RR^m$ (непрерывное) ---  векторное поле

  По смыслу, у нас есть пространство, и каждой точке этого пространства сопоставлен какой-то вектор (типо магнитное поле)
])

#definition(title:[Интеграл векторного поля по кусочно-гладкому пути], body:[
  
$O in RR^m$ --- область, 
$gamma$ --- кусочно-гладкий путь $[a, b] ->O$, 
$gamma(t) = (x_1(t), x_2 (t), dots, x_m (t))^T$

$V: O subset RR^m -> RR^m$ непрерывное --- векторное поле.

Тогда интеграл векторного поля $V$ вдоль пути $gamma$ равен:
$ I(V, gamma) :&= int_gamma V_1 dif x_1 + V_2 dif x_2 + dots + V_m dif x_m := int_a^b dp(V(gamma(t)), gamma'(t)) dif t =^((star))  \ &=^((star)) int_a^b V_1 (x_1(t), x_2(t), dots x_m (t)) x'_1(t) + V_2 (x_1(t), dots x_m (t)) x'_2 + dots + V_m (dots) x'_m dif t = \ &= 
int_a^b sum_(k=1)^m V_k (x_1 (t), dots, x_m (t)) dif x_k (t) $ #vtw
$(star):$ просто расписали покоординатно $V$ и $gamma$
])

*Свойства:*
1. Линейность по полю
  $ I(alpha V_1 + beta V_2, gamma) = alpha I(V_1, gamma) + beta I(V_2, gamma) $ 
2. Аддитивность интеграла при дроблении пути:

  $gamma : [a,b] -> O$, $c in (a, b)$. Тогда:
  $ I(V, gamma) = I(V, gamma_([a, c])) + I(V, gamma_([c, b])) $

3. Замена параметра:
  $phi: [p, q] -> [a, b] in C^1$,
  $phi(p) = a, space phi(q) = b$, 
  $gamma : [a, b] -> O, quad tilde(gamma) = gamma compose phi $. 
  Тогда $ I(V, gamma) = I(V, tilde(gamma)) $
  #proof 
  $ int_a^b dp(V(gamma(t)), gamma'(t)) dif t &= vec(t := phi(tau), dif t = phi'(tau)d tau) = 
  int_p^q dp(V(gamma(phi(tau))), gamma'(phi(tau))) phi'(tau) dif tau = \ &= 
  int_p^q dp(V(tilde(gamma)(tau)), gamma'(phi(tau)) dot phi'(tau) ) dif tau = 
  int_p^q dp(V(tilde(gamma)(tau)), tilde(gamma)'(tau)) dif tau = I(V, tilde(gamma)) $

4. Объединение носителей:

  $gamma_1: [a, b] -> O $,
  $gamma_2: [c, d] -> O $\  
  $gamma_1(b) = gamma_2(c)$ --- т.е. конец первого пути начинается с началом второго\
  Определим "произведение" путей:\
  
  $gamma := gamma_2 gamma_1$, если:\
  $  gamma:[a, b + d - c] -> O : space 
  gamma(t) = cases(gap: #5pt, gamma_1(t) \, quad & t in [a, b], gamma_2(t - b + c) \, quad &
  t in [b, b + d - c]) $ #vtw
  #set math.cases(delim: "{")
  Тогда наше свойство имеет вид:\
  $ I(V, gamma) = I(V, gamma_1) + I(V, gamma_2) $

5. Противоположный путь:

  $gamma: [a, b] -> O $ --- путь\
  Тогда противположный путь к $gamma$ (обозначается $gamma^-$):
  $  gamma^- : [a, b] -> O, quad gamma^-(t) := gamma(a+b-t) $
  Тогда интегралы по противоположным путям равны с точностью до знака:
  $ I(V, gamma^-) = -I(V, gamma) $
6. Оценка интеграла по пути:
  $abs(I(V, gamma)) <= max_(t in [a, b]) abs(V(gamma(t))) dot l(gamma (t))$
  #proof
  Длина пути: $l(gamma(t)) := int_a^b abs(gamma' (t)) dif t$\
  $M := max_(t in [a, b]) abs(V(gamma(t)))$\
  $ abs(I(V, gamma)) = abs(int_a^b dp(V(gamma(t)), gamma'(t)) dif t) <= int_a^b abs(dp(V(gamma(t)), gamma'(t))) dif t <=_"КБШ" int_a^b abs(V(gamma(t))) dot abs(gamma'(t)) dif t <=\ <= int_a^b M dot abs(gamma'(t)) dif t = M int_a^b abs(gamma'(t)) = M dot l(gamma(t)) $

#pagebreak()
  
  == Потенциальное векторное поле

  #definition(title:[Потенциальное векторное поле], body:[
    $V : O subset RR^m -> RR^m$ --- потенциальное векторное поле
если,  $ exists f : O -> RR in C^1(O): space  forall x in O: space gradient f(x) = V(x) $
$f$ называется потенциалом $V$
  ])

  #theorem(title:[Обобщенная формула Ньютона - Лейбница], body:[
    $V: O subset RR^m -> RR^m $,
$f:O -> RR$ --- потенциал $V$, 
$gamma:[a,b] -> O : cases(gap: #5pt, gamma(a) = A, gamma(b) = B) space $ --- кусочно гладкий.

Тогда $ int_gamma sum_(k=1)^(m) V_k dif x_k = f(B) - f (A) $
  ], proof:[
  1. $gamma$ --- гладкий путь. 
  $
  int_gamma sum_(k=1)^m V_k dif x_k 
  =& int_a^b V_1(x_1 (t), dots,  x_m (t)) x'_1 (t) + V_2 x'_2 (t) + dots + V_m x'_m (t) dif t = \
  =& int_a^b sum_(i=1)^m (diff f)/(diff x_i) (x_1(t), dots, x_m (t)) dot x'_i (t) dif t = \
  =& int_a^b (f(x_1 (t), dots, x_m (t)))'_t dif t = f(x) pole(x = gamma(a), x = gamma(b)) = f(B) - f(A)
  $
 
  2. $gamma$ --- кусочно-гладкий и понятно что делать (просто разбить на несколько интегралов и телескоп)
  ])



  #definition(title:[Независимость от пути],body:[
    Интеграл векторного поля не зависит от пути в области $O$, если $forall A,B in O: forall gamma_1,gamma_2$ из $A$ в $B$:
    $ I(V, gamma_1) = I(V, gamma_2) $
    
  ])
  *Замечание.* Для потенциальных полей так и есть)

  #theorem(body:[$V$ - векторное поле в $O subset RR$, тогда эквивалетно:
1. $V$ - потенциально 
2. Интеграл $V$ не зависит от выбора пути.
3. $forall$ кусочно-гладкого пути $gamma$, замкнутого $integral_X sum v_i d x_i = 0 $

], proof:[
  $1 => 2$ по обобщенной формуле Ньютона-Лейбница.

  $2 <=> 3$ - разбейте кусочно гладкий путь на 2, интегралы будут равны, а если развернуть то по свойству 5, мы получим, что интеграл по петле будет как раз нулю. Так же можно просто взять противоположный путь.

  $2 => 1:$\
 Фиксируем $A in O$, $forall x in O thick $  возьмем путь $gamma_x$ из $A$ в $x$. (тут надо показать почему связное, открытое линейно-связно)
 
$see f(x) := int_(gamma_x) sum V_k dif x_k$ --- является ли потенциалом?\ #vtw
Достаточно проверить, что $(partial f)/(partial x_1) = V_1 (x)$ при $x in O$.\
$  (f(x+h e_1) - f(x))/h &=^((star))  1/h (I(V, gamma_x gamma_0) - I(V, gamma_x)) = ["свойство объединения носителей"] = \ & = 1/h  I(V, gamma_0) = 1/h int_0^1 dp(V(x + t h e_1), h e_1) = int_0^1 V_1(x+t h e_1) =^((star star)) V_1(x+tilde(t) h e_1) -->_(h->0) V_1(x) $

$(star): $ здесь мы дополнительно рассмотрели прямолинейный путь $gamma_0$ из в $x$ в $x + h e_1$\
Формальное его оприсание:
$ gamma_0 : [0, 1] -> O, quad gamma_0 (t) = x + t h e_1 quad gamma'_0 = h e_1 $

$(star star): $ здесь применили #link("https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D0%B2%D0%B0%D1%8F_%D1%82%D0%B5%D0%BE%D1%80%D0%B5%D0%BC%D0%B0_%D0%BE_%D1%81%D1%80%D0%B5%D0%B4%D0%BD%D0%B5%D0%BC")[
  теорему о среднем], поэтому  $tilde(t)$ --- какая-то точка между 0 и 1, а множитель $(b-a)$ из формулировки теоремы с википедии равен $1 - 0 = 1$\

  
])

#pagebreak()
== Локальный потенциал в поле 

#lemma(title:[Необходимое дифф условие потенциальности], body:[
  $V$ - гладкое, потенциальное в. поле. Тогда:
  $ forall x in O: forall k,i,j: (diff V_k)/(diff x_j) = (diff V_j)/(diff x_k) $
],proof:[
  Идейно это вторая производная
])


#theorem(title:[Лемма Пуанкаре], body:[
  $O subset RR^m$ - выпуклая область. $V in C^1(O)$ удовлетворяет  $ forall x in O: forall k,i,j: (diff V_k)/(diff x_j) = (diff V_j)/(diff x_k)$.


  Тогда $V$ - потенциально.
], proof:[
  Возьмем точку $A in O $. Рассмотрим пути м формулу задания путей:
$see gamma_x (t)$ --- прямолинейный путь из $A$ в $x$.\
Формальное описание:
$ gamma: [0, 1] -> O : space gamma_x (t) = A + t (x-A)  space => space  gamma' = x-A $
Рассмотрим следующую функцию, и проверим, что она потенциал:
$ f(x) := int_gamma_x sum V_k dif x_k = int_0^1 dp(V, gamma') dif t = int_0^1 underbracket(sum_(k=1)^m V_k (A + t(x-A)), (2^star)) underbracket((x_k - A_k), (1^star)) dif t $
TODO: что тут раскрылось и как

Чтобы проверить является ли $f$ потенциалом, найдем частные производные:
$ (diff f)/(diff x_l)  =^((1)) int_0^1 V_l (A + t(x-A)) + sum_(k=1)^m (V_k)'_l (A + t(x-A)) dot t(x_k-A_k) dif t =^((2))  $\
$=^((2)) int_0^1 V_l (dots) + sum (V_l)'_k (dots) dot t (x_k - A_k) dif t =^((3)) int_0^1 (t V_l (A + t(x-A)))'_t dif t = t V_l (A + t(x-A)) pole(t=1, t=0) = V_l (x)$ \ \
$(1)$: _Почему можем дифференцировать по функции внутри интеграла?_  Нужно, чтобы функция была непрерывна вместе со своей производной, тогда мы сможем использовать #link("https://ru.wikipedia.org/wiki/%D0%A4%D0%BE%D1%80%D0%BC%D1%83%D0%BB%D0%B0_%D0%9B%D0%B5%D0%B9%D0%B1%D0%BD%D0%B8%D1%86%D0%B0_(%D0%BF%D1%80%D0%BE%D0%B8%D0%B7%D0%B2%D0%BE%D0%B4%D0%BD%D0%BE%D0%B9_%D0%B8%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D0%BB%D0%B0_%D1%81_%D0%BF%D0%B0%D1%80%D0%B0%D0%BC%D0%B5%D1%82%D1%80%D0%BE%D0%BC)")[
  формулу Лейбница - (о производной интеграла по параметру]. Но только концы интеграла не зависят от переменной. А тогда мы просто воспользуемся правилом дифференцирования произведений и продифференцируем сначала  $(1^star)$, а потом $(2^star)$  \
$(2)$: $"По условию" (V_k)'_l=(V_l)'_k$ \
$(3)$: Заметим, что  $(t V_l (A + t(x-A)))'_t = V_l (A + t(x -a)) + t dot sum (V_l)'_k (A + t(x-a))(x_k - A_k)$
])

#definition(title:[Локально потенциальное векторное поле], body:[
  $V$ - локальная потенциальность в поле, если $forall x: exists U(x)$, $V$ - потенциальная на $U(x)$
])

*Следствие:* Если в Лемме Пуанкаре взять $O subset RR^m$ - область. Тогда $V$ локально-потенциально


#lemma(title:[О гусенице], body:[
  $gamma : [a,b] -> O subset RR^m$ --- непрерывный. Тогда 
#clist
+ $exists "дробление" a = t_0 < t_1 < dots < t_n = b$ \
+ $exists "шары" B_1, B_2, dots, B_n subset O$, такие, что $gamma([t_(k-1), t_k]) subset B_k$
], proof:[
  #align(center)[#image("../assets/caterpillar.JPG", width: 60%)]

  $forall c: [a,b]$. Возьмем $B_c:= B(gamma(c), r_c)subset O$ с каким-нибудь радиусом

  Рассмотрим следующие величины:
$ tilde(alpha)_c := inf(alpha in [a, c] : gamma([alpha, c]) subset B_c) $
$ tilde(beta)_c := sup(beta in [c, b] : gamma([c, beta]) subset B_c) $
Идейно это момент входа и выхода из шара.

Заузим: $tilde(alpha)_c < alpha_c < c < beta_c < tilde(beta)_c$

$c |-> (alpha_c, beta_c)$ - открытые покрытия

*Замечание:* надо быть аккуратно с границами. Полуинтервалы открыты на пространстве из нашего отрезко

Отрезок компактен, а значит существует конечное подпокрытие: $ [a, b] subset union.big_"кон." (alpha_k, beta_k) $
Прочистим наше конечное покрытие: будем выкидывать по одному отрезку, пока существуют отрезки, при удалении которых каждая точка $[a, b]$ остается покрытой. \
После совершения такой операции:\

$ forall (alpha_c_k, beta_c_k) space exists d_k in [a, b] : d_k in.not union.big_(i!=k) (alpha_c_i, beta_c_i) $
Для определенности можно считать, что $d_1 < d_2 < dots < d_n$\
+ Кусок отрезка $[a, d_1]$ лежит в интервале $(alpha_c_1, beta_c_1)$, т.к. это первый интервал, значит он должен содержать $a$\
+ Окрестность точки $d_2$ лежит в интервале $(alpha_c_2, beta_c_2)$, все точки на интервале $(d_1, d_2)$ лежат в каких-то интервалах из покрытия, при чем могут лежать только в $(alpha_c_1, beta_c_1)$ и $(alpha_c_2, beta_c_2)$, иначе была бы точка $d_3$  где-то между $d_1$ и $d_2$. \
  Из того, что интервалы пересекаются, делаем вывод, что между $d_1$ и $d_2$ есть точка лежащая и в $(alpha_c_1, beta_c_1)$ и в $(alpha_c_2, beta_c_2)$, назначим её $t_1$, то есть $t_1 in (alpha_с_1, beta_с_1) inter (alpha_с_2, beta_с_2)$
+ Аналогичным образом назначаем $t_2, t_3, dots$. \


])

#definition(title:[Похожие пути],body:[
  $gamma, tilde(gamma):[a,b] -> O$ - непр. Назовем их похожими, если они имеют общую гусеницу
])
#lemma(title:[Равенство интегралов с похожими путями], body:[
  $V$ --- локально потенциальное векторное поле, $gamma, tilde(gamma)$ --- кусочно-гладкие похожие пути,
$gamma(a) = tilde(gamma)(a)$,
$gamma(b) = tilde(gamma)(b)$. 
Тогда $ int_gamma sum V_k dif x_k = int_tilde(gamma) sum V_k dif x_k $
], proof:[
  #align(center)[#image("../assets/8.9.JPG", width: 90%)]
Берем общую гусеницу. В каждом шаре $B_k$ есть некоторый потенциал $f_k$, но они могут отличаться на константу. Поэтому подгоним потенциалы в соседних шарах, чтобы выполнялось:
$ f_k (gamma(t_k)) = f_(k+1)(gamma(t_k)) $
Здесь мы "склеили" потенциалы в точке $gamma(t_k)$ при помощи констант
#vtw
Тогда
$
int_gamma sum V_k dif x_k = sum_(i=1)^n int_(gamma stretch("|", size: #150%)_#pad(bottom: -8pt, $[t_(i-1), t_i]$)) sum V_k dif x_k = 
sum_(i=1)^n f_i (gamma(t_i)) - f_i (gamma(t_(i-1))) =^((star)) f_n (gamma(t_n)) - f_1 (gamma(t_0)) = \
= f_n (tilde(gamma)(t_n)) - f_1 (tilde(gamma)(t_0)) = dots = int_(tilde(gamma)) sum V_k dif x_k
$
$(star):$ это телескопическая сумма, т.к. мы специально подогнали так потенциалы, чтобы соседние сокращались
])
Есть другой вариант: использовать петли

#lemma(body:[
  $gamma [a,b] -> O$ - непр. Тогда $exists delta > 0:$ - такое, что: $ forall tilde(gamma) tilde(tilde(gamma)):[a,b] -> O forall t in [a,b]: |tilde(gamma)(t) -gamma(t)|<delta, |tilde(tilde(gamma))(t)-gamma(t)| < delta $ то $gamma$,$tilde(gamma)$ и $tilde(tilde(gamma))$ похожие
  

  
],proof:[
  #align(center)[#image("../assets/8.10.JPG", width: 70%)]
Берем любую гусеницу пути $gamma$\
Рассмотрим множество $gamma([t_(k-1), t_k])$ --- компакт (т.к. непрерывный образ компакта), а также лежит в $B_k$ \
Тогда $exists delta_k: delta_k"-окрестность"(gamma([t_(k_1), t_k])) subset B_k$\ #vtw
_Например подойдет: $ delta_k := "dist"(S_k, gamma([t_(k-1), t_k]))/2 $_ 
Т.к. таких $delta_k$ --- конечно, то можено взять минимум:
$delta := min_k delta_k$ - это будет нашей $delta$ из условия леммы.\
#vtw
Теперь поймем, что это ровно то, что было нужно:\

$gamma(t_k) in B_k$, тогда все точки отстоящие от $gamma(t_k)$ меньше чем на $delta$ тоже будут лежать в $B_k$. Получается, что для всех путей $delta$-близких к $gamma$, исходная гусеница так же будет и их гусеницей. Тогда мы нашли общую гусеницу у всех таких путей, что и хотели сделать.
])

#definition(title:[ Интеграл ЛПВЛ по непрерывному пути], body:[
  $gamma$ - путь(непр). $V$ - лнвп. Берем $gamma > 0$ из прошлой леммы. Берем $tilde(gamma)$ - кус. гл. путь $forall t : |gamma(t) - tilde(gamma)(t)| < delta$. Тогда

$ I(V, gamma) := I(V, tilde(gamma)) $
])
Корректность очевидно из похожести, но почему такой кус. гладкий существует?

