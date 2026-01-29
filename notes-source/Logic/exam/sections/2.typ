#import "../template.typ":*



= Теорема о полноте исчисления  высказываний

#def[def:] *Условное отрицание*. Зададим некоторую оценку переменных, что $bsl a bsr = x $. Тогда условным отрицанием формулы $alpha$ назовем следующую формулу $uol a uor$:

$ uol a uor = cases(alpha\, x = "И", not alpha\, x = "Л") $

Также, если $Gamma := gamma_1, gamma_2, dots, gamma_n$, то за $uol Gamma uor$ 
обозначим $uol gamma_1 uor, uol gamma_2 uor, dots uol gamma_n uor$.

#theorem(name:[Теорема о полноте], body:[
Если $models alpha$, то $tack.r alpha$
], proof:[
  1. Построим таблицы истинности для каждой связки $(star)$ и докажем в них каждую строку:
$ uol phi uor, uol psi uor tack.r uol phi star psi uor $
   
2. Построим таблицу истинности для $alpha$ и докажем в ней каждую строку:

   $ uol  Xi uor tack.r uol alpha uor $
   
3. Если формула общезначима, то в ней все строки будут иметь вид $uol Xi uor tack.r alpha$,
   потому от гипотез мы сможем избавиться и получить требуемое $tack.r alpha$.

*Приступим:*

*Шаг 1. Лемма о связках*

Запись
$uol phi uor, uol psi uor tack.r uol phi star psi uor$
сводится к 14 утверждениям:

- $not phi, not psi tack.r not (phi \& psi)$ и $not phi, not psi tack.r (phi -> psi)$
- $not phi, psi tack.r not (phi \& psi)$ и $not phi, psi tack.r (phi -> psi)$
- $phi, not psi tack.r not (phi \& psi)$ и $phi, not psi tack.r not (phi -> psi)$
- $phi, psi tack.r (phi \& psi)$ и $phi, psi tack.r (phi -> psi)$
- $not phi, not psi tack.r not (phi or psi)$ и $phi tack.r not not phi$
- $not phi, psi tack.r (phi or psi)$ и $not phi tack.r not phi$
- $phi, not psi tack.r (phi or psi)$
- $phi, psi tack.r (phi or psi)$

*Шаг 2. Обобщение на любую формулу*

*Лемма. Условное отрицание формул:*

Пусть пропозициональные переменные $Ξ := {X_1, dots, X_n}$ ---
все переменные, которые используются в формуле $α$. И пусть
задана некоторая оценка переменных.

Тогда, $uol Ξ uor tack.r uol α uor$

*Доказательство:*

Индукция по длине формулы $α$.

*База:*

Формула $α$ --- атомарная, т.е. $α equiv X_i$. 

Тогда при любом $Ξ$ выполнено 
$uol Ξ uor^(X_i := "И") tack.r X_i$ и $uol Ξ uor^(X_i := "Л") tack.r not X_i$.

*Индукционный переход*: $α equiv phi star psi$, причём $uol Ξ uor tack.r uol phi uor$
и $uol Ξ uor tack.r uol psi uor$

Тогда построим вывод: 

$(1)dots(n)$ — $uol phi uor$ (индукционное предположение)

$(n+1)dots(k)$ — $uol psi uor$ (индукционное предположение) 

$(k+1)dots(l)$ — $uol phi star psi uor$ (лемма о связках: $uol phi uor$ и $uol psi uor$ доказаны выше, значит, их можно использовать как гипотезы)


Откуда лемма доказана.

*Шаг 3. Избавляемся от гипотез*

*Лемма (об устранении посылок?):*

Пусть при всех оценках переменных
$uol Ξ uor tack.r α$, тогда
$tack.r α$.

*Доказательство:*

Индукция по количеству переменных $n$.

*База:* $n=0$. Тогда $tack.r α$ есть из условия.

*Индукционный переход:* 

Пусть $uol X_1, X_2, dots X_(n+1) uor tack.r α$. Рассмотрим выводы: 
$ uol X_1, X_2, dots X_n uor, X_(n+1) tack.r α quad quad uol X_1, X_2, dots X_n uor, not X_(n+1) tack.r α $
По лемме об исключении допущения тогда
$uol X_1, X_2, dots X_n uor tack.r α$

(Лемма об исключении допущения: $alpha tack.r beta$ и $not alpha tack.r beta$, то $tack.r beta$. Доказывается очень просто с помощью теоремы о дедукции)

При этом, $uol X_1, X_2, dots X_n uor tack.r α$ при всех оценках
переменных $X_1, dots X_n$. Значит, $tack.r α$ по индукционному предположению.

])