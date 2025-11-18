#import "@preview/touying:0.6.1": *

#let title = "Stern-Gerlach Experiment"
#let author = "Luca Cicu - Lorenzo Liuzzo"
#let date = "27/11/2025"

#let appendix-mode = state("appendix-mode", false)
#let main-slide-count = state("main-slide-count", 0)
#let main-slides-total = state("main-slides-total", 0)

#let slide(title: auto, ..args) = touying-slide-wrapper(
	self => {
	 	if title != auto { self.store.title = title }

	  	let header(self) = {
			set align(top)
			show: components.cell.with(fill: self.colors.primary, inset: 1em)
			set align(horizon)
			set text(fill: self.colors.neutral-lightest, size: 1.1em)
			utils.display-current-heading(level: 1)
			linebreak()
			set text(size: 1.5em)
			if self.store.title != none {
			  	utils.call-or-display(self, self.store.title)
			} else {
			  	utils.display-current-heading(level: 2)
			}
		}


	  	let footer(self) = {
			set align(bottom)
			show: components.cell.with(fill: self.colors.primary, inset: 1em)
			set align(horizon)
			set text(
				fill: self.colors.neutral-lightest, 
				size: .8em
			)
			utils.call-or-display(self, self.store.footer)
			h(1fr)
		
			context {
				let is-appendix = appendix-mode.get()
				let total = main-slides-total.get()
				  
				if is-appendix {
					// In appendix: show "Appendix" or just hide the counter
					"Appendix"
				} else if total > 0 {
					// In main slides: show current / total
					utils.slide-counter.display() + " / " + str(total)
				} else {
					// Fallback: show current / last slide
					utils.slide-counter.display() + " / " + utils.last-slide-number
				}
			}
  		}
	
	  	self = utils.merge-dicts(self, config-page(header: header, footer: footer,),)
	  	touying-slide(self: self, ..args)
	}
)

#let title-slide(..args) = touying-slide-wrapper(
	self => {
		let info = self.info + args.named()
		let body = {
			set align(center + horizon)
			block(
				fill: self.colors.primary,
				width: 80%,
				inset: (y: 1em),
				radius: 1em,
				text(
					size: 1.5em, 
					fill: self.colors.neutral-lightest, 
					weight: "bold", 
					info.title
				),
			)
			set text(fill: self.colors.neutral-darkest)
			if info.author != none { 
				block(info.author) 
			}
			if info.date != none { 
				block(utils.display-info-date(self))
			}
		}
		touying-slide(self: self, body)
	}
)


#let new-section-slide(self: none, body) = touying-slide-wrapper(
	self => {
		let main-body = {
			set align(center + horizon)
			set text(
				size: 2.3em, 
				fill: self.colors.primary, 
				weight: "bold", 
				style: "italic"
			)
			utils.display-current-heading(level: 1)
		}
		touying-slide(self: self, main-body)
	}
)

#let bamboo-theme(
	aspect-ratio: "16-9",
	footer: none,
	..args,
	body,
) = {
	
	set text(size: 20pt)
	show: touying-slides.with(
		config-page(
			paper: "presentation-" + aspect-ratio,
			margin: (top: 5.2em, bottom: 3em, x: 2em),
		),
		config-common(
			slide-fn: slide,
			new-section-slide-fn: new-section-slide,
		),
		config-methods(alert: utils.alert-with-primary-color),
		config-colors(
			primary: rgb("#5E8B65"),
			neutral-lightest: rgb("#ffffff"),
			neutral-darkest: rgb("#000000"),
		),
		config-store(
			title: none,
			footer: footer,
		),
		..args,
    )
	
	body
}


#show: bamboo-theme.with(
	aspect-ratio: "16-9",
	footer: self => self.info.author,
	config-info(
		title: title, 
		author: author, 
		date: date,
	),
)


#title-slide()
= Apparatus



= Quantum Mechanics

== States 
Spazi prodotto diretto \
Funzione d'onda fattorizzata

Condizione di ortonormalità: 
$ chevron.l e_i|e_j chevron.r = delta_(i j) $

Relazione di completezza (o risoluzione dell'identità):
$ I = sum_i |e_i chevron.r chevron.l e_i| $

$ |psi chevron.r = sum_i |e_i chevron.r chevron.l e_i|psi chevron.r = sum_i |e_i chevron.r c_i^psi $
$ chevron.l psi|psi chevron.r = sum_i chevron.l psi|e_i chevron.r chevron.l e_i|psi chevron.r = sum_i (c_i^psi)^* c_i^psi = sum_i |c_i^psi|^2 gt.eq 0 $

$ chevron.l phi|psi chevron.r = sum_i (c_i^phi)^* c_i^psi $



== Operators
#pause
An *operator* $hat(O)$ is something that, when applied to a state $|psi chevron.r$, returns another state $|psi' chevron.r$. 

#pause
We focus on *linear* operators: $quad hat(O)(alpha|psi chevron.r + beta|phi chevron.r) = alpha hat(O)|psi chevron.r + beta hat(O)|phi chevron.r = alpha|psi' chevron.r + beta|phi' chevron.r$ 

#pause
The action of $hat(O)$ is entirely given by its action on some *basis*: 
$ |psi' chevron.r = hat(O)|psi chevron.r = sum_i hat(O)|e_i chevron.r chevron.l e_i|psi chevron.r = sum_(i j) |e_j chevron.r chevron.l e_j|hat(O)|e_i chevron.r chevron.l e_i|psi chevron.r = sum_(i j) |e_j chevron.r O_(i j) c_i^psi $ 

#pause
We can also define the *adjoint* operator: 
$ chevron.l psi'| = chevron.l psi|hat(O)^dagger quad quad hat(O)^dagger_(i j) = (hat(O)_(j i))^* $



== Operators and Observables
#pause
We can associate every *observable* of a system to an operator
$ 
	hat(O) = sum_i lambda_i|e_i chevron.r chevron.l e_i| quad quad
	hat(O)|e_i chevron.r = lambda_i|e_i chevron.r
$
where: 
- $|e_i chevron.r$ are the *possible states* in which the system is *after* the measurement
- $lambda_i$ are the *results* of the measurement.

#pause
The *requirements* are, indipendently by the choice of the basis, that:  
#pause
- the eigenstates are *orthonormal*: $chevron.l e_i|e_j chevron.r = delta_(i j)$ 
#pause
- the eigenvalues are *real*: $lambda_i^* = lambda_i$

#pause
Such operators are called *hermitian* and satisfy the condition 
$hat(O)^dagger_(i j) = lambda_i^* delta_(i j) = lambda_i delta_(i j) = hat(O)_(i j)$.



== QM is Probabilistic
#pause 
$ 
	chevron.l hat(O) chevron.r_psi &= chevron.l psi|hat(O)|psi chevron.r \
	&= sum_i lambda_i chevron.l psi|e_i chevron.r chevron.l e_i|psi chevron.r \
	&= sum_i lambda_i |chevron.l e_i|psi chevron.r|^2 \
	&= sum_i lambda_i P_i
$



== Commutator of Operators
#pause
Given two operators $hat(A)$ and $hat(B)$, we define their *commutator* as
$ [hat(A), hat(B)] = hat(A) hat(B) - hat(B) hat(A) = - [hat(B), hat(A)] $

#pause
$hat(A), hat(B)$ are said to be *compatible iif they commute*, so that $[hat(A), hat(B)] = 0$. 

#pause
Two different observables are *simultaneously determined* iif compatible,
that is if they share a *common basis* of eigenstates:
$ 
	hat(A)|e_i chevron.r = lambda_i|e_i chevron.r quad 
	hat(B)|e_i chevron.r = mu_i|e_i chevron.r quad <=> quad 
	chevron.l e_i|[hat(A), hat(B)]|e_j chevron.r = (lambda_i mu_i - lambda_j mu_j) chevron.l e_i|e_j chevron.r = 0
$

#pause 
For example, *position and impulse* operators *don't commute*! $ [hat(p), hat(x)] = -i planck $



== Uncertanty Principle
#pause
We define the *uncertainty* of an operator $hat(A)$ in a state $|psi chevron.r$ as its *standard deviation*:
$ 
	Delta^2 hat(A)_psi = chevron.l hat(A)^2 chevron.r_psi - (chevron.l hat(A) chevron.r_psi)^2 = chevron.l (hat(A) - chevron.l hat(A) chevron.r_psi)^2 chevron.r_psi
$

#pause
The uncertanty of a pair of operators must satisfy the *uncertainty principle*:
$ 1/4 |chevron.l [hat(A), hat(B)] chevron.r_psi|^2 lt.eq |chevron.l hat(A) hat(B) chevron.r_psi|^2 lt.eq chevron.l hat(A)^2 chevron.r_psi chevron.l hat(B)^2 chevron.r_psi $

#pause
For $hat(x)$ and $hat(p)$, from the canonical commutator we have the *Heisemberg's principle* 
$ Delta^2 hat(x) Delta^2 hat(p) gt.eq planck^2/4 $



== Hamiltonian 
Diocan



== Separability

$ 
	hat(H) = hat(bold(p))^2 / (2m) + V(hat(bold(x))) quad quad
	V(hat(bold(x))) = sum_(i=1)^d V_i (hat(x)_i)  
	#pause 
	quad => quad hat(H) = sum_(i=1)^d hat(H)_i 
$

#pause
$ 
	hat(H)_i = hat(p)_i ^2 / (2m) + V_i (hat(x)_i) quad quad
	hat(H)_i |psi_(n_i) chevron.r = E_(n_i) |psi_(n_i) chevron.r
$ 

#pause
$ [hat(p)_i, hat(x)_j] = -i planck delta_(i j) quad quad [hat(x)_i, hat(x)_j] = [hat(p)_i, hat(p)_j] = 0 $ 
$ [hat(H)_i (hat(x)_i, hat(p)_i), hat(H)_j (hat(x)_j, hat(p)_j)] = 0 text("if") i != j $

#pause
$ 
	psi_(n_1 n_2 dots n_d)(hat(bold(x))) = psi_(n_1)(hat(x)_1) psi_(n_2)(hat(x)_2) dots psi_(n_d)(hat(x)_d) quad quad
	psi_(n_i)(hat(x)_i) = chevron.l x_i|psi_(n_i) chevron.r
$



== 3D Examples: two body system
#slide[
	$ hat(H) = hat(bold(p))_1^2 / (2m_1) + hat(bold(p))_2^2 / (2m_2) + V(hat(bold(x))_1 - hat(bold(x))_2) $
	
	#pause
	$ 
		hat(bold(r)) = hat(bold(x))_1 - hat(bold(x))_2 quad quad 
		hat(bold(p)) = (m_2 hat(bold(p))_1 - m_1 hat(bold(p))_2) / (m_1 + m_2) \ 
		hat(bold(R)) = (m_1 hat(bold(x))_1 + m_2 hat(bold(x))_2) / (m_1 + m_2) quad quad
		hat(bold(P)) = hat(bold(p))_1 + hat(bold(p))_2
	$ 
	
	#pause
	$ M = m_1 + m_2 quad mu = (1/(m_1) + 1/(m_2))^(-1) $
][
	#pause
	$ 
		hat(H) &= hat(bold(P))^2 / (2 M) + hat(bold(p))^2 / (2 mu) + V(hat(bold(r))) \
			   &= hat(H)_B (hat(bold(R)), hat(bold(P))) + hat(H)_r (hat(bold(r)), hat(bold(p)))
	$
	
	#pause
	$ [hat(H)_B, hat(H)_r] = 0 $ 
]



== 3D Examples: Central Simmetry 
$ hat(H) = hat(bold(p))^2 / (2m) + V(|hat(bold(x))|) = hat(bold(p))^2 / (2m) + V(r) $

#slide[
	*Classical* Mechanics: 
	
	#pause
	$ text("using") quad (bold(a) dot bold(b))^2 = |bold(a)|^2 |bold(b)|^2 - |bold(a) times bold(b)|^2 $
	
	#pause
	$ bold(p)^2 = bold(p)_r^2 + bold(L)^2 / r^2 $
	$ 
		p_r = (bold(x) dot bold(p)) / r \ 
		bold(L) = bold(x) times bold(p) 
	$
][
	#pause
	*Quantum* Mechanics: 
	
	#pause
	$ hat(bold(p)) = -i planck bold(nabla) quad quad [hat(p), hat(x)] = -i planck $
	
	#pause
	$ 
		hat(bold(p))^2 &= 1/r^2 ((bold(x) dot bold(p))^2 - i planck (bold(x) dot bold(p)) + hat(bold(L))^2) \
					   &= (hat(p)_r^2 + hat(bold(L))^2 / r^2) 
	$
	$ hat(p)_r = -i planck (partial / (partial r) + 1/r) $

]

	$ hat(H) &= hat(bold(p))_r^2 / (2 m) + V(r) + hat(bold(L))^2 / (2 m r^2) \
			 &= hat(H)_r + hat(bold(L))^2 / (2 m r^2) $

$ 
	psi(hat(bold(x))) = psi(r, theta, phi) = R(r) Y(theta, phi) quad
	Y(theta, phi) = chevron.l theta phi|l m chevron.r
$



== Angular Momentum Operator
#stack(
	v(20pt), 
	$ hat(L)_k = (hat(bold(x)) times hat(bold(p)))_k = epsilon_(k i j) hat(x)_i hat(p)_j $,
	v(50pt), 

	align(center + horizon, 
		grid(
			columns: 2,
			gutter: 30pt,
			align(horizon,[
				#pause
				$ [hat(L)_i, hat(L)_j] = i planck epsilon_(i j k) hat(L)_k $
				
				#pause
				$ hat(L)_z |l m chevron.r = planck m |l m chevron.r $
			]),
			align(horizon, [
				#pause
				$ [hat(bold(L))^2, hat(L)_i] = 0 $
				
				#pause
				$ hat(bold(L))^2 |l m chevron.r = planck^2 l (l + 1) |l m chevron.r $ 
			])
		)
	)
)



== Magnetic Momentum Operator
Diocan 
$ mu_k prop L_k $ 
$ H = - hat(bold(mu)) dot bold(B) $
 

