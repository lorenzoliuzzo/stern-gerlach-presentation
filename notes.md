- In conclusion, the Stern-Gerlach experiment set out to test the 'old' quantum theory of orbital angular momentum. Instead, it failed in the most spectacular way possible, providing the first direct, experimental evidence for spin—a purely quantum-mechanical property of matter that is now the foundation for everything from magnetic resonance imaging (MRI) to our entire understanding of chemistry and particle physics.

# Angular & Magnetic momenta
- The reasoning starts with classical physics. Considering the simple case of an electron orbiting a nucleus, it has an orbital angular momentum, L, defined as the cross product of its position x and momentum p.

- Becasue an electron is a charged particle, its circular motion is essentially a tiny electrical current loop. And as we know from classical EM, a current loop generates a magnetic field, specifically a magnetic dipole moment, μ.

- This magnetic moment μ is directly proportional to the angular momentum L. The proportionality constant is q/(2m), the charge-to-mass ratio of the electron.
	
- So, if you have angular momentum, you have a magnetic moment. By measuring the magnetic moment, you are indirectly measuring the angular momentum. But how do we probe a magnetic moment? With an external magnetic field, B. The interaction energy of a dipole in a field is given by this Hamiltonian: H=−μ⋅B. The dipole will want to align with the field to minimize this energy, just like a compass needle.

In a uniform field, a magnetic dipole would just experience a torque. It would precess, but it wouldn't be pushed up or down. There would be no net force.


# Magnetic Interaction
So, why did the field have to be inhomogeneous?
In a non-uniform field, there is a net force which is the negative gradient of the interaction energy.

The magnets are designed so that the field and its gradient are strongest in one direction, which we'll call the z-direction. This simplifies the force equation to Fz​=μz​(∂Bz​/∂z)

The vertical force that deflects the atom is directly proportional to the z-component of its magnetic moment.

Since we know the atom's mass and we can measure the time it spends in the magnet from its velocity, we can use the simple equation of motion to relate the final deflection z(t) directly to a direct measurement of μ_z​, and therefore a direct measurement of L_z​, the z-component of the atom's angular momentum.

# Experimental Outcome
Classically, atoms coming from the oven would be randomly oriented. Their magnetic moments could point in any direction. This means μz​ should have a continuous range of values, from −μ to +μ. Therefore, they expected the beam to be smeared out into a single continuous on the detector, as shown on the left.

What they observed was shocking. The beam split cleanly into two distinct, separate spots. The atoms were deflected either 'up' or 'down' by a specific amount, and nothing in between. This result was a stunning confirmation of 'spatial quantization' of the angular momentum.

Why do we see two deflected lumps? 

# Quantum Mechanics
To understand this puzzle, we have to fast-forward a few years to the development of the full, formal mathematical framework of Quantum Mechanics

## QM States
- In this new framework, the state of a system is no longer described by position and momentum, but by an abstract vector, which we write using Dirac's notation as the 'ket' ∣ψ⟩. This vector lives in a complex vector space called a Hilbert space.
- Just like any 3D vector can be written as a sum of x, y, z components, a quantum state can be written in terms of a 'basis' — a set of complete, orthonormal vectors ∣ei​⟩.

- Any general state ∣ψ⟩ can be expressed as a 'superposition', that is a linear combination of these basis states. The coefficients, which represent the projection of the state on the elements of the basis, are called probability amplitudes.

- We define the inner product, using the 'bra-ket' notation, . This complex number represents the probability amplitude that a system prepared in state ∣ψ⟩ will be found in state ∣ϕ⟩ upon measurement

- If we take the inner product of a state with itself, this leads to the Born rule: the square of the amplitude, ∣ci​∣2, is interpreted as the probability of finding the system in the specific basis state ∣ei​⟩ if we make a measurement. So it must be normalized to 1.



## QM Operators
- Another important mathematical tool at the heart of QM are operators. 

- An operator is a linear application that transforms one state vector into another. 

- Its action can be fully described by a matrix O_ij​, which tells us how it transforms each basis vector. 

- We also define the adjoint operator, which is the conjugate transpose of the matrix O_ij. This acts on the bra, which can be thought as a row vector state.


## QM Operators & Observables
We associate every observable, like i.e. momentum or energy, with a specific type of operator.

In QM the process of measure of an observable is profound: 
possible results of a measurement of the system are associated with exclusive and exaustive states which constitutes an orthonormal basis, and the results of the measurement is the associated eigenvalue λi in which the system as collapsed to​, 
To make physical sense, λi must be real. 

Operators that satisfy this are called Hermitian, and they are defined by the condition of self-adjointment.


## QM Commutator
In order to complete the mathematical frameworks of operators, we define also the commutator of two operators, [A^,B^], which is A^B^−B^A^. This practically measures if the order of operations matters.

Two operators are compatible if and only if the commutator is zero, the operators are said to 'commute'.
This has a critical physical meaning: you can simultaneously know the values of two observables if and only if their operators commute. This is because they share the same set of eigenstates.

## Canonical commutator 
- In QM the most important example of incompatible observables is position x^ and momentum p^​. Their commutator is not zero; it's −iℏ. This is the mathematical origin of the Heisenberg Uncertainty Principle. You cannot measure both position and momentum to perfect accuracy at the same time.


## QM Angular momentum
Now, let's apply this formalism to angular momentum.
From the classical definition, we can write the component k of the angular momentum as ... where e_ijk is the levi-civita tensor, which is the total antisymmetric tensor. 

If we write down the L^ operators and compute their commutators, we find two key things.

The different components, like L^x​ and L^y​, do not commute, but generate the L_z operator. 
This also happens in classical mechanics, where for two consecutive rotation, the order of application is important.
In QM, this means that we can't know all three components of the angular momentum vector at the same time. 

However, the angular momentum squared, which is a scalar, does commute with any component of the angular momentum.
This means we can find simultaneous eigenstates for L^2 and one of its components, by convention we pick L_z​.
We label these states by their quantum numbers, ∣l, m⟩.

When we solve the eigenvalue problem, we find the spectrum of L^2 and L_z, which are quantized multiples of hbar^2 and hbar. 
In particular, for a given l, since m spans from -l to l, there are 2l+1 possible values for L_z which correspond to the same value L^2, 

## Experimental Outcome
Okay, let's go back to the experiment.

For an electron the magnetic moment operator is .
and we can rewrite it as  
where the constant μB​ is the Bohr magneton and we introduced the gl factor, which here is 1.

the Stern-Gerlach apparatus measures the magnetic moment mu_z, and so indirectly L_z:
This allows us to write the energy of the system as 
As we saw before, the number of possible states for L_z, and thus the number of spots on the screen, must be 2l+1, which is an odd number.
In particular, in the case of l=0 as in the original experiment, we get 2(0)+1=1 spot.

But the experiment showed TWO spots! Why two?
This means the angular momentum being measured, whatever it is, cannot be orbital angular momentum. The theory of quantum mechanics is correct, but our model of the atom is missing something.


## QM - Spin
This puzzle was solved in 1925 by George Uhlenbeck and Samuel Goudsmit. They proposed that the electron possesses an intrinsic angular momentum. It's not due to its orbit; it's just a fundamental property of the particle itself, like its charge or its mass.
They called this property spin

## QM - Intrinsic Angular Momentum
We postulate that it is an angular momentum, which means it must obey the exact same commutation rules as L.
Because it obeys the same rules, it must have the same structure: we can find simultaneous eigenstates of S^2 and S^z​, which we label ∣s,ms​⟩.
These states have eigenvalues ℏ2s(s+1) and ℏms​ while the state degeneracy is 2s+1.


## Experimental Outcome
And this... solves everything.

The total magnetic moment of the atom is the sum of its orbital and spin components. 
(For the silver atom, it turns out l=0, so only the spin mattered).

The number of spots we see on the screen is 2, so if we set the degeneracy to 2, a simple calculation gives s=1/2.
This is a very crucial difference with respect to the angular momentum, which only allowed integer values. Actually spin allows both integer and semi integer values m_s. 

For example the electron is a 'spin-1/2' particle. This means its ms​ quantum number can only have two possible values: ms​=+1/2 ('spin up') and ms​=−1/2 ('spin down'). This is why the beam splits into exactly two spots!

One final twist: to make the deflection magnitude match the experiment, the g-factor for spin had to be 2, not 1 like it was for orbital momentum. This 'anomalous' g-factor was another deep puzzle, which was later explained by Paul Dirac's relativistic quantum theory.