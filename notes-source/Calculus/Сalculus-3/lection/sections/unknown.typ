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

#theorem(name:[Теорема Лебега о сходимости почти везде и сходимости по мере], body:[
  TODO
])
