#import "../template.typ":*

= Лекция 13
==  Аксиоматизация матроидов


#definition(title:[Аксиоматизация базами], body:[
  $X, B subset 2^X$
1. $B in.not nothing$
2. $B_1,B_2 in B, B_1 subset B_2 => B_1 = B_2$
3. $forall x in B_1 without B_2: exists y in B_2 without B_1: B_2 without x union y in B$

Тогда $Beta$  - базы некоторого матроида.
])


#definition(title:[Двойственный матроид], body:[
  $M$ - матриод, $M^*$ - двойственный к нему:

  $M^* = chevron.l X, I^* chevron.r  $, где $B^* = {X without A, A in B}$.    
])


#definition(title:[Аксиоматизация циклами],body:[
  $cal(C)$ - множество циклов матроида.

  1. $nothing in.not C$
  2. $C_1 != C_2 => C_1 subset.not C_2$
  3. $p in C_1 inter C_2 => exists C_3 subset C_1 union C_2 inter p$
])


$I = {A | exists.not C subset A}$

#definition(title:[Аксиоматизация рангами], body:[
  $r$ - ранговая функция $r:2^X-> NN_0$

  1. $0<= r(A)<= |A| $
  2. $A subset B => r(A) <= r(B)$
  3. $r(A union  B) + r (A inter B)<= r(A) + r(B)$
])