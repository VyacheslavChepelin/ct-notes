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


#definition(title:[Мера Лебега-Стилтьеса], body:[
  $g: RR -> RR $ возрастает. $mu g([a,b)):= g(b-0)-g(a-0)$ - сигма-конечная мера

  Применим теорему о Лебеговском продолжении меры. Получим $sigma$-алгебру $cal(A), mu_g : A -> overline(RR)$, сигма-конечная и полная 

  $mu_g|_(P^1)$ - это мера Лебега Стилтьеса
])



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