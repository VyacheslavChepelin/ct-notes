#import "../template.typ":*

= Теория моделей и теоремы исчисления предикатов


#def[def:]   *Оценка*: Упорядоченная четвёрка ⟨D, F, P, E⟩, где:
    -   D — предметное множество --- непустое множество объектов (D $!= nothing$), из которого берутся значения для предметных переменных.
    -   F — интерпретация функциональных символов. то $F_(f_n): D^n -> D$.
    -   P — интерпретация предикатных символов. $P_(T_n): D^n -> V$, где V = {И, Л}.
    -   E — оценка предметных переменных. E(x) ∈ D для любой переменной x.

#def[def:] Формула φ *общезначима*, если она истинна при любой оценке (при любых D, F, P, E).

#def[def:] Формула φ является *логическим следствием множества* формул Γ, если φ истинна во всех моделях, в которых истинны все формулы из Γ.

#theorem(title:[о дедукции в ИП], body:[
  Если $Gamma tack.r alpha -> beta$, то $Gamma, alpha tack.r beta$. 
  
  Если $Gamma,alpha tack.r beta$ и в доказательстве не применяются правила для кванторов по свободным переменным из $alpha$, то $Gamma tack.r alpha -> beta$
], proof:[

$(=>)$ — как в КИВ $(=>)$ — та же схема, два новых случая.

Перестроим: $delta_1, delta_2, dots, delta_n equiv beta$ в $alpha -> delta_1, alpha -> delta_2, dots, alpha -> delta_n$.

Дополним: обоснуем $alpha -> delta_n$, если предыдущие уже обоснованы.

Два новых похожих случая: правила для $forall$ и $exists$. Рассмотрим $forall$.

Доказываем $(n) quad alpha -> psi -> forall x phi$ (правило для $forall$), значит, доказано  


$(k) quad alpha -> psi -> phi$.

$(n-0.9) quad (alpha -> psi -> phi) -> (alpha and psi) -> phi$  Т. о полноте КИВ  

$(n-0.6) quad (alpha and psi) -> phi$  M.P. $k$, $n-0.8$  

$(n-0.4) quad (alpha and psi) -> forall x . phi$  Правило для $forall$, $n-0.6$  

$(n-0.3) quad ((alpha and psi) -> forall x . phi) -> (alpha -> psi -> forall x . phi)$  Т. о полноте КИВ

$(n) quad alpha -> psi -> forall x . phi$  M.P. $n-0.4$, $n-0.2$
])

#theorem(title:[Корректность подстановки], body:[Если $theta$ свободен для подстановки вместо $x$ в $phi$, то $bsl phi bsr^(x:= bsl theta bsr) = bsl phi[x : = theta] bsr$], proof:[Будем делать индукцией по структуре $phi$.

*База:* $phi$ не имеет кванторов - очевидно

*Индукционный переход:* пусть справедливо для $phi$. Покажем для $phi = forall y. psi$

- $x = y$ либо $x in.not F V(psi)$. Тогда: $bsl forall y . psi bsr^(x:= bsl theta bsr) = bsl y. psi bsr = bsl (forall y. psi)[x := theta]bsr$
- $ x eq.not y$. Тогда 

$ bsl forall y.psi bsr^(x = bsl theta bsr) = bsl psi bsr^(y in D, x := bsl theta bsr) =^(1) bsl psi bsr^(x := bsl theta bsr, y in D) =^(2) bsl psi[x:=theta] bsr^(y in D) = bsl (forall y.psi)[x:= theta]bsr $


])

#theorem(title:[Корректность исчисления предикатов], body:[
  Если $Gamma tack.r alpha$ и в доказательстве не используются кванторы по свободным переменным из $F V(Gamma)$, то $Gamma models alpha$
], proof:[
  Фиксируем $D,F,P$. Делаем индукцию по длине доказательства $alpha$: при любом $E$ выполнено $Gamma models alpha$ при длине доказательства $n$, покажем для $n+1$.

  Здесь просто аккуратно пользуемся прошлой теоремой.
])

