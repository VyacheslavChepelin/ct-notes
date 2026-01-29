#import "../template.typ":*
#import "@preview/mitex:0.2.6": *

= Применение аксиомы выбора
#theorem(name:[Теорема Диаконеску], body:[
  
Если рассмотреть ИИП с ZFC, то для любого $P$ выполнено $tack.r P  or  not P$.

], proof:[
  #image("../assets/diakones.png")
])

#theorem(name:[Теорема конечного выбора], body:[
Если $X_1 eq.not nothing, .., X_n eq.not nothing$, $X_i inter X_j = nothing$ при $i eq.not j$, то $times {X_1, dots, X_n} eq.not nothing$.


  
], proof:[
  Доказательство:

- База: $n=1$. Тогда $exists x_1.x_1  in   X_1$, поэтому $exists x_1.{x_1}  in   times {X_1}$.
- Переход: $ exists v.v  in   times {X_{1,n}}->exists x_{n+1}.x_{n+1}  in   X_{n+1}->
v union {x_{n+1}}  in   times (X_{1,n}union{X_{n+1}}) $
])

#definition(name:[
Аксиома счётного выбора], body:[
  Для счётного семейства непустых множеств существует функция, каждому из которых сопоставляющая один из своих элементов
])

#definition(name:[
Аксиома зависимого выбора], body:[
Если $forall x  in   E.exists y  in   E. x R y$, то существует последовательность $x_n: forall n.x_n R x_{n+1}$
])


#def[def:] *Наследственным свойством* множества назовём такое свойство, которым обладает как само
множество, так и все его подмножества.

#def[def:]  *Фундированным множеством* назовём такое, которое не пересекается хотя бы с одним своим элементом.

#def[def:] *Универсум фон Неймана* $V$ --- все наследственные фундированные множества.


При наличии аксиомы фундирования можно показать, что $V = union_a V_a$, где:

$ V_a = lr(\{mat(delim: #none, align: #left, n o t h i n g comma, a = 0;
cal(P) (V_b) comma, a = b';
union.big_(b < a) (V_b) comma, a " --- предельный")) $

#def[def:] *Конструктивный универсум* $L = union_a L_a$, где:

$ L_a = lr(\{mat(delim: #none, align: #left, n o t h i n g comma, a = 0;
{{x in L_b med | med phi(x comma t_1 comma ... comma t_k)} med | med phi " --- формула" comma t_i in L_b} comma, a = b';
union.big_(b < a) (L_b) comma, a " --- пред.")) $

#def[def:] *Аксиома конструктивности:* $V=L$, то есть допустимы только те фундированные множества, которые задаются формулами.
