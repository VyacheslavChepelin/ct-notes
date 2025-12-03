#import "../template.typ":*

= Лекция 12
==  Продолжение матроидов


#theorem(title:[Слабая теорема о базах], body:[
  1. $Beta_1, Beta_2 in cal(B) -> Beta_1 subset.not B_2$
  2. $forall x in Beta_1 without Beta_2: exists B_2 without B_1: B_1 without x subset y in cal(B)$
])
#theorem(title:[Сильная теорема о базах], body:[
  2. $forall y in Beta_2 without Beta_1: exists x in Beta_1 without B_2:
  B_1 without x subset y in cal(B)$
])

$r: 2^X -> NN_0$

#theorem(title:[О рангах], body:[
  1. $0 <= r(A)<= |A|$
  2. $A subset B => r(A) <= r(B)$
  3. $r(A inter B) + r (A union B)<= r(A) + r(B)$
  
], proof:[
  1-2 очев

  #lemma_(title:[
  ], body:[
    $A subset B$, $A_0$ - макс. незав. по включению $A: exists B_0$ - макс независимое $B$, что $A_0 subset B_0$
  ])
])

== Циклы в матроидах

#theorem(title:[О циклах], body:[
  $cal(C)$ - множество циклов. Тогда
  1. $nothing in.not cal(C)$
  2. $C_1,C_2 in cal(C), C_1 subset.not C_2$
  3. $C_1 != C_2, C_1,C_2 in cal(C): forall p in C_1 inter C_2: C_1 union C_2 without p in.not I $ или $exists C_3 subset C_1 union C_2 without p$
], proof:[
  1-2 очев. Докажем 3. Заметим, что если $C$ - цикл, то $r(C)  = |C| -1$

  $ r(C_1  inter C_2) + r(C_1 union C_2) <= r(C_1) + r(C_2) $
  $ r(C_1  union C_2) <= |C_1 union C_2| -2 $

  Откуда уже очевидно требуемое

]
)

#lemma(body:[
  $A in I, x in.not A, A union x in.not I$, откуда $exists! C subset A union x $
], proof:[
  От противного, тогда $x in C_1, C_2$, Тогда $exists C_1 subset C_1 union C_2 without x$, тогда $C_3$ лежит в $A$ - противоречие.
])

Вернемся к усиленной версии теоремы о базах

#theorem(title:[Сильная теорема о базах], body:[
  2. $forall y in Beta_2 without Beta_1: exists x in Beta_1 without B_2:
  B_1 without x subset y in cal(B)$
], proof:[
  От противного, используем последнюю лемму и побеждаем 
])

== Замыкания

#definition(title:[Замыкание span A], body:[
  $chevron.l A chevron.r$ - все множества $X$, что добавление $X$ в $A$ не меняют ранг

  1. $chevron.l A chevron.r = {a | r(A) = r(A union a)}$
  2. $chevron.l A chevron.r$ - макс. по вкл. $B, r(A) = r(B), A subset B$
]) 

#theorem(title:[О замыканиях], body:[
  1. $A subset chevron.l A chevron.r$
  2. $chevron.l chevron.l A chevron.r chevron.r = chevron.l A chevron.r$
  3. $A subset B => chevron.l A chevron.r subset chevron.l B chevron.r$
  4. Если $q in.not chevron.l A chevron.r, q in chevron.l A union p chevron.r => p in chevron.l A union q chevron.r$
] )



