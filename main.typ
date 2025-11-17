#import "conf.typ": *

#show: bamboo-theme.with(
	aspect-ratio: "16-9",
	title: self => self.info.title,	
	footer: self => self.info.author,
	config-info(
		title: "Stern-Gerlach Experiment", 
		author: "Luca Cicu - Lorenzo Liuzzo", 
		date: "27/11/2025",
	),
)


#title-slide()

== QM --- States 
The state of a quantum system is a vector in a *Hilbert* space, that is . 
Condizione di ortonormalità: 
$ chevron.l e_i|e_j chevron.r = delta_(i j) $

Relazione di completezza (o risoluzione dell'identità):
$ I = sum_i |e_i chevron.r chevron.l e_i| $

== QM --- States
$ |psi chevron.r = sum_i |e_i chevron.r chevron.l e_i|psi chevron.r = sum_i |e_i chevron.r c_i^psi $


$ chevron.l psi|psi chevron.r = sum_i chevron.l psi|e_i chevron.r chevron.l e_i|psi chevron.r = sum_i (c_i^psi)^* c_i^psi = sum_i |c_i^psi|^2 gt.eq 0 $

$ chevron.l phi|psi chevron.r = sum_i (c_i^phi)^* c_i^psi $



=== QM --- Spazi prodotto diretto 
We can represent state that are the *direct product* of vectoral spaces: 
$ |psi chevron.r = sum_(i j) c_(i j) |v_i chevron.r times.o |w_j chevron.r  = $ 

We can use these state to represent a multi-dimensional system or a system of multiple quantum objects. 

  

 

Funzione d'onda fattorizzata




== QM --- Operators
#v(10pt)
A *linear operator* $hat(O)$ is a transformation from an Hilbert space into itself, that acts like
$ hat(O)(alpha|psi chevron.r + beta|phi chevron.r) = alpha hat(O)|psi chevron.r + beta hat(O)|phi chevron.r = alpha|psi' chevron.r + beta|phi' chevron.r $ 

#v(30pt)
#pause
The action of $hat(O)$ on a state can be entirely represented by its action on some *basis*: 
$ |psi' chevron.r = hat(O)|psi chevron.r = sum_i hat(O)|e_i chevron.r chevron.l e_i|psi chevron.r = sum_(i j) |e_j chevron.r chevron.l e_j|hat(O)|e_i chevron.r chevron.l e_i|psi chevron.r = sum_(i j) |e_j chevron.r O_(i j) c_i^psi $ 

#v(20pt)
#pause
We can also define the *adjoint* operator $hat(O)^dagger$: $quad chevron.l psi'| = chevron.l psi|hat(O)^dagger quad hat(O)^dagger_(i j) = (hat(O)_(j i))^*$



== QM --- Operators & Observables
#align(horizon, [
	We can associate every *observable* of a system to an operator
	#v(5pt)
	$ 
		hat(O) = sum_i lambda_i|e_i chevron.r chevron.l e_i| quad quad
		hat(O)|e_i chevron.r = lambda_i|e_i chevron.r quad quad
		chevron.l hat(O) chevron.r_psi = chevron.l psi|hat(O)|psi chevron.r = sum_i lambda_i P_i
	$
	where: 
	#v(5pt)
	#h(20pt) - $|e_i chevron.r$ are the *possible states* in which the system is *after* the measurement
	#v(5pt) 
	#h(20pt) - $lambda_i$ are the *results* of the measurement
	#v(5pt)
	#h(20pt) - $P_i$ *probability* 

])

== QM --- Observables & Hermitian Operators
#pause
The *requirements* are, indipendently by the choice of the basis, that:  
#pause
- the eigenstates are *orthonormal*: $quad chevron.l e_i|e_j chevron.r = delta_(i j)$ 
#pause
- the eigenvalues are *real*: $quad quad quad quad quad quad lambda_i^* = lambda_i$

#pause
Such operators are called *hermitian* and satisfy 
$quad hat(O)^dagger_(i j) = lambda_i^* delta_(i j) = lambda_i delta_(i j) = hat(O)_(i j)$



== QM --- Commutator of Operators
#v(10pt)
#pause
Given two operators $hat(A)$ and $hat(B)$, we define their *commutator* as
$ [hat(A), hat(B)] = hat(A) hat(B) - hat(B) hat(A) = - [hat(B), hat(A)] $

#pause
$hat(A), hat(B)$ are said to be *compatible iif they commute*, so that $[hat(A), hat(B)] = 0$. 

#v(30pt)
#pause
Two different observables are *simultaneously determined* iif compatible,
that is if they share a *common basis* of eigenstates:
$ 
	hat(A)|e_i chevron.r = lambda_i|e_i chevron.r quad 
	hat(B)|e_i chevron.r = mu_i|e_i chevron.r quad <=> quad 
	chevron.l e_i|[hat(A), hat(B)]|e_j chevron.r = (lambda_i mu_i - lambda_j mu_j) chevron.l e_i|e_j chevron.r = 0
$

#focus-slide[
	Position and impulse operators \ don't commute! $ [hat(p), hat(x)] = -i planck $
]



== QM --- Uncertanty Principle
#v(20pt)
#pause
We define the *uncertainty* of an operator $hat(A)$ in a state $|psi chevron.r$ as its *standard deviation*:
$ 
	Delta^2 hat(A)_psi = chevron.l hat(A)^2 chevron.r_psi - (chevron.l hat(A) chevron.r_psi)^2 = chevron.l (hat(A) - chevron.l hat(A) chevron.r_psi)^2 chevron.r_psi
$

#v(30pt)
#pause
The uncertanty of a pair of operators must satisfy the *uncertainty principle*:
$ 1/4 |chevron.l [hat(A), hat(B)] chevron.r_psi|^2 lt.eq |chevron.l hat(A) hat(B) chevron.r_psi|^2 lt.eq chevron.l hat(A)^2 chevron.r_psi chevron.l hat(B)^2 chevron.r_psi $

#focus-slide[
	Heisemberg's Principle 
	$ Delta^2 hat(x) Delta^2 hat(p) gt.eq planck^2/4 $
]


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
#v(20pt)
#slide[
	$ 
		#meanwhile
		hat(H) &= hat(bold(p))_1^2 / (2m_1) + hat(bold(p))_2^2 / (2m_2) + V(hat(bold(x))_1 - hat(bold(x))_2) \
		#pause &= hat(bold(P))^2 / (2 M) + hat(bold(p))^2 / (2 mu) + V(hat(bold(r))) \
		#pause &= hat(H)_B (hat(bold(R)), hat(bold(P))) + hat(H)_r (hat(bold(r)), hat(bold(p)))
	$
	
	#v(30pt)
	#pause
	$ [hat(H)_B, hat(H)_r] = 0 $ 
	
][
	#meanwhile
	#align(center, [*Change of coordinates*:])
	
	$ 
		hat(bold(r)) = hat(bold(x))_1 - hat(bold(x))_2 quad quad 
		hat(bold(p)) = (m_2 hat(bold(p))_1 - m_1 hat(bold(p))_2) / (m_1 + m_2) \ 
		hat(bold(R)) = (m_1 hat(bold(x))_1 + m_2 hat(bold(x))_2) / (m_1 + m_2) quad quad
		hat(bold(P)) = hat(bold(p))_1 + hat(bold(p))_2
	$ 
	
	$ M = m_1 + m_2 quad mu = (1/(m_1) + 1/(m_2))^(-1) $
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
					   #pause
					   &= (hat(p)_r^2 + hat(bold(L))^2 / r^2) 
	$
	
	#pause
	$ hat(p)_r = -i planck (partial / (partial r) + 1/r) $

]

	$ hat(H) &= hat(bold(p))_r^2 / (2 m) + V(r) + hat(bold(L))^2 / (2 m r^2) \
			 &= hat(H)_r + hat(bold(L))^2 / (2 m r^2) $

$ 
	psi(hat(bold(x))) = psi(r, theta, phi) = R(r) Y(theta, phi) quad
	Y(theta, phi) = chevron.l theta phi|l m chevron.r
$



== QM --- Angular Momentum Operator
#stack(
	v(20pt), 
	$ hat(L)_k = (hat(bold(x)) times hat(bold(p)))_k = epsilon_(k i j) hat(x)_i hat(p)_j $,
	v(50pt), 

	align(center + horizon, 
		grid(
			columns: 2,
			gutter: 30pt,
			align(horizon, [
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



== QM --- Magnetic Momentum Operator
#grid(
	columns: 2,
	gutter: 10pt, 
	[
		#align(
			figure(
				image("assets/angular_magnetic_momentum.png", width: 65%),
				caption: figure.caption(position: top, "Angular and magnetic momentum generated by an electron orbiting circularly."),
			)
		)
	],
	align(horizon, [
	$ 
		bold(mu) = I Sigma hat(bold(n)) = (q v) / (2 pi r) pi r^2 hat(bold(n)) = q/(2m) bold(L) 
		#pause \
		=> quad hat(bold(mu)) = (planck q)/(2m) hat(bold(L))/planck 
	$
		
	#pause
	#v(20pt)
	For an electron, we can generally write
	$ hat(bold(mu)) = - g_l mu_B hat(bold(L))/planck $
	where $mu_B equiv (planck q_e)/(2 m_e)$ is the *Bohr magneton*  
	and $g_l$ is the *orbital g-factor* (here $g_l = 1$). 
	])
)



== Magnetic Interaction

#slide[
	#align(
		horizon,
		[The *interaction* between an atomic magnetic momentum with a magnetic field is $ H = - bold(mu) dot bold(B) $]
	)		
][
	#pause
	#align(center, [=== Uniform $bold(B)$])
	#align(
		horizon + center, 
		figure(
			image("assets/precession.png", width: 35%),
			caption: "Stern-Gerlach apparatus."
		)
	)
][
	#pause
	#align(center, [=== Non-Uniform $bold(B)$])
	#align(
		horizon + center, 
		figure(
			image("assets/force.png", width: 100%),
			caption: "."
		)
	)
]

= Stern-Gerlach Apparatus
== Apparatus
#slide[][
	#align(
		horizon, 
		figure(
			image("assets/apparatus.png", width: 100%),
			caption: "Stern-Gerlach apparatus."
		)
	)
]


== Experimental Outcome
#slide[
	#align(
		horizon + right, 
		figure(
			image("assets/outcome.png", width: 50%),
			caption: "Stern-Gerlach theoretical versus experimental results."
		)
	)	
][	
	#pause
	=== Why do we see deflected lumps?
	#v(10pt)
	$ 
		bold(F) = - nabla H = nabla(bold(mu) dot bold(B)) \
		=> F_z = mu_z (partial B_z)/(partial z)
	$
	#v(20pt)
	#pause
	=== Why do we see *two* deflected lumps?
	#v(10pt)
	
	#pause
	$hat(L)_z$ exibits an odd number of discrete eigenvalues ($2l + 1$). 
	
	#pause
	Even if we try with the GS of H ($l = 0$), we should see just one lump.

]


= Spin Operator
== Intrinsic Angular Momentum
Dihane lo Spin

== Spin-Orbit Coupling
Dihane lo Spin-Orbita

== Total Magnetic Momentum
$ bold(mu) = bold(mu)_l + bold(mu)_s = - mu_B/planck (g_l bold(L) + g_s bold(S)) $

== Spectra in Magnetic Field
=== Paschen-Back Limit $mu_B B >> $
=== Zeeman Limit $mu_B B << $
