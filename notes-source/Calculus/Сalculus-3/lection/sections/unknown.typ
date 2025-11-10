#import "../template.typ":*
= Хуй знает где


#definition(title:[Борелевская сигма-алгебра], body:[
$cal(B)$ --- *борелевская* $sigma$-алгебра в $RR^m$ --- минимальная $sigma$-алгебра, содержащая все открытые множества\  
])
 
$B in cal(B)$ --- называется #def[борелевским множеством]

_Следствия:_
1. $forall A subset cal(M)^m space exists B, C$ --- борелевские, такие что $B subset A subset C, double lambda_m (C without A) = lambda_m (A without B) = 0$
  #proof
  $B:= union.big_n F_(1/n) quad C := inter.big_n G_(1/n)$ #v(0.2cm)
2. $forall A in cal(M)^m$ представимо в виде $A = B union N$, где $B$ --- борелевское, а $lambda N = 0$
3. Регулярность меры Лебега



#definition(title:[Мера Лебега-Стилтьеса], body:[
  $g: RR -> RR $ возрастает. $mu g([a,b)):= g(b-0)-g(a-0)$ - сигма-конечная мера

  Применим теорему о Лебеговском продолжении меры. Получим $sigma$-алгебру $cal(A), mu_g : A -> overline(RR)$, сигма-конечная и полная 

  $mu_g|_(P^1)$ - это мера Лебега Стилтьеса
])


