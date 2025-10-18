#import "../template.typ":*
= Теория Меры

== Системы множеств

#definition(
  title: [
   Полукольцо множеств $cal(P)$
  ], body: [
    $X$ - множество. $cal(P) subset 2^X$ - *полукольцо*, если:
    + $nothing in cal(P)$
    + $forall A,B in cal(P)$, $A inter B in cal(P)$
    + $forall A, B in cal(P), exists underbracket(B_1\, ...\, B_n, "диз.") in cal(P): A without B = limits(union.big)_(k = 1)^(n) B_k$
  ]
)
#example_(
      title: [
        Полукольцо ячеек в $RR^m$
      ], body:[
        $ a,b in R^m:[a,b)={x in RR^m: forall x = 1 ... m: a_k <= x_k < b_k} $
        То есть множество таких параллелепипедов. Очевидно оно удовлетворяет всем трем аксиомам полукольца.
      ]
    )
    #example_(
      name:[Еще пример],
      body:[
        $X = {1, ..., 6}^m$.
        Покажем, что $cal(P)$ - полукольцо для этого множества 
        1. Очевидно принадлежит.
        2.  $A_(c_1 c_2) inter A_(c_5) = A_(c_1 c_2 c_5) in P$ - работает    
        3. TODO
      ]
    )
    #example_(
      title: [
        Полукольцо рациональных чисел
      ], body:[
        $[a, b)$, где $a_i, b_i in QQ$
      ]
    )
    #property_(
      name: [Антисвойство], 
      body: [
          $cal(P)$ - полукольцо: $A,B in cal(P)$. Тогда вообще говоря $A union B, A without B, X without A, A triangle.small B$ не лежат в $cal(P)$ 
      ]
    )
    #property_(
      body: [
          $forall A, B_1, ..., B_k in cal(P): exists underbracket(D_1 comma ... comma D_n, "диз.")$ - кон. количество: $A without (limits(union.big)_(i=1)^k B_i) = limits(union.big.sq)_(j=1)^n D_j$
          
          Это доказывается по индукции
      ]
    )



#definition(
  title: [Алгебра подмножеств пространства $X$],
  body: [
    $algebra subset 2^X$ - такой объект называется *алгеброй*, если выполнены свойства:
    1. $X in algebra$
    2. $A,B in algebra => A without B in algebra $
  ]
)
 #property_(
      name:[Свойства],
      body: [
          1. $emptyset = X without X in algebra$
          2. $A, B in algebra space => space A inter B = A without (A without B) in algebra$
          3. $A^c = X without A in algebra$
          4. $A union B = (A^c inter B^c) ^c in algebra$
          5. Всякая алгебра есть полукольцо
      ]
    ) 
    #example_(
      title:[Тривиальный -   $2^X$] ,
      body:[
       
      ]
    )
    #example_(
      title:[Хитрый, но простой],
      body:[
        $X = RR^2$. $algebra$ состоит ограниченных множеств и из дополнений ограниченных множеств.
      - $nothing, X in algebra$
      - Выполняется вторая аксиома:
        + $A$ - огр.
        + $A^c$ - огр.
          +. $B$ - огр. $=> (A without B)^c$ - огр.
          +. $B^c$ - огр. $=> A without B subset B^c =>$ огр.
      ]
    )
     #example_(
      title:[На счётность],
      body:[
        $X = $ бесконечное множество: $algebra = {A subset X : A$ НБЧС или $X without A$ НБЧС$}$
      ]
    )

#definition(
  title: [$sigma$-алгебра $algebra$ подмножества $X$],
  body: [
    $algebra in 2^X$ и выполняется:
    + $algebra$ - алгебра
    + $forall A_1, A_2, ... in algebra: limits(union.big)_(i=1)^(+infinity) A_i in algebra $
  ]
)

#property_(
      body:[
        $ forall A_1, A_2, ... in algebra: limits(inter.big)_(i = 1)^(+infinity) A_i in algebra $
      ]
    )

#pagebreak()

== Объем  

#definition(
  title: [Конечно аддитивная функция],
  body: [
    $X, cal(P)$ - полукольцо подмножеств $X$, $phi: cal(P) -> overline(RR)$. $phi$ - #def[конечно аддитивная функция], если:
    + $phi(nothing) = 0$
    + $A, A_1,dots, A_m , A = limits(union.big.sq)_(i=1)^n A_i$ - дизъюнктное объединение, выполнено:
    $ phi(A) = limits(sum)_(i=1)^m phi(A_i) $
  ], after: [
  ]
)

#definition(
  title: [Объем],
  body: [
    $X, cal(P)$ - полукольцо подмножеств $X$, $phi: cal(P) -> overline(RR)$. $phi$ - #def[объем], если:
    1. $phi >= 0$
    2. $phi$ - конечно-аддитивно
  ], after: [
  ]
)
#example_(
      body:[
       $g: RR -> RR$ возрастает и непрерывно. Давайте зададим $mu_g [a,b) = g(b)-g(a)$  - тоже пример объема.

      ]
    )




#theorem(title:[Свойства], body:[
  $mu: cal(P) -> RR$, где $cal(P)$ - полукольцо. Тогда выполнено:
  0.  $B subset A => mu B <= mu A$ --- монотонность объема.
  
  1. #def[Усиленная монотонность]: $forall A_1,..., A_n, A in cal(P) :limits(union.big.sq)_(i=1)^n A_i subset A$:
  
  $ mu A >= limits(sum)_(i=1)^n mu A_i $
  2. #def[Конечная полуаддитивность]: $forall A_1 ...., A_n: A  subset limits(union.big)_(i=1)^n A_i$:
  $ mu A <= limits(sum) u A_i $
  3. $A,B, A without B in cal(P): mu(B) < + infinity$. Тогда:
  $ mu (A without B) >= mu A - mu B $
], proof:[
1. $A without (union.big.sq A_i)=limits(union.big.sq)_("кон.") B_j$  - по модиф. условию кольца. Тогда по вышесказанному:
$ A =limits(union.big.sq)A_i union limits(union.big.sq) B_j $
По определения объема:
$ mu A = limits(sum)mu A_i + limits(sum)mu B_j $
Что и требовалось показать.

2. $B_i := A inter A_i in cal(P): A = limits(union.big)_("кон.")B_i$.

Теперь давайте действовать так: Обозначим за $C_i$ - то какие части множества добавляет та или иная $B_i$
$ C_i = B_i without ( union.big_(j=1)^(i-1) B_j) $
Тогда $A = limits(union.big.sq)^n_(i=1) C_i$. НО. Мы не можем сразу сделать вывод об объеме, так как не факт что $C_i$ лежат у нас в полукольцо. НО каждое $C_i$ мы можем составить из конечного числа множеств по аксиомам полукольца. Воспользуемся усиленной монотонностью и докажем требуемое.

3. Он очевиден из прошлых пунктов.  

КПК: Это проверка на вашу вменяемость


])

#pagebreak()

== Мера

#definition(title:[Мера.],body:[ $X$, $cal(P)$ - полукольцо: $mu : cal(P)-> overline(RR)$ --- #def[мера], если:
1. $mu$ - объем
2. $mu$ - счетно-аддитивно
])
#def[Замечание:] Счетная аддитивность: $forall A_1,... in cal(P): A = limits(union.big.sq)A_i: mu A = limits(sum)_(i=1)^(+infinity)mu A_i$

#def[Замечание:] Объем $ arrow.not.double$ выполняется счетная аддитивность.




#theorem(name:[Теорема об эквивалентности счетной аддитивности и счетной полуаддитивности ], body:[
  $mu: cal(P) -> overline(RR)$ --- объем. Тогда эквивалентно:
  1. $mu$ --- мера, т.е $mu$ --- счетно-аддитивна
2. $mu$ --- счетно-полуаддитивна (нет дизъюнктивности): $forall A, A_1 dots in cal(P), space A subset union.big A_i:$  
$ mu A <= sum_i mu A_i $
], proof:[
  *$1 => 2$*.  Берем второй пункт теоремы о свойствах объема, но вместо конечного объединения по $k$ берем счетное объединение (так как у нас теперь мера, то все хорошо)  и тадам, все получается.
  
*$2 => 1$*. Надо проверить, что:
$ A = union.sq.big_(i=1)^infinity A_i =>^? mu A = sum_(i=1)^infinity mu A_i $
Воспользуемся усиленной монотонностью, тогда для любого $n$ будет верно:
$ sum_(i=1)^n mu A_i <= mu A $
По определению счетной полуаддитивности:
$ mu A <= sum_(i=1)^infinity mu A_i $
Итого :
$ sum_(i=1)^n mu A_i <= mu A <= sum_(i=1)^infinity mu A_i  $
И если перейти к пределу при $n -> +oo$ мы сразу получим то, что требуется.
])

#def[Следствие:] $A in cal(P), A_n in cal(P), mu A_n = 0, mu$ - объем. Пусть $A subset union.big A_n$. Тогда $mu A = 0$

#theorem(name: [
Формулировка теоремы о непрерывности меры снизу], body:[
  $algebra$ - алгебра. $mu: algebra -> overline(RR)$ - объем. Тогда если выполнено:
  1. $mu$ --- мера
  2. $mu$ --- непрерывны снизу:
  $  forall A, A_1, A_2, ... in algebra, quad A_1 subset A_2 subset ..., quad A = limits(union.big)_(i=1)^infinity A_i $         
  
    То выполнено: $ mu A = lim_(i->infinity) mu A_i $

])
#theorem(name:[Теорема о непрерывности меры сверху],body:[
  $algebra$ --- алгебра, $mu: algebra -> RR$ --- _конечный_ объем. Тогда эквивалентно:
1. $mu$ --- мера, т.е счетно-аддитивна
2. $mu$ --- непрерывна сверху, те:\
$ forall A, A_1, A_2, ... in algebra, quad A_1 supset A_2 supset ..., quad A = inter.big_(i=1)^infinity A_i $Следует:$ mu A = lim_(i->infinity) mu A_i $

],proof:[

Нарисуем упрощающий рисунок:
#align(center)[#image("../assets/measure-1.JPG", width:50%)]

*$1 => 2$*\
Пусть $B_k := A_k without A_(k+1)$. Тогда такие $B_k$ дизъюнктивны. Отсюда получаем, что 
$ A_1 = union.sq.big_(i=1)^infinity B_i union.sq A $
Так как $mu$ мера, то получаем, что:
$ mu A_1 = underbracket(sum_(i=1)^infinity mu B_i, "сходится") + mu A $
Теперь посмотрим на "хвост" этого ряда, и аналогично первому утверждению доказательства напишем:
$ mu A_i = sum_(k=i)^infinity mu B_k + mu A $
Т.к. ряд из $sum_(i=1)^infinity mu B_i$ сходится, то при $i-> +oo$, "хвост" $->0: space sum_(k=i)^infinity mu B_k ->_(i -> +oo) 0$
Делаем предельный переход в равенстве выше, и получаем:

$ lim_(i->infinity) mu A_i = 0 + mu A = mu A $

*$2 => 1$*.

Заметим, что из условия следует:
$ A_1 supset A_2 supset dots, quad A = inter.big A_k = emptyset =>mu A = lim_(i->+oo) mu A_i = 0 $
Мы хотим проверить счетную аддитивность, т.е.\
$ C = union.sq.big_(i=1)^infinity C_i =>^? mu C = sum_(i=1)^infinity mu C_i $
Для этого введем множества $A_k$ следующим образом:\

$ A_k = union.big_(i=k+1)^infinity C_i = C without (union.big.sq_(i=1)^k C_i) $
Так как это конечное объединение, то $limits(union.big.sq)_(i=1)^k C_i in algebra$, а значит и правая часть $in algebra =>A_k in algebra$\ 
Заметим также, что
$limits(inter.big)_(k=1)^(+oo) A_k  = emptyset $, т.к. все $C_i$ дизъюнктны, то любая точка из $C$ содержится ровно в одном $C_i$, а значит в $A_(k>i)$ она уже содержаться не будет (по определению $A_k$), и в пересечении всех $A_k$ её тоже не будет

Отсюда следует, что мы можем применять замечание из начала доказательства.\ 
Осталось только заметить, что:
$ C = union.sq.big_(i=1)^k C_i union.sq A_k $
Т.к. $mu$ --- объем:
$ mu C = sum_(i=1)^k mu C_i + mu A_k $
Делаем предельный переход при $k->+oo$
$ mu C = sum_(i=1)^(+oo) mu C_i + 0 $
   
])



#pagebreak()
==  Продолжение меры.



#definition_(title:[Пространство с мерой], body:[Обозначается  тройкой $(underbracket(X, "мн-во"), underbracket(algebra, sigma"-алг."), underbracket(mu, "мера"))$])

#definition_(title:[Полная мера],body:[
$mu: cal(P) subset 2^X  -> overline(RR)$ --- мера \
$mu$ --- *полная мера*, если
$ (B in cal(P):  space mu(B) = 0) =>  (forall A subset B: space A in cal(P), " а значит" mu(A) = 0) $
Формально: если в полукольце есть множество меры 0, то все его подмножества также лежат в полукольце, а значит тоже имеют меру 0 
])
#definition_(title:[Сигма-конечная мера], body:[
$mu: cal(P) subset 2^X-> overline(RR)$ --- мера (или объём) \
$mu$ --- *$sigma$-конечная мера* (или объем), если\
$ exists A_1, A_2, dots in cal(P) quad  X = union.big_(i = 1)^(+infinity) A_i, space mu(A_i) < +infinity $
])

#def[Замечание.] Множество измеримо, если оно лежит в области определения меры 

//скопировал у прошлых лет, не хочу даже думать
#theorem(name:[Теорема о лебеговском продолжении меры], body:[
$cal(P_0) subset 2^X$ --- полукольцо: $mu_0: cal(P_0) -> overline(RR)$ --- $sigma$-конечная мера. 

Тогда
$ exists sigma"-алгебра"  algebra: cal(P_0) subset algebra " и " exists mu  "- мера на" algebra$
такие, что:
+ $mu stretch("|", size:#150%)_#pad(bottom: -8pt)[$cal(P)$]= mu_0$, т.е. $mu$ --- продолжение $mu_0$ на $algebra$ #vtw
+ $mu$ --- полная мера #vtw
+ Если $algebra_1$ - $sigma$-алгебра, $mu_1$-мера, полная, $cal(P) in algebra_1 , mu_1|_(cal(P))$, то $algebra subset algebra_1, mu_1|_a = mu$
+ Если $cal(P)subset cal(P_2) subset algebra: mu_2 |_(cal(P)) = mu_0$, то  тогда $mu|_(cal(P_2))=mu_2$
+ $A in algebra, mu A$ - кон, то 
$ mu A = inf (sum mu P_k, A subset limits(union.big)_(k=1)^(+infinity)P_k, "где "P_k in cal(P)) $
])
К счастью, без доказательства

#definition_(title:[$mu$-измеримое множество], body:[
$A subset X - mu$-измеримо, если $forall E  subset X:$
$ mu E = mu (A inter E) + mu (A^C inter E) $
])

#pagebreak()
== Мера Лебега.

Автор ничего не понимает и еще в будущем будет стдеть  и перепечатывать доказательство. Пока так.

#lemma(name:[Лемма], title:[Счетная аддитивность классического объема],
body:[
  Счетная аддитивность классического объема
$cal(P)^m$ --- множество всех ячеек на $RR^m$.\
$mu$ --- классический объем.
Тогда $mu$ --- $sigma$-конечная мера.
],proof:[
  1. $sigma$-конечность очевидна: можно либо разлиновать пространство на клеточки как в тетради, либо просто взять увеличивающийся параллелепипед
  2. Осталось доказатьь, что $mu$ - мера. Если докажем счетную полуаддитивность, то по т. об эквив. счетной аддитивности и счетной полуадитивности, получим, что $mu$ - мера.
  $ P = [a, b),  space P_n = [a_n, b_n):  space P subset union.big_(n=1)^(+oo) P_n  space =>^? space mu P <= sum mu P_n $
  Далее под фразой "чуть уменьшим" вектор из $RR^m$ будем подразумевать небольшое уменьшение каждой из его координат. Возьмем $epsilon>0$: 
1. Чуть уменьшим $b$ и получим $b':$ 
$ [a, b'] subset [a, b) : space  mu(P without [a, b')) < epsilon $

2. Теперь для каждого $P_n$ немного уменьшим $a_n$ и получим $a'_n:$

$ (a'_n, b_n) supset [a_n, b_n) : space mu([a'_n, b_n) without P_n) < epsilon / 2^n $
3. Получаем, что $underbracket([a, b'], "компакт") subset limits(union.big)_(n=1)^(+oo) (a'_n, b_n) $\
  Т.к. это компакт, а справа стоит открытое покрытие, то по определению существует конечное подпокрытие:\
$ [a, b'] subset union.big_(n=1)^N (a'_n, b_n) $
  Теперь в правую часть  включения добавим часть точек, а слева уберем. Очевидно включение от этого не сломается:
$ [a, b') subset union.big_(n=1)^N [a'_n, b_n) $

По конечной аддитивности:

$ mu[a, b) - epsilon <=^((1))  mu[a, b') <=^((3)) sum_(n=1)^N mu [a'_n, b_n) <=^((2)) sum_(n=1)^N (mu [a_n, b_n) + epsilon/2^n) $
$ mu[a, b) <=  epsilon + sum_(n=1)^N mu [a_n, b_n)<= 2 epsilon + sum_(n=1)^(+oo) mu [a_n, b_n) $

Делаем предельный переход при $eps -> 0$ и получаем ровно то, что и хотели.
])


#definition(title:[Мера Лебега], body:[
  #def[Мера Лебега] в $RR^m$ --- это результат применения теоремы о продолжении лебеговском продолжении меры к класс. объему. 
  
$(RR^m, cal(P), mu_0) arrow.squiggly (RR^m, cal(m)^m, lambda)$, где $mu_0$ - классический объема, 
$lambda, lambda_m$ --- мера Лебега (иногда хотим указывать размерность пространства)
])

#property_(body:[
  1. Объединение, пересечение (в том числе счетные) множеств, изменимые по Лебегу тоже
  2. Полнота. $lambda A  = 0, B subset A => lambda B = 0$
  3. Содержит все открытые и замкнутые множества в $RR^m$ (доказательство см ниже)
  + $E$ --- измеримо и $lambda(E) = 0 => "у " E$ нет внутренних точек
+ $A in cal(M)^m, "тогда" forall eps > 0:$
  - $exists$ открытое $G_eps: A subset G_eps : lambda(G_eps without A) < eps$
  - $exists$ замкнутое $F_eps: A supset F_eps : lambda(A without F_eps) < eps$
], proof:[
  5. Пусть $lambda A < + infinity:  forall epsilon > 0: exists P_k : A subset union.big P_k$ по пункту 5 теоремы о лебеговском продолжении меры

  $ lambda A <= sum lambda P_k <= lambda A + epsilon $

  Заменим $P_k = [a_k, b_k]$ на $P'_k = (a_k - alpha_k, b_k)$, так, чтобы $lambda P_k' < lambda P_k + epsilon/2^k $.

  Возьмем $G_epsilon := union.big P'_k$ - открытое. Тогда:
  
  $ lambda A <= sum lambda P'_k < (sum lambda P_k) + epsilon < lambda + 2 epsilon $

  Заметим, что тогда выбранное $G_eps$ удовлетворяет условию.

  Теперь для произвольного $A$: $RR^m = union.big.sq Q_i$. $A  inter Q_i$. Существует открытое $G_i$, что $(A inter  Q_i) subset G_i$

  $ lambda (G_i without (A inter Q_i))< epsilon / 2^i $

  TODO: тут не совсем понял, как мы такие $G_i$ можем выбрать, ладно

  $A = union.big.sq (A inter Q_i) subset union.big G_i = G$ - открытое.

  Ну и видно, что найденное $G$ подходит условию.
  
])



#lemma(title:[О    смысле жизни  множеств меры 0], body:[
  $O subset RR^m$ --- открытое.  Тогда $exists Q_i: space O = limits(union.big.sq)_(i=1)^(+oo) Q_i$, 
  где $Q_i$ --- кубические ячейки:
  - можно считать, что они с рациональными координатами.
  - можно даже считать, что с двоично-рациональными
  - они "закопаны" внутрь области O. $Q_i subset overline(Q_i) subset O$
], proof:[
  $forall x in O: $Возьмем $ Q(x)$ - любую кубические ячейку с нужными нам из условия свойствами, в которую входит $x$

  $ O = limits(union.big)_(x in Q)Q(x) limits(=)_("шаманим") limits(union.big)_(i=1)^(+ infinity) Q(x_i) $

  Шаманство: $O$ --- _континуальное_ множество. Казалоcь бы, как такое посчитать. Заметим, что ячеек с двоично-рациональными координатами счетно. Так что мы просто пройдемся по ним и будем нумеровать, так что шаманство работает!

  Теперь осталось сделать их дизъюнктными. Ну давайте брать лишь ту часть, которую наша ячейка добавляет и разбивать ее на ячейки, каждая из которых из очевидных соображений будет удовлетворять условию
])
#lemma(title:[О    смысле жизни множеств меры 0], body:[
  $E$ --- измеримо, $lambda E =0$.  Тогда $forall epsilon > 0: exists Q_i$, такие что:
$ E subset limits(union.big)_(i=1)^(+infinity)Q_i " и " sum_(i=1)^(+infinity)lambda Q_i < epsilon $
  где $Q_i$ --- кубические ячейки с двоично-рациональными координатами

  *Замечание:* Вместо кубических ячеек можно взять шары, потому что $ Q(a, r/sqrt(m)) subset B(a, r) subset Q(a, r) subset  B(a, r sqrt(m)) $
], proof:[
   Из 5го пункта продолжения меры:
   
  $ 0 = lambda E = inf{sum_(i=1)^(+oo) lambda P_i stretch(|, size: #200%) E subset union.big P_i} $ 
  Т.к. inf равен 0, то мы можем найти там сколько угодно малое значение 
  
  Подберем покрытие $E$ параллепипедами $P_i:sum_(i=1)^(+oo) lambda P_i < eps/2$
  
  Теперь каждую ячейку $P_i$ "поместим"  в ячейку $R_i$ с двоично-рациональными координатами, так чтобы $ lambda(R_i without P_i) < eps / 2^(i+1) $
  Получается, что $sum_(i=1)^(+oo) lambda R_i < eps$

  
  Чтобы ячейки стали кубическими, аналогично прошлому лемме раздробим $R_i$ 
])

 #def[Пример неизмеримого по Лебегу множества]
 
Зададим отношение $~$ на $RR: $\
$ x ~ y <=> x - y in QQ $
$RR \/ _~ thick = A$ --- т.е из каждого класса эквивалентности взяли по одной точке. Заодно можно считать, что $A subset [0, 1]$\ #vtw
Заметим, что есть следующее включение:
// $ union.sq.big_(q in QQ) (A + q) = RR $. А также:
$ [0, 1] subset union.sq.big_(q  in QQ  inter [-1, 1]) (A + q) subset [-1, 2] $
Левая часть следует из того, что если взять точку $x in [0, 1]$, представителя его класса $y in A$ и найти $x -y$, то окажется что это значение во-первых рациональное, во-вторых $in [-1, 1]$, а т.к. мы перебираем все рациональные числа, из этого отрезка в качестве смещений, то в $x$ мы тоже попадем\
Правая часть следует из того, что смещая точки из отрезка $[0, 1]$ на смечение от -1 до 1, мы всегда попадаем в отрезок $[-1, 2]$\ #vtw

Предположим $A$ --- измеримо, тогда можем посчитать меру отрезков (воспользуемся счетной аддитивностью):
$ 1 <=  sum_(q  in QQ  inter [-1, 1]) lambda (A + q) <= 3 $
Пока строго обосновывать не будем, но при сдвиге мера множества не меняется\
Значит  $sum lambda (A + q)$ --- сумма счетного числа одинаковых слагаемых, соответственно есть два варианта:
+ $lambda (A + q) =0 => sum lambda (A + q) = 0$
+ $lambda (A + q) != 0 => sum lambda (A + q) = infinity$ #vtw
В обоих случаях одно из неравенств не выполняется, а значит $A$ --- неизмеримое.


#theorem(name:[Регулярность меры Лебега], body:[
  $A in cal(M)^m, forall eps > 0:$
  1. $exists$ открытое $G_eps: A subset G_eps : lambda(G_eps without A) < eps$
  2. $exists$ замкнутое $F_eps: A supset F_eps : lambda(A without F_eps) < eps$
], proof:[
 1. а) Пусть $lambda A < + infinity$. 
  \ Тогда:
  $lambda A = inf {sum_(k=1)^(+oo) lambda P_k stretch("|", size: #200%) A subset limits(union.big)_(k=1)^(+oo) P_k}$ по теореме о продолжении меры.
  
  Из технического описания мы можем выбрать элемент, который лежит сколь угодно близко к inf: \ $ forall eps > 0 space exists (P_k): lambda A <= sum_(k=1)^(+oo) lambda P_k <= lambda A + eps /2 $
  Теперь осталось сделать каждое $P_k$ открытым, чтобы их счетное объединение было тоже открытым, содержало $A$ и было ограничено. На это мы оставили "запас" $eps/2$, как раз на то чтобы раздуть ячейки
  
  Немного уменьшим $a_k$ и получим $a'_k:$
  $ (a'_k, b_k) supset P_k, " а также " mu((a'_k, b_k) without P_k) < eps/2^(k+1) $

  Тогда наше $G_eps := union.big_(k=1)^(+oo) (a'_k, b_k)$ --- открытое, т.к. это счетное объединение открытых\ 

  Очевидно, что:
  + Т.к. $(a'_k, b_k) supset P_k => A subset G_eps => lambda A <= lambda G_eps$ 
  
  + $lambda G_eps <= (sum_(k=1)^(+oo) lambda P_k )+ eps/2 < lambda A + eps /2 + eps /2 = lambda A + eps$
  
  Мы получили ровно то что хотели: $mu (G_eps without A) < eps$

  б) Теперь предположим, что $mu A = +oo$
  
  Тогда по $sigma$-конечности: $RR^m = union.big.sq Q_i$, где $Q_i$ --- кубические ячейки\ #vtw
  Рассмотрим $A$ как пересечение с этой "сеткой" и для каждого пересечения будем брать свое $G_(e,j)$ такое что:
  $ A = union.big.sq_(j=1)^(+oo) underbracket(A inter Q_j, subset G_(eps, j)), quad lambda (G_(eps, j) without (A inter Q_j)) < eps / 2 ^ j $
  
  Тогда $ G_eps := limits(union.big)_(j=1)^(+oo) G_(eps, j)$ --- открыто, т.к. счетное объединение открытых. 

2. Возьмем дополнение и проделаем все рассуждения про него. А дальше, у получившегося открытого множества возьмем дополнение и заметим, что его разница с $A$ как раз есть $eps$

]

)

#pagebreak()
== Произведение мер


#definition(title:[Произведение мер], body:[
 $ (X, cal(A), mu), (Y, cal(B), nu)$, $mu,nu$ - сигма-конечные. 

 $P = {A times B |A in cal(A), B in cal(B)}$ - полукольцо измеримых прямоугольников

 Мера, полученная из $m_0$(из теоремы о произведении мер) по теореме о Лебеговском продолжении меры, на $P$ обозначается $mu times nu$.

 Соответствующее пространство и сигма алгебра обозначаются:
 $ (X times Y, cal(A) times cal(B), mu times nu) $
])

#theorem(title:[Произведение мер], body:[
  $(X, cal(A), mu), (Y, cal(B), nu)$. Тогда:
  - $m_0$ мера на $P$, где $m_0(A times B)= mu A dot nu B$
  - $mu,nu$ - сигма-конечные, откуда $m_0$ - сигма-конечная 
], proof:[
  $x_(A times B)(x,y) = x_A(x) dot x_B(y)$

  $P = limits(union.sq.big)_("счетно")P_k, P = A times B, P_k = A_k times B_k$
  
  TODO: ТУТ ЧТО-ТО НЕПОНЯТНОЕ
  
])


#theorem(name:[Принцип Кавальери], body:[
  $(X, cal(A), mu)$ и $(Y, cal(B), nu)$. Меры $mu, nu$ - $sigma$-конечные и полные
  
  $m = mu times v$. Построим $(X times Y, A times.circle B, m), C in A times.circle B$

  Тогда:
  1. При п.в $x: C_x in Beta$, где $C_x = {y:(x,y) in C}$ - "типо сечение"
  2. $x |-> nu (C_x)$ $"измеримо"^*$ на $X$, $*: exists overline(f)$ всюду совпадает с $f$ почти везде.
  3. $m C  = int_X nu(C_x)d mu$
], proof:[
  *Замечание*:  
  1. $C$ измеримое $arrow.not.double forall x: C_x$ - измеримо
  2. $forall x, forall y: C_x, C^y$ измеримы $arrow.not.double C$ измеримое

  Рассмотрим *много случаев*

  Пусть $D$ - это класс (множество) подмножеств $X times Y$, для которых принцип верен

  *$(1)$ Простой случай: *
  
  $C = A times B$, где $A in cal(A), B in cal(B)$. Покажем, что $C in D$, то есть что принцип выполнен:
  1. $C_x = B, x in A$ или $C_x = nothing, x in.not A$. Очевидно, что это измеримо при любых $x$
  2. $x |-> nu(C_x)$ это $nu B chi_A (x)$
  3. $m(c) = mu A nu B = int_X nu B dot chi_A(x) d mu$

  *(2) Случай дизъюнктных входящих:*  
  
  $E_i$ - дизъюнктны  и $E_i in D$. Покажем, что $E= limits(union.sq.big)_(i=1)^(+oo)E_i in D$, то есть что принцип выполнен:

  1. $E_x = limits(union.sq.big)_(i=1)^(+infinity) (E_i)_x$ - измеримо при п.в $x$ $(E_i)_x => E_x$ измеримо  при почти всех $x$
  2.  $nu E_x = sum nu (E_i)_x $, тогда получим, что это будет сумма неотрицательных изм. функций.
  
  Откуда $x |-> nu(C_x)$ - измеримо$""^*$
  3.  $int_X nu E_x dif mu = int_X sum nu (E_i)_x dif mu =_("по т. об инт. полож рядов")= sum_i  (int_X nu (E_i)_x dif mu) = sum_i mu E_i = m E$

  *(3) Случай пересечения входящих в $D$:*

  $E_i in D, m E_i < +infinity, E_1 supset E_2 supset ...$ Заметим, что:

$(E_i)_x subset (E_1)_x, int nu(E_1)_x d mu = m E_1 < +infinity => nu (E_1)_x$ п.в конечна $=> nu(E_i)_x$ п.в. конечна
  
  Покажем, что $E := limits(inter.big)_(i=1)^(+ oo) E_i in D$, то есть что принцип выполнен:

  1. $E_x$ измеримо, как пересечение измеримых
  2. $nu (E_i)_x ->_(i -> + oo) nu E_x$ по непрерывности меры $v$ сверху (измеримо, как предел измеримых)
  3. $int_X nu E_x dif mu  =  lim_(i -> oo) int_X nu (E_i)_x dif mu = lim_(i ->  +infinity) m E_i = m E$ - по непрерывности меры $m$ сверху.


  *Промежуточный итог*: $cal(P) = cal(A) times cal(B): limits(inter.big)_i limits(union.big)_j A_(i j) in D$, где $A_(i j) in cal(P)$
  
  *(4) Множества меры 0:* 

  $m E = 0$. Покажем, что $E in D$

  $exists$ (почему?) $H = limits(inter.big)_i limits(union.big)_j P_(i j)$, такой что $E subset H, m H = 0, H in D$ по построению

 $0 = m H = int_X nu H_x d mu => nu H_x =0 $ при п.в. $x$

 1. $forall x: E_x subset H_x => E_x$ измеримо 
 2. $nu E_x = 0$
 3. $integral nu E_x d mu = 0 = m E$

 *(5) Без куска меры 0:*

 $C$ - измеримо, $m C < +oo.  C = H without e$, где $m e = 0 , e in D, H = inter.big union.big P_(i j) in D$

 1. $C_x = H_x without e_x$ - изм. почти везде, так как $e subset H$
 2. $x |-> nu C_x = nu H_x - nu e_x$ - измеримо.
 3. $int_X  nu C_x d mu = int_X nu H_x d mu = m H = m C$

 *(6) Любое:*


 $X = limits(union.sq.big)_(i=1)^(+oo)X_i,Y = limits(union.sq.big)_(j=1)^(+oo)Y_j, mu X_i < + inf, nu Y_i < + infinity$

 $X times Y = limits(union.sq.big)_(i,j)(X_i times Y_j)$

 $C = limits(union.sq.big)_(i,j)((X_i times Y_j) inter C)$ - то что внутри принадлежит по пункту 5., а итог верен по пункту  2.
])

#theorem_(name:[Следствие о равенстве интеграла Лебега и определенного интеграла], body:[
  $f:[a,b]-> RR$ - непр $f>=0$. Тогда: $ int_(a)^b f(x)dif x = int_([a,b]) f dif lambda_1 $
], proof:[
  $ int_a^b f(x)dif x = lambda_2 ("ПГ"([a,b], f))= int_([a,b]) f(x) d lambda_1 $
])





#definition( title:[Сечение функции], body:[ $f: C -> overline(RR), C subset X times Y$

$forall x in X:f_x (y) = f(x,y), y in C_x$

$forall y in Y:f_y (x) = f(x,y), x in C_y$
])

#theorem(name:[Теорема Тоннели],  body:[
  $(X, algebra, mu), (Y, cal(B), nu)$ - $m, nu$ - $sigma$-кон и полные, $m= mu times nu$

  $f: X times Y -> overline(RR), f>=0, f - "m - изм"$

  Тогда:
  1. при п.в. $x: f_x$ - измеримо относительно $sigma$-алгебры $cal(B)$
  2. $x |-> phi(x) = int_Y f_x d mu$ - $"изм"^*$ на $X$
  3. $int_(X times Y) d m = int_X phi(x)dif x =int_X (int_Y f(x,y)dif nu(y))dif mu(x) $

  Аналогичные рассуждения можно повторить по $y$.
], proof:[
  0) $f = chi_C, C subset X times Y$ - изм. 
  
  $f_x(y) = chi_(C_x)(y)$ при почти всех $C_x$ изм. мн-во в $X =>$ при этих $x, f_x$ - измеримо.
  
  $ phi(x) = int_Y chi_(C_x)y dif nu(y)= nu C_x "- измеримо как функция по принципу Кавальери" $
  $ m C = int_(X times Y) chi_C dif m = int_X nu(C_x) dif mu = int phi(x) dif mu $
  
  1) $f$ - ступ. $f = sum_(k) alpha_k (chi_(C_k))_X$ - используем первый пункт и линейность интеграла
  
  2) $f>= 0$, $f$-изм. $f = lim g_n$, $g_n$ - ступ, $0<= g_n < f$ - по теореме     о характеристики функций  с помощью ступ. $g_n <= g_(n+1)$

  $ phi(x)=int_Y f_X dif nu =_("Теорема Леви")= lim_(n->+infinity) int (g_n)_x dif nu $

  Обозначим $phi_n (x) = int (g_n)_x dif nu$:
  $0<= phi_n(x)<=phi_(n+1)(x)$
  $ int_X phi(x) dif mu = lim int_X phi_n (x) d mu = lim_(n-> + oo) int_X (int_Y g_n(x,y) dif nu) dif nu = $
  $ = lim_(n -> +infinity) int_(X times Y) g_n dif mu = int_(X times Y) f    dif mu  $
])


#definition_(title:[Бета - функция], body:[
$ Beta(s,t)  = int_(0)^(1)x^(s-1) (1-x)^(t-1) dif x, s, t >0 $  
])

#theorem_(name:[Пример], body:[
  $B(s,t) = (Gamma(s) dot Gamma(t))/ (Gamma (s+t))$
], proof:[
  $ Gamma(s) Gamma(t) = int_(0)^(infinity) x^(s-1)e^(-x) (int_(0)^(+infinity) y^(t-1)e^(-y)dif  y)dif x $

  Сделаем замену $ y = u -x:$
  $ int_0^(+ infinity)x^(s-1)(int_0^(+infinity)(u-x)^(t-1)e^(-u) dif u) dif x = int_0^(+infinity)x^(s-1) (u-x)^(t-1) e^(-u) d lambda_2 =  $
  $ =int ...(int... d x) d u = int_0^(+ infinity)e^u (int_0^u x^(s-1)(u-x)^(t-1)dif x) dif u =  $
  $ =  int_0^(+ infinity) e^u integral_0^1 (u v )^(s-1) dot u^(???)  $

  дальше не распарсил свои записи, позже допишу
])

#theorem_(name:[Пример. Объем шара в $RR^m$], body:[
  Выведем привычные нам формулы для шаров в $RR^m$

  Пусть $alpha_m = lambda_m (B(0,1)), lambda_m (B(0,r)) =alpha_m dot r^m$
  
  $ alpha_m = int_(-1)^1 alpha_(m-1)(1-y^2)^((n-1)/2)dif y =_([t = y^2]) alpha_(m-1) int_0^1 t^(-2) (1-t)^((m-1)/2)dif y = alpha_(m-1)Beta(1/2, (m+1)/2) =  alpha_(m-1) (Gamma(1/2) Gamma((m+1)/2))/(Gamma(m/2 + 1)) $
  $ a_m = a_(m-1)  (Gamma(1/2) Gamma((m+1)/2))/(Gamma(m/2 + 1)) = ... = (Gamma(1/2)^(n-1) Gamma(3/2))/(Gamma (m/2+1) ) = (sqrt(pi^(n+1))dot 3/2 )/Gamma(m/2 + 1) $
])














