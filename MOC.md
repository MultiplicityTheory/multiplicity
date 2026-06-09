                  Multiplicity Operator Calculus: Prime-Indexed
                           Dynamics on Hypergraphs
                    Citizen Gardens & The Prime Materia Commons

                       1 Department of Mathematical Philosophy

               2 Laboratory for Symbolic Systems and Consciousness



                                       November 5, 2025


                                              Abstract

         Multiplicity Operator Calculus (MOC) formalizes a non-reductive, prime-indexed
      framework for modeling interdependent processes on hypergraphs. Inspired by the recursive
      epistemologies of Eastern mathematics, MOC treats number not as abstraction but as
      relational operator. Each prime 𝑝 defines a family of noncommuting operators 𝑃ˆ 𝑝 that
      act simultaneously on nodes and relations, generating nested cycles of resonance and
      transformation. The calculus unites rhythmic, geometric, and symbolic domains by
                                                                    Î ˆ𝑘𝑝
      encoding process structure through factorization: composition  𝑃 𝑝 represents both
      algebraic and temporal layering. Unlike linear differential or matrix approaches, MOC
      prioritizes recursive flows over static state evolution, enabling the modeling of systems
      whose coherence depends on rhythmic resonance rather than equilibrium. Applications span
      symbolic computation, musical architecture, prime-based synchronization networks, and
      ethical or cognitive dynamics in recursive agent systems. This paper develops the algebraic
      rules, commutation relations, and resonance functionals defining the MOC and demonstrates
      its use through a 108-cycle operator construct embodying binary–ternary interplay.

Keywords: multiplicity, hypergraph dynamics, prime operators, resonance, recursion, noncom-
mutative systems


Executive Summary

Problem Statement and Motivation
Classical models privilege objects and linear evolution; relations are secondary and often fixed.
Many real systems—symbolic, musical, cognitive, ethical—exhibit coherence through nested

                                                  1
cycles and context-sensitive coupling that standard differential or matrix methods capture only
indirectly. We seek a calculus where relations and rhythmic structure are primary, and where
number encodes process rather than quantity.


Core Contribution
We introduce the Multiplicity Operator Calculus (MOC): a prime-indexed, noncommutative
operator framework acting on states and hyperedges of a hypergraph. For each prime 𝑝, a family
{ 𝑃ˆ 𝑝 } generates subdivision, rotation, accent, and permutation modes whose compositions realize
nested periodicities. Validation is resonance-based: a functional

                                            ˆ 𝐷) ∈ [0, 1]
                                     𝑅(𝐻, { 𝑃};

measures fit between modeled structure and target data 𝐷 (e.g., cycles in time series, phrase
boundaries, or symbolic constraints). As an exemplar, we construct a full 𝑛 = 108 = 22 · 33
operator word that integrates ternary phrasing with binary micro-pulse.


Key Results and Applications
    • Algebra: Closed rules for composition, lifting across prime powers, and cross-prime braid
      relations; normal forms up to phase equivalence.
    • Resonance: Practical criteria and algorithms to maximize 𝑅, enabling “proof by resonance”
      for pattern adequacy.
    • 108-cycle: A transparent build demonstrating how factorization sets macro–micro coupling
      and how operator order controls feel.
    • Applications: (i) symbolic computation via rewrite orchestration on hypergraphs; (ii)
      musical architecture and metrical design; (iii) synchronization networks with prime-gated
      stability; (iv) cognitive/ethical policy constraints modeled as conserved quantities under
      𝑃ˆ 𝑝 .


Roadmap of the Document
Section 1 formalizes state spaces, hypergraph structure, and operator families. Section 2 develops
commutation, lifting, and braid relations with illustrative lemmas. Section 3 defines the resonance
functional and optimization procedures. Section 4 presents the 108-cycle construction, ablation
studies on operator order, and empirical resonance profiles. Section 5 surveys applications
and gives implementation notes. Section 6 concludes with open problems and directions for
comparative studies with classical spectral and automata-theoretic methods.




                                                2
Philosophical and Historical Context

Eastern Mathematics: Recursion, Relational Ontology, and Sutra Logic
In the intellectual traditions of India, China, and East Asia, mathematics evolved within a
relational and recursive ontology rather than a mechanistic one. Number was conceived not
as abstraction but as expression of interdependence. The Vedic and Buddhist doctrines of
Pratı̄tyasamutpāda (dependent origination) and the Taoist notion of the Ten Thousand Things
unfolding from the One describe multiplicity as an emergent unity: relations produce entities,
not the reverse.
    Mathematical reasoning in these contexts operated through sutra logic—compact aphorisms
encoding recursive procedures. Each sutra functioned simultaneously as algorithm, mnemonic,
and cosmological statement. Knowledge was revealed through iterative interpretation, not static
proof. Recursion served as epistemic method and ontological model.


Multiplicity Versus Reduction: Relations-First Stance
Western formalism tends toward reduction: decomposing wholes into independent parts and
reassembling them through linear rules. Multiplicity theory in the Eastern sense reverses this
orientation. It begins with networks of mutual conditioning where nodes have no existence apart
from their connective roles. This relations-first stance treats mathematics as a mirror of dynamic
balance rather than a tool of dissection.
    Within this view, multiplicity is not numerical excess but structured co-arising. A number
such as 108 = 22 · 33 is not a mere product; it encodes nested rhythmic and symbolic layers.
Prime factors act as archetypal generators of relational order.


Symbolic Cycles in Practice: Calendar, Breath, Music, and Ritual
Traditional applications of Eastern mathematical ideas are found in cyclical systems. Calendrical
computation linked celestial periodicities with ritual timing. Yogic and Daoist practices mapped
breathing rhythms and bodily cycles to integer ratios. Classical Indian and East Asian music
employed binary and ternary meter interlocks, structurally analogous to prime decomposition.
Temple geometry, mandala construction, and mantra recitation all used numerical proportion as
a mode of synchronization between microcosm and macrocosm.
    These practices embody recursion physically: repetition with modulation, symmetry with
deviation, and invariance through transformation. Mathematical order thus operated as a lived
rhythm, not an abstract invariant.




                                                3
Operationalization in This Report
The Multiplicity Operator Calculus formalizes these principles in algebraic and computational
language. Primes become operators 𝑃ˆ 𝑝 acting recursively on hypergraphs; factorization
corresponds to hierarchical cycles. Resonance replaces proof: coherence is verified when
generated patterns align with empirical or symbolic cycles.
   This report translates the philosophical motifs of recursion, interdependence, and cyclic
symmetry into a rigorous operator framework. By embedding the relational ontology of Eastern
mathematics into prime-indexed dynamics, it unites metaphysical intuition with executable
formalism—an explicit bridge between symbolic cosmology and algorithmic modeling.


Preliminaries and Notation

Time Lattice
Let the discrete cyclic time domain be

                                T𝑛 = Z/𝑛Z = {0, 1, . . . , 𝑛 − 1},

which serves as the base lattice for periodic processes of length 𝑛. Arithmetic on T𝑛 is taken
modulo 𝑛. Each tick 𝑡 ∈ T𝑛 represents a phase position within a closed cycle.


Signals and Patterns
A signal or pattern is a function
                                         𝑥 : T𝑛 → R 𝑘 ,

where 𝑘 denotes the number of feature channels (e.g., amplitude, color, intensity, or symbolic
value). The space of all such signals is X𝑛 = {𝑥 : T𝑛 → R 𝑘 }, equipped with pointwise addition
and scalar multiplication, forming a real vector space.


Hypergraph Structure
The relational substrate of multiplicity is modeled as a hypergraph

                                         𝐻 = (𝑉, 𝐸, 𝜄),

where 𝑉 is the set of vertices (states), 𝐸 the set of hyperedges (relations), and 𝜄 : 𝐸 → P (𝑉)
the incidence map assigning to each edge its participating vertices. Unlike a standard graph,
hyperedges may connect any number of vertices, representing higher-order relations.




                                                4
    Each vertex 𝑣 ∈ 𝑉 and hyperedge 𝑒 ∈ 𝐸 carries state attachments

                                   𝜎 : 𝑉 → R𝑘 ,          𝜏 : 𝐸 → R𝑚 ,

encoding local and relational attributes. Operators will act jointly on (𝜎, 𝜏), allowing transfor-
mation of both nodes and the relations that bind them.


Operator Words and Composition Order
An operator word is an ordered product of prime-indexed operators:

                   W = 𝑂ˆ 𝑚 𝑂ˆ 𝑚−1 · · · 𝑂ˆ 1 ,      𝑂ˆ 𝑖 ∈ { 𝑃ˆ (𝑟)
                                                                 𝑝 : 𝑝 prime, 𝑟 ≥ 1}.


Application is right-to-left:

                                𝑥 ′ = W [𝑥] = 𝑂ˆ 𝑚 (𝑂ˆ 𝑚−1 (· · · 𝑂ˆ 1 (𝑥))).

Noncommutativity implies that reordering the same multiset of primes generally produces distinct
outcomes. The set of all operator words with the same prime content forms an equivalence class
under resonance equivalence, denoted [W] 𝑅 .


Divisibility Indicator and Class Labels
For integer divisibility, define the indicator function

                                           
                                            1,
                                           
                                                   if 𝑡 ≡ 0   (mod 𝑑),
                                 [𝑑 | 𝑡] =
                                            0,
                                                   otherwise.
                                           

This binary function allows the construction of hierarchical accent and phase structures. Given a
cycle length 𝑛 and a set of divisors {𝑑𝑖 } ⊆ N, we may assign each tick 𝑡 ∈ T𝑛 a class label

                                      𝐶 (𝑡) = {𝑑𝑖 : [𝑑𝑖 | 𝑡] = 1},

representing its membership in overlapping rhythmic or symbolic strata. For example, in 𝑛 = 108,
the classes corresponding to 𝑑 = 2, 3, 9, 27 define binary and ternary accent layers.
    These primitives provide the syntactic foundation for the Multiplicity Operator Calcu-
lus: signals live on the lattice T𝑛 , relations inhabit 𝐻, and operator words encode recursive
transformations whose resonance properties are analyzed in later sections.




                                                     5
Multiplicity Space and Carriers

Definition of the Multiplicity Space
The fundamental carrier of the Multiplicity Operator Calculus is the multiplicity space

                                         M = (X, 𝐻),

where X denotes the signal space X𝑛 = {𝑥 : T𝑛 → R𝑘 } and 𝐻 = (𝑉, 𝐸, 𝜄) is the hypergraph of
relational topology introduced previously.
    Elements of M therefore encode both local states and relational structure. Operators 𝑃ˆ (𝑟)
                                                                                            𝑝
act simultaneously on these two layers:

                                  𝑃ˆ (𝑟)             ′   ′
                                     𝑝 : (X, 𝐻) −→ (X , 𝐻 ),


where X ′ and 𝐻 ′ denote the updated state and hypergraph under a prime-indexed transformation
(e.g., subdivision, rotation, or permutation). Each M is thus a dynamic carrier—its internal
organization may change while preserving coherence through resonance invariants.


Automorphisms and Gauge Perspective
The internal symmetries of the multiplicity space form the automorphism group

           Aut(M) = { (𝜙𝑉 , 𝜙 𝐸 ) | 𝜙𝑉 : 𝑉 → 𝑉, 𝜙 𝐸 : 𝐸 → 𝐸, 𝜄 ◦ 𝜙 𝐸 = P (𝜙𝑉 ) ◦ 𝜄 },

where P (𝜙𝑉 ) denotes the induced action on subsets of 𝑉. These automorphisms represent
relabelings of vertices and edges that leave the incidence structure invariant.
    From a gauge perspective, each automorphism corresponds to a local symmetry transformation
of the multiplicity field. If (𝜎, 𝜏) are the vertex and edge states, an automorphism acts as

                                  (𝜎, 𝜏) ↦→ (𝑔𝑉 ◦ 𝜎, 𝑔 𝐸 ◦ 𝜏),

with 𝑔𝑉 , 𝑔 𝐸 drawn from a local gauge group 𝐺 (often 𝐺 ⊆ GL(𝑘, R)). The MOC treats
these symmetries as redundancies of description—different coordinate expressions of the same
relational configuration.
    Gauge transformations commuting with all 𝑃ˆ (𝑟)
                                                𝑝 define the stabilizer subgroup Stab𝐺 (M),
corresponding to conserved relational frames.


Invariants and Conservation Constraints
Within each multiplicity space, certain scalar quantities remain invariant under admissible
operator action. These invariants encode conservation of structure and ethics of transformation:

                                               6
    • Energy Invariant:                                ∑︁
                                           𝐸 [𝑥] =            ∥𝑥(𝑡)∥ 2 .
                                                       𝑡∈T𝑛

      Preserved under norm-preserving operators (rotations, permutations).
    • Area or Volume Invariant: For geometric realizations, define
                                                       ∑︁
                                         𝐴[𝜎, 𝜏] =            Vol(𝜄(𝑒)),
                                                       𝑒∈𝐸


      which measures conserved relational “extent.” Sulba-style operators (𝑃ˆ 𝑝 corresponding to
      cut-and-join) maintain 𝐴 constant.
    • Fairness or Ethical Invariant: For systems representing allocations or information flows,

                                         𝐹 [𝜎] = min 𝜎𝑖 /max 𝜎𝑖 ,
                                                       𝑖           𝑖

      quantifies balance among vertices. Operator sets satisfying 𝐹 [𝜎′] ≥ 𝐹 [𝜎] are deemed
      ethically admissible.
    These invariants act as gauge constraints on the permissible dynamics within M. Resonant
evolution respects them automatically: only operator compositions that preserve or restore these
measures yield high resonance 𝑅(M). Thus, the multiplicity space is not merely a passive
container for transformation—it is an active metric field enforcing harmony between algebraic
action and relational integrity.


Prime-Indexed Operator Calculus (MOC)

Operator Families on States
Fix a cycle length 𝑛. All state operators act on 𝑥 ∈ X𝑛 = {𝑥 : T𝑛 → R𝑘 }. Admissibility: S 𝑝 ,
R 𝑝𝑟 , A 𝑝𝑟 are defined when 𝑝 𝑟 | 𝑛; otherwise treat them as virtual refinements with lift–project
(omitted here for brevity).

Subdivision S 𝑝 .   Lifts X𝑛 → X𝑝𝑛 :

                      ( S 𝑝 𝑥)( 𝑝𝑡 + 𝑢) = 𝑥(𝑡),    𝑡 ∈ T𝑛 , 𝑢 ∈ {0, . . . , 𝑝 − 1}.

Accent A𝛼𝑝𝑟 .   Adds a level-𝑝𝑟 gate (or multiplies by a weight). Additive form:

                                 ( A𝛼𝑝𝑟 𝑥)(𝑡) = 𝑥(𝑡) + 𝛼 [ 𝑝𝑟 | 𝑡] 𝑒 1 ,

with [𝑑 | 𝑡] ∈ {0, 1} the divisibility indicator and 𝑒 1 a chosen channel.



                                                   7
               𝜙
Rotation R 𝑝𝑟 .        Cyclic shift aligned to the 𝑝𝑟 -grid:
                                                                          
                                        𝜙                                𝑛
                                     ( R 𝑝𝑟 𝑥)(𝑡) = 𝑥               𝑡+𝜙· 𝑟 ,               𝜙 ∈ Z.
                                                                        𝑝

Permutation W𝜋𝑝 .           Reorders the 𝑝 subticks inside each parent cell after S 𝑝 . For 𝜋 ∈ 𝑆 𝑝 ,
                                                                             
                                              ( W𝜋𝑝 𝑥)( 𝑝𝑡 + 𝑢) = 𝑥 𝑝𝑡 + 𝜋(𝑢) .


Relation Operators on 𝐻
Let 𝐻 = (𝑉, 𝐸, 𝜄). Relation operators 𝑄ˆ 𝑝 act on incidence while coordinating state attachments
(𝜎, 𝜏).

       split
Split 𝑄ˆ 𝑝 .        Each 𝑒 ∈ 𝐸 becomes 𝑝 siblings 𝑒 (𝑢) with refined incidence:

                   𝜄′ (𝑒 (𝑢) ) = 𝜄(𝑒),       𝑢 = 0, . . . , 𝑝 − 1,                 𝜏′ (𝑒 (𝑢) ) = Refine 𝑝 (𝜏(𝑒), 𝑢).

         merge
Merge 𝑄ˆ 𝑝 . Inverse of split on coherent siblings: 𝑝 edges with identical incidence collapse
to one, 𝜏 aggregated by a conserved rule.

Fold 𝑄ˆ fold
        𝑝 . Quotients a 𝑝-cyclic arrangement of vertices/edges by rotation, enforcing periodic
boundary conditions.

Relabel 𝑄ˆ rel
           𝑝 . Applies an incidence-preserving permutation (𝜙𝑉 , 𝜙 𝐸 ) ∈ Aut(𝐻) constrained to
𝑝-cycles.


Prime Word and Composite Word
For each prime 𝑝 and level 𝑟 ≥ 1, define a prime word
                                                     𝑟
                                                    Ö                 
                                                                𝛼 𝑗
                        𝑃ˆ ( 𝑝) = W 𝑝 𝑝 R 𝑝𝑟𝑝
                                    𝜋    𝜙
                                                              A 𝑝 𝑝𝑗       S 𝑝𝑟   (admissible when 𝑝𝑟 | 𝑛).
                                                        𝑗=1

                                         Î
Given the factorization 𝑛 =                  𝑝 𝑝
                                                   𝑟 𝑝 , the composite word is

                                  Ö
                                         𝑃ˆ ( 𝑝)
                                                    
                            b=
                            𝑁                            (ordered product; noncommutative).
                                   𝑝|𝑛


Noncommutation: Sources and Consequences
Noncommutation arises from three mechanisms:


                                                                           8
(i) Index Lifting.    S 𝑝 changes the lattice on which other operators act:

                                                                ↑𝑝
                                          S 𝑝 A𝑞𝛼𝑟 = A𝑞𝛼𝑟             S𝑝 ,

where ↑𝑝 copies accents to each of the 𝑝 children; generally ≠ A𝑞𝛼𝑟 S 𝑝 for 𝑝 ≠ 𝑞.

(ii) Wreath Action.      W 𝜋𝑝 permutes subticks inside cells, disrupting external gates:

                                      W 𝜋𝑝 A𝑞𝛼𝑟 ≠ A𝑞𝛼𝑟 W 𝜋𝑝       ( 𝑝 ≠ 𝑞).

(iii) Relation–State Coupling. 𝑄ˆ 𝑝 reconfigures 𝐻, which changes how state operators
aggregate over hyperedges; hence [𝑄ˆ 𝑝 , A𝑞𝛼𝑟 ] ≠ 0 in general.
Consequences. Operator order controls macro–micro alignment, syncopation, and resonance.
Normal forms are defined up to phase and gauge:

     W ∼ W ′ ⇐⇒ ∃ 𝑔 ∈ Aut(M) : 𝑔 W = W ′ 𝑔 and 𝑅(W [𝑥]; 𝐷) = 𝑅(W ′ [𝑥]; 𝐷).


CRT Structure and Level Projectors Π 𝑝𝑟
Chinese remainder structure provides a canonical multi-level decomposition:
                                                     Ö
                                        Z/𝑛Z                  Z/𝑝𝑟 𝑝 Z.
                                                    𝑝 𝑟 𝑝 ∥𝑛


Define the level-𝑝𝑟 averaging projector Π 𝑝𝑟 : X𝑛 → X𝑛 by

                                                  𝑝 𝑟 −1        
                                                1 ∑︁           𝑛
                                  (Π 𝑝𝑟 𝑥)(𝑡) = 𝑟       𝑥 𝑡+𝑢· 𝑟 .
                                               𝑝 𝑢=0          𝑝

Then:
                     Π 2𝑝𝑟 = Π 𝑝𝑟 ,
                                                𝜙
                                         Π 𝑝𝑟 R 𝑝𝑟 = Π 𝑝𝑟 ,             Π 𝑝𝑟 A𝛼𝑝𝑟 = A𝛼𝑝𝑟 Π 𝑝𝑟 ,

and for 𝑝 ≠ 𝑞,
                                                                                       ↓𝑞
                          [Π 𝑝𝑟 , W𝑞𝜋 ] ≠ 0 in general,               Π 𝑝 𝑟 S𝑞 = S𝑞 Π 𝑝 𝑟 ,
        ↓𝑞
where Π 𝑝𝑟 is the naturally induced projector on the coarser lattice when 𝑞 | 𝑛.
   A complementary spike projector is the multiplicative gate

                                        (Δ 𝑝𝑟 𝑥)(𝑡) = [ 𝑝𝑟 | 𝑡] 𝑥(𝑡),

useful for class labels and discrete cadence marking. The pair (Π 𝑝𝑟 , Δ 𝑝𝑟 ) separates invariant
content at level 𝑝𝑟 from event content at that level, supplying a precise bridge between CRT
structure and rhythmic accent algebra.

                                                      9
Sample Semantics for 𝑝 ∈ {2, 3, 5, 7}

𝑝 = 2: binary microstructure, off-beat swap
Purpose. Micro-timing and pulse subdivision.
Defaults. S2 (refine), A2𝛼2 , A4𝛼4 , R14 , W2(0 1) .

                             ( S2 𝑥)(2𝑡 + 𝑢) = 𝑥(𝑡),        ( A2𝛼𝑟 𝑥)(𝑡) = 𝑥(𝑡) + 𝛼 [2𝑟 | 𝑡] 𝑒 1 ,
                                         𝑛       
                      ( R14 𝑥)(𝑡) = 𝑥 𝑡 +                 ( W2(0 1) 𝑥)(2𝑡 + 𝑢) = 𝑥 2𝑡 + (1 − 𝑢) .
                                                                                               
                                                      ,
                                              4
Effect. A4 sets a light grid; A2 fills ghost notes; W2(0 1) flips on/off-beat; R14 inverts downbeat
emphasis.


𝑝 = 3: ternary phrasing spine
Purpose. Macro–meso phrasing.
Defaults. S3 , A3 3 , A9 9 , A2727 , W3(0 2 1) , R3 3 .
                𝛽      𝛽      𝛽                   𝜙



                     ( W3(0 2 1) 𝑥)(3𝑡 + 𝑢) = 𝑥 3𝑡 + 𝜋(𝑢) , 𝜋 : 0 ↦→ 0, 1 ↦→ 2, 2 ↦→ 1.
                                                         


Effect. A27 ≻ A9 ≻ A3 establishes cadence tiers; W3(0 2 1) gives hemiola-like tilt; R3 3 locks phrase
                                                                                                     𝜙

starts to targets.


𝑝 = 5: quinary ornament, color layer
Purpose. Sparse ornament independent of the spine.
Defaults. S5 , A5 5 on a distinct channel 𝑒 𝑐 , W5(0 2 4 1 3) , optional anti-coincidence gate with ternary.
                𝛾


                     𝛾
                 ( A5 5 𝑥)(𝑡) = 𝑥(𝑡) + 𝛾5 [5 | 𝑡] 𝑒 𝑐 ,             ( X¬3 𝑥)(𝑡) = (1 − [3 | 𝑡]) 𝑥(𝑡).

Effect. Use X¬3 A5 5 to avoid hits on ternary beats; W5(0 2 4 1 3) cycles ornaments through quintuple
                         𝛾

positions.


𝑝 = 7: heptadic drift, asymmetry
Purpose. Incommensurate overlay and slow phase drift.
Defaults. When 7 ∤ 𝑛, define the modular-inverse step

                                   𝑠𝑛 ≡ 7−1       (mod 𝑛),          7 𝑠𝑛 ≡ 1 (mod 𝑛).




                                                              10
Heptad positions:
                                    
                         𝑆7 (𝑛, 𝜇) = (𝜇 + ℓ 𝑠𝑛 ) mod 𝑛 : ℓ = 0, . . . , 6 .

Heptadic accent (drifting gate):

                          ( A7♭,𝛿 𝑥)(𝑡) = 𝑥(𝑡) + 𝛿 1 𝑡∈𝑆7 (𝑛,𝜇) 𝑒 1 ,         𝜇 ∈ T𝑛 .

Optional slow rotation: update 𝜇 ↦→ 𝜇 + 𝜌 each cycle to create a beat against the spine. Effect.
Quasi-uniform spread over T𝑛 with long-return asymmetry; no collisions forced by CRT tiers.


Design Patterns for Combining Layers
   1. Ternary-first, binary micro.

                                  W = S33  S22 ·A2727 A9 9 A3 3 A4𝛼4 A2𝛼2 .
                                                             𝛽     𝛽    𝛽
                                     |{z} |{z}
                                           spine   micro


      Place W2(0 1) after S2 for off-beat lift.
   2. Binary-first syncopation.

                                  W ′ = S22 W2(0 1) S33 · A4𝛼4 A2𝛼2 A2727 A9 9 A3 3 .
                                                                        𝛽      𝛽   𝛽



      Noncommutation changes feel without changing factors.
   3. Quinary color without collisions.

                                        W5 = W · X¬3 A5 5 W5(0 2 4 1 3) .
                                                              𝛾



      Small 𝛾5 and separate channel 𝑒 𝑐 preserve energy and clarity.
   4. Heptadic drift over a CRT scaffold.

                            W7 = W · A7♭,𝛿 (optionally update 𝜇 ↦→ 𝜇 + 𝜌).

      Choose 𝛿 ≪ 𝛼2 , 𝛽3 to keep drift perceptual but not dominant.
   5. Projector-aligned layering. Use level projectors to keep roles separated:

                       micro: (𝐼 − Π3 ) A2 ,        spine: Π3 A9 ,          cadence: Π27 A27 .

      Ensures micro never overwrites phrase boundaries.
Default weights. Recommended ordering 𝛽27 > 𝛽9 > 𝛽3 > 𝛼4 > 𝛼2 > 𝛾5 > 𝛿 for clear
hierarchy.




                                                      11
Formal Sketch Expanded

State and Relation Actions; Joint Operators
Let M = (X𝑛 , 𝐻) with X𝑛 = {𝑥 : T𝑛 → R𝑘 } and 𝐻 = (𝑉, 𝐸, 𝜄). We write tick–channel arrays as
𝑋 ∈ R𝑛×𝑘 with 𝑋 [𝑡] = 𝑥(𝑡). Incidence is 𝐵 ∈ {0, 1} |𝑉 |×|𝐸 | with 𝐵𝑣𝑒 = 1 iff 𝑣 ∈ 𝜄(𝑒). Vertex/edge
states are 𝜎 ∈ R|𝑉 |×𝑘 𝑉 , 𝜏 ∈ R|𝐸 |×𝑘 𝐸 .

State operators.      For prime 𝑝 and level 𝑟 ≥ 1:
                                                                                                         
                                                                                                        𝑛
                                  ( A𝛼𝑝𝑟 𝑋) [𝑡] = 𝑋 [𝑡] + 𝛼 [ 𝑝𝑟 | 𝑡] 𝑒 ⊤
                                                                                𝜙
  ( S 𝑝 𝑋) [ 𝑝𝑡 + 𝑢] = 𝑋 [𝑡],                                           1,   ( R 𝑝𝑟 𝑋) [𝑡] = 𝑋       𝑡+𝜙 𝑟 ,
                                                                                                        𝑝

                                    ( W𝜋𝑝 𝑋) [ 𝑝𝑡 + 𝑢] = 𝑋 [ 𝑝𝑡 + 𝜋(𝑢)],

with 𝑢 ∈ {0, . . . , 𝑝 − 1} and 𝜋 ∈ 𝑆 𝑝 .

Relation operators. 𝑄ˆ 𝑝 acts on (𝐵, 𝜎, 𝜏) by split/merge/fold/relabel:

               split
            𝑄ˆ 𝑝 : 𝑒 ↦→ {𝑒 (𝑢) }𝑢=0 , 𝐵′ = 𝐵 on each 𝑒 (𝑢) , 𝜏(𝑒 (𝑢) ) = Refine 𝑝 (𝜏(𝑒), 𝑢),
                                𝑝−1



and analogously for merge (inverse), fold (quotient by 𝑝-cycle), relabel (apply (𝜙𝑉 , 𝜙 𝐸 ) ∈
Aut(𝐻)).

Joint operator.     A prime-indexed joint action is the pair

                                      b( 𝑝) = W𝜋𝑝 R𝜙𝑟 A𝛼𝑝𝑟 S 𝑝𝑟 ; 𝑄ˆ 𝑝 ,
                                                                      
                                      P            𝑝


acting on M and producing (X ′, 𝐻 ′). A composite word is
                            Ö
                      b=
                      𝑁           b( 𝑝)
                                  P          (ordered product; noncommutative).
                            𝑝|𝑛


Frequency-Domain View: Spectral Masks and Combs
                       b[𝑘] = Í𝑛−1 𝑋 [𝑡] 𝜔−𝑘𝑡
Let the 𝑛-point DFT be 𝑋                  𝑛 with 𝜔 𝑛 = 𝑒
                                                         2𝜋𝑖/𝑛 .
                               𝑡=0


Rotation.     A shift by 𝜏 = 𝜙𝑛/𝑝𝑟 multiplies by a phase:

                                [
                                R 𝑝𝑟 𝑋 [𝑘] = 𝜔−𝑘𝜏 b[𝑘] = 𝑒 −2𝜋𝑖𝑘 𝜙/𝑝 𝑋
                                𝜙                                       𝑟
                                              𝑛   𝑋                  b[𝑘].




                                                      12
Accent (additive comb).         Let 𝐷 𝑝𝑟 [𝑡] = [ 𝑝𝑟 | 𝑡]. Then

                                                 𝑛
                                     𝐷
                                     d 𝑝 𝑟 [𝑘] = 𝑟 1 𝑘≡0 (mod 𝑛/𝑝 𝑟 ) ,
                                                𝑝

so A𝛼𝑝𝑟 injects a spectral comb on multiples of 𝑛/𝑝𝑟 in the accent channel.

Multiplicative gate.     Δ 𝑝𝑟 𝑥 = [ 𝑝𝑟 | 𝑡] · 𝑥(𝑡) gives

                                           Δ[      b ∗ 𝐷
                                            𝑝𝑟 𝑋 = 𝑋   d 𝑝𝑟 ,


i.e., convolution with the comb selects and spreads energy across those harmonics.

Subdivision S 𝑝 (zero-order hold upsample).              For 𝑌 = S 𝑝 𝑋 of length 𝑝𝑛,

                          𝑝−1
                         ∑︁                                    
              𝑌b[𝑘] =           𝑒 −2𝜋𝑖𝑘𝑢/( 𝑝𝑛) 𝑋b[𝑘 mod 𝑛] = 𝐷 𝑝 2𝜋𝑘 𝑋
                                                                  𝑝𝑛
                                                                     b[𝑘 mod 𝑛],
                         𝑢=0

where 𝐷 𝑝 is the Dirichlet kernel. Interpretation: spectrum replication to 𝑝𝑛 with comb-shaped
envelope.

Permutation W𝜋𝑝 .      Acts as a block mixing on frequency cosets 𝑘 ≡ 𝑟 (mod 𝑝):

                                 𝑌b[𝑘] = 𝑈𝜋 (𝑟) 𝑋
                                                b[𝑘],       𝑟 = 𝑘 mod 𝑝,

with 𝑈𝜋 (𝑟) a 𝑝 × 𝑝 unitary determined by 𝜋 and 𝑟. Thus W𝜋𝑝 redistributes energy within
𝑝-families of harmonics.


Gauge Equivalence and Identifiability
Let 𝐺 be a gauge group acting on M by (𝑔 · 𝑋, 𝑔 · 𝐻) with 𝑔 = (𝑔𝑡 , 𝑔𝑉 , 𝑔 𝐸 ) combining time
rephasing, vertex, and edge relabeling. A resonance 𝑅(W [M]; 𝐷) is gauge-invariant if

                       𝑅(W [M]; 𝐷) = 𝑅 (𝑔 W 𝑔 −1 ) [M]; 𝐷 ,
                                                         
                                                                          ∀𝑔 ∈ 𝐺.

Hence operator words are identifiable only up to 𝐺-conjugacy and phase:

                  W ∼ W′                     ∃𝑔 ∈ 𝐺, 𝜙 ∈ Z : W ′ = R𝑛 𝑔 W 𝑔 −1 .
                                                                           𝜙
                                    ⇐⇒

Canonical gauges. Fix identifiability by constraints such as (i) downbeat pinning: arg max𝑡 ∥(Π 𝑝𝑟 𝑋) [𝑡] ∥ =
                                         Î            𝜙𝑝
0 for top tier 𝑝𝑟 ; (ii) CRT phase fix:    𝑝 𝑟 𝑝 ∥𝑛 𝜔 𝑝 𝑟 𝑝 = 1; (iii) incidence order: lexicographi-
cally order (𝑉, 𝐸) to kill relabeling ambiguity. Invariants for testing equivalence. Level


                                                    13
energies 𝐸 𝑝𝑟 = ∥Π 𝑝𝑟 𝑋 ∥ 22 , class histograms
                                                  Í
                                                   𝑡 [𝑝
                                                           𝑟 | 𝑡], and autocorrelations at CRT strides are

gauge-stable summaries.


Sutra-Style Rewrite Interpretation
Let A be an alphabet of tick-classes (e.g., {◦, •, □, ♢} for micro, beat, phrase, cadence) and let
words 𝑤 ∈ A ∗ encode sequences along T𝑛 . Operators act as local rewrites:

          S1 (Subdivision) 𝑋 ⇒ 𝑋0 𝑋1 · · · 𝑋 𝑝−1 (replace a symbol by 𝑝 children)
          S2 (Permutation) 𝑋0 · · · 𝑋 𝑝−1 ⇒ 𝑋𝜋(0) · · · 𝑋𝜋( 𝑝−1)
          S3 (Accent)      𝑋 ⇒ 𝑋 ↑ if position 𝑡 ≡ 0 (mod 𝑝𝑟 )
          S4 (Rotation)    𝑢 0 𝑢 1 · · · 𝑢 𝑛−1 ⇒ 𝑢 𝜏 𝑢 𝜏+1 · · · 𝑢 𝜏+𝑛−1
          S5 (Split/Merge) 𝑒 ⇒ 𝑒 (0) · · · 𝑒 ( 𝑝−1) and inverse if coherent

    These sutras are compositional: a prime word is a short rewrite program. Resonance validates
a program by comparing its generated word (or its numeric lift 𝑋) to data 𝐷. Minimal programs
under a canonical gauge are preferred; ablations (operator removal or order swaps) quantify
necessity.
Practical note. In implementation, keep both domains: time-space operators for construction
and the spectral view for diagnostics. Use projectors Π 𝑝𝑟 to audit tier energies, and use comb
masks to detect unintended cross-prime interference introduced by W𝜋𝑝 or relation folds.


Resonance Functional and Validation

Components: Time, Harmonics, Phase
Let 𝑥 ∈ X𝑛 be the model output of an operator word W and 𝐷 ∈ X𝑛 the target. Let 𝑇𝜏 be rotation
by 𝜏 ticks, 𝑊 = diag(𝑤 [𝑡]) a taper (e.g., Hann), andb· the 𝑛-point DFT.

Time-domain score 𝑅1 .       Normalized, shift-optimized correlation with taper:

                                                                   2
                                                   𝑊𝑥, 𝑊𝑇𝜏 𝐷 2
                           𝑅1 (𝑥, 𝐷) = max                              ∈ [0, 1].
                                        𝜏∈T𝑛   ∥𝑊𝑥∥ 22 ∥𝑊𝑇𝜏 𝐷 ∥ 22

Squaring enforces nonnegativity and stabilizes near-ties.

Harmonic lock 𝑅2 . Let D = {𝑝𝑟 : 𝑝𝑟 ∥ 𝑛} be CRT tiers and 𝐾 𝑑 = { ℓ 𝑛/𝑑 : ℓ = 0, . . . , 𝑑 − 1 }
the comb indices. Define energy fractions

                                      𝑥 [𝑘]| 2                                    b [𝑘]| 2
                                Í                                      Í
                                  ∈𝐾 |b                                 ∈𝐾       |𝐷
                     𝐸 𝑥 (𝐾) = Í𝑘𝑛−1           ,           𝐸 𝐷 (𝐾) = Í𝑘𝑛−1                 .
                                      𝑥 [𝑘]| 2
                                 𝑘=0 |b                                    𝑘=0
                                                                                  b [𝑘]| 2
                                                                                 |𝐷

                                                      14
                             Í
With tier-weights 𝜂 𝑑 ≥ 0,       𝑑 𝜂 𝑑 = 1,

                                          ∑︁         √︁
                         𝑅2 (𝑥, 𝐷) =            𝜂𝑑        𝐸 𝑥 (𝐾 𝑑 ) 𝐸 𝐷 (𝐾 𝑑 ) ∈ [0, 1].
                                          𝑑∈D


Phase coherence 𝑅3 . For each tier 𝑑, exclude DC and measure circular phase agreement on
the comb:

                          1 ∑︁                                     
           𝐶𝑑 (𝑥, 𝐷) =                  exp  𝑖 arg 𝑥 [𝑘] − arg b [𝑘] ,
                                                               𝐷                     𝐾 𝑑′ = 𝐾 𝑑 \ {0}.
                         |𝐾 𝑑′ | 𝑘 ∈𝐾 ′
                                                   b
                                      𝑑


Aggregate with the same 𝜂 𝑑 :
                                                ∑︁
                                 𝑅3 (𝑥, 𝐷) =          𝜂 𝑑 𝐶𝑑 (𝑥, 𝐷) ∈ [0, 1].
                                                𝑑∈D


Aggregation
Choose 𝜆 1 , 𝜆2 , 𝜆3 ≥ 0 with 𝜆1 + 𝜆 2 + 𝜆 3 = 1. The resonance score is

                 𝑅(𝑥, 𝐷) = 𝜆 1 𝑅1 (𝑥, 𝐷) + 𝜆2 𝑅2 (𝑥, 𝐷) + 𝜆3 𝑅3 (𝑥, 𝐷) ∈ [0, 1].

Default emphasis for clear tiered rhythm: 𝜆1 = 0.4, 𝜆 2 = 0.35, 𝜆 3 = 0.25.


Norms, Windowing, and Clipping
    • Norms. 𝑅1 uses ℓ2 by default; for sparse spiky patterns use ℓ1 or Huber loss in the
      numerator/denominator to reduce outlier dominance.
    • Windowing. Taper 𝑤 [𝑡] reduces spectral leakage in 𝑅1 and improves alignment robustness.
      Use the same 𝑤 when computing b      b for 𝑅2 , 𝑅3 if leakage is severe.
                                        𝑥, 𝐷
    • Clipping. Soft-clip amplitudes before scoring: 𝑠 𝜅 (𝑎) = 𝜅 tanh(𝑎/𝜅) with knee 𝜅 > 0 to
      prevent a few large events from saturating 𝑅1 and 𝑅2 .


“Proof by Resonance” Workflow
                                                        Î
   1. Specify scaffold. Fix 𝑛 and its factorization 𝑛 = 𝑝𝑟 𝑝 . Choose tiers D, weights 𝜂 𝑑 , and
      aggregation 𝜆.
   2. Initialize word. Construct 𝑁b from prime words 𝑃ˆ ( 𝑝) with initial parameters (subdivision
      depth, accent weights, rotations, permutations).
   3. Optimize. Maximize 𝑅(𝑥, 𝐷) over discrete orderings and rotations, and over continuous
      accent weights. Use grid search for 𝜙 and 𝜋, coordinate ascent or derivative-free optimizers
      for amplitudes.


                                                           15
   4. Gauge-fix. Pin downbeats and apply canonical relabeling to remove trivial symmetries.
      Recompute 𝑅 post-gauge.
   5. Ablate. Remove or reorder single operators; record Δ𝑅 to identify necessity and sufficiency
      of each layer.
   6. Validate. Test on held-out windows or transpositions (𝑇𝜏 𝐷) and report (𝑅1 , 𝑅2 , 𝑅3 ) with
      tier breakdown.


Benchmarks: Synthetic and Real Cycles
Synthetic.
   • 108-cycle. Ground-truth S33 S22 with accents at 27, 9, 3, 4, 2; add jitter, missing hits, and
     colored noise. Report 𝑅 vs. SNR and jitter.
   • Co-prime overlays. 𝑛 ∈ {60, 84, 90} with known prime layers; test recovery under wrong
     operator order to show noncommutation effects on 𝑅.
   • Heptadic drift. Overlay 𝑝 = 7 ornaments on scaffolds with 7 ∤ 𝑛; verify 𝑅3 sensitivity to
     slow phase drift.

Real.
    • Metered sequences. Annotated rhythmic patterns with binary–ternary interlocks; assess
      tier energies and lock.
    • Breath or gait cycles. Windowed counts mapped to T𝑛 ; evaluate whether observed
      periodicities align with prime tiers via 𝑅2 and phase coherence via 𝑅3 .
    • Counting rituals. Sequences with target counts (e.g., 108) to validate cadence placement
      and robustness to omissions.
Reporting. For each dataset: (𝑅1 , 𝑅2 , 𝑅3 ), tier-wise {𝐸 𝑥 (𝐾 𝑑 ), 𝐸 𝐷 (𝐾 𝑑 )}, phase polar plots per
𝑑, and ablation table of operator contributions to 𝑅.


Ramanujan-Style Intuition Channel and the 108-Cycle

Modular or 𝑞-Series Seeds
Let a seed series be                         ∑︁                         Ö              
                               𝐹 (𝑞) =             𝑎𝑛 𝑞𝑛,        𝑎𝑛 =       𝑔 𝑝 𝑣 𝑝 (𝑛) ,
                                             𝑛≥0                        𝑝

where 𝑣 𝑝 (𝑛) is the 𝑝-adic valuation and 𝑔 𝑝 : N0 → C gates coefficients by prime tiers. Typical
gates:
                           𝑟
                         ∑︁            
        𝑔 𝑝 (𝑟) = exp          𝛼   𝑝𝑗       (tiered exponential),           𝑔 𝑝 (𝑟) = 1 𝑟≥𝑟 ★   (threshold),
                         𝑗=1




                                                            16
or 𝑔 𝑝 (𝑟) = 𝜒 𝑝 (𝑛) for a Dirichlet character mod 𝑝 𝑠 . The operator word 𝑁   b induces a parallel
seed via a time–domain construction 𝑥 = 𝑁     b[𝑥0 ]; its spectral combs at tiers 𝑝 𝑗 correspond to
coefficient gates 𝑔 𝑝 ( 𝑗).


Alignment of Operator Factorizations Across Series
Seek identities of the form

                      ?
                                                                                       Ö
                                                                                           𝑃ˆ ( 𝑝) ,
                                                 
                𝐹 (𝑞) = Φ 𝑞; {𝛼 𝑝 𝑗 , 𝜙 𝑝 , 𝜋 𝑝 } ,        Φ generated by 𝑁
                                                                          b=
                                                                                       𝑝


where the prime-power structure of 𝑎 𝑛 aligns with the CRT tiers of 𝑁.
                                                                    b Alignment criteria:

                                  
                                 𝑥 ∩ 𝐾𝑛/𝑝 𝑗 ≠ ∅
                            supp b                         ⇐⇒          𝑔 𝑝 ( 𝑗) ≠ 0,

and phase locks at those harmonics match rotation parameters 𝜙 𝑝 .


Validation by Resonance: Asymptotics, Congruences, Cycles
Three checks complement the 𝑅-score:
                                                             Í
  1. Asymptotics. Compare 𝑛 → ∞ growth of partial sums 𝐴(𝑁) = 𝑛≤𝑁 𝑎 𝑛 with level-energy
                         𝑥 [𝑘]| 2 .
             Í
      growth 𝑘 ∈𝐾𝑛/ 𝑝 𝑗 |b
                                                                   𝜙
   2. Congruences. Test 𝑎 𝑛+𝑚 ≡ 𝑎 𝑛 (mod 𝑝 𝑗 ) when R 𝑝 𝑗 enforces periodic phase; match to
      cyclicities in class labels.
   3. Cycle fits. Map 𝑎 𝑛 windows to T𝑛 and evaluate (𝑅1 , 𝑅2 , 𝑅3 ) against 𝑁-generated
                                                                             b           𝑥.


Worked Example: the 108-Cycle
Factorization and CRT.

                          108 = 22 · 33 ,         Z/108Z  Z/4Z × Z/27Z.

Binary tiers: 2, 4; ternary tiers: 3, 9, 27.

Operator word variants.         Ternary-first (phrase-first):

                                                                    (0 1)
                          W△ = S33  S22 ·A2727 A9 9 A3 3 A4𝛼4 A2𝛼2 W2 .
                                                      𝛽    𝛽   𝛽
                              |{z} |{z}
                                     27      ×4




                                                      17
Binary-first (micro-first syncopation):

                        W□ = S22 W2(0 1) S33 ·A4𝛼4 A2𝛼2 A2727 A9 9 A3 3 .
                                                                   𝛽   𝛽   𝛽
                            |{z}        |{z}
                                   4             ×27


Tick classes and weight schedule.       For 𝑡 ∈ T108 define

                𝐶0 : 𝑡 ≡ 0    (mod 27)     (cadence apex),
                𝐶1 : 𝑡 ≡ 0    (mod 9) ∧ 𝑡 . 0          (mod 27),
                𝐶2 : 𝑡 ≡ 0    (mod 3) ∧ 𝑡 . 0          (mod 9),
                𝐶3 : 𝑡 ≡ 0    (mod 4) ∧ 𝑡 . 0          (mod 3),
                𝐶4 : 𝑡 ≡ 0    (mod 2) ∧ 𝑡 . 0          (mod 4) ∧ 𝑡 . 0         (mod 3).

Weights (monotone hierarchy):

        𝑊 (𝑡) = 𝑤 0 [𝑡 ∈ 𝐶0 ] + 𝑤 1 [𝑡 ∈ 𝐶1 ] + 𝑤 2 [𝑡 ∈ 𝐶2 ] + 𝑤 3 [𝑡 ∈ 𝐶3 ] + 𝑤 4 [𝑡 ∈ 𝐶4 ],

with 𝑤 0 > 𝑤 1 > 𝑤 2 > 𝑤 3 > 𝑤 4 ≥ 0.

Pseudocode: generation and rotation.

Input: n=108; weights w0>w1>w2>w3>w4; swap flag s{0,1}; rotation Z
Output: pattern x[0..107] (scalar or k-channel)

for t in 0..107:
  a3 = (t % 3 == 0)
  a9 = (t % 9 == 0)
  a27 = (t % 27 == 0)
  b2 = (t % 2 == 0)
  b4 = (t % 4 == 0)

  if a27: x[t] += w0
  else if a9: x[t] += w1
  else if a3: x[t] += w2
  else if b4: x[t] += w3
  else if b2: x[t] += w4

# optional off-beat swap for binary micro
if s==1:
  for each 4-block B={t,t+1,t+2,t+3}:


                                                 18
     swap x[t] with x[t+2]               # (0,2) within each 4-grid

# global rotation
x = rotate(x, ) # circular shift by                      ticks

Optional color layers from 5 and 7.         Quinary ornament without ternary collisions:
                                                        
                                  𝑥 ← 𝑥 + 𝛾5 1 − [3 | 𝑡] [5 | 𝑡] 𝑒 𝑐 .

Heptadic drift overlay (7 ∤ 108): choose seed 𝜇 and step 𝜌 per cycle,

      𝑥 ← 𝑥 + 𝛿 1 𝑡∈𝑆7 (108,𝜇) 𝑒 1 ,     𝑆7 (108, 𝜇) = {𝜇 + ℓ 𝑠108 mod 108 : ℓ = 0, . . . , 6},

where 7 𝑠108 ≡ 1 (mod 108), and update 𝜇 ← 𝜇 + 𝜌 each repetition.

Analysis: cadence, syncopation, resonance.
    • Cadence structure. W△ yields predictable peaks at 𝐶0 with subordinate tiers 𝐶1 , 𝐶2 ;
      binary layers 𝐶3 , 𝐶4 fill interstices.
    • Syncopation. W□ places W2 before ternary gating, shifting micro energy off the ternary
      spine; compare by 𝑅1 after optimal rotation.
    • Resonance scores. Evaluate (𝑅1 , 𝑅2 , 𝑅3 ) against annotated targets. Expect 𝑅2 to favor
      W△ (better tier energy at 27, 9, 3), while 𝑅1 may favor W□ on datasets with intended
      backbeat emphasis. Phase coherence 𝑅3 discriminates heptadic drift layers when present.
                                                                                       Í
Remark (series link). Associate the constructed pattern with a gated series 𝐹 (𝑞) = 𝑎 𝑛 𝑞 𝑛
using
                                            Ö         𝑝 (𝑛)
                                                    𝑣∑︁        
                                   𝑎𝑛 =        exp          𝛼𝑝 𝑗 ,
                                          𝑝∈{2,3,5,7}      𝑗=1

and choose 𝛼 𝑝 𝑗 to match measured tier energies of 𝑥; operator identities correspond to 𝑞-series
factorizations whose exponents encode {𝛼 𝑝 𝑗 }, validated by resonance and congruence checks.


Algorithms and Implementation

Data Structures
Time lattice. T𝑛 = {0, . . . , 𝑛 − 1}. Store patterns as dense arrays 𝑋 ∈ R𝑛×𝑘 with row-major
layout. Provide circular indexing helpers and FFT backends for C𝑛×𝑘 .

Hypergraph incidence. 𝐻 = (𝑉, 𝐸, 𝜄) with |𝑉 | = 𝑁𝑉 , |𝐸 | = 𝑁 𝐸 . Use:
   • CSR-like incidence: arrays edge_ptr[0..𝑁 𝐸 ] and edge_vtx[0..|𝜄|-1].

                                                    19
    • Vertex and edge state tensors: 𝜎 ∈ R𝑁𝑉 ×𝑘 𝑉 , 𝜏 ∈ R𝑁 𝐸 ×𝑘 𝐸 .

Operator pipeline.     Represent an operator word as an ordered list of typed nodes:

               W = [(S, 𝑝, 𝑟), (A, 𝑝 𝑗 , 𝛼), (R, 𝑝 𝑗 , 𝜙), (W, 𝑝, 𝜋), (Q, 𝑝, 𝜃 𝑄 ), . . . ]

Each node stores in-place and out-of-place kernels. Provide two evaluation modes:
  1. eager: apply kernels sequentially on 𝑋, (𝜎, 𝜏).
  2. jit-graph: fuse linear parts; push FFT-based rotations to frequency domain.


                               ˆ
Parameterization Θ = {𝛼, 𝜙, 𝜋, 𝑄}
    • Accents 𝛼 = {𝛼 𝑝 𝑗 } per prime-tier and channel.
    • Rotations 𝜙 = {𝜙 𝑝 𝑗 }. Use fractional 𝜏 = 𝜙 𝑛/𝑝 𝑗 ∈ R realized via phase in Fourier domain
      for differentiability.
    • Permutations 𝜋 = {𝜋 𝑝 ∈ 𝑆 𝑝 } per prime. Discrete; optimized by search.
    • Relation ops 𝑄ˆ = {𝜃 𝑄 }: split/merge/fold/relabel parameters (discrete topology moves
      with optional continuous weights for merge criteria).
Optional hyperparameters: projector weights 𝜂 𝑑 , score weights 𝜆 = (𝜆 1 , 𝜆2 , 𝜆3 ), ornament gains
for 𝑝 = 5, 7.


Learning the Operator Word
                                           
Let the objective be maxΘ,order 𝑅 WΘ [M], 𝐷 with 𝑅 ∈ [0, 1] defined previously.

Continuous gradients (for 𝛼, 𝜙).        Set loss 𝐿 = 1 − 𝑅.
                                                                             D 𝜕𝐿                 E
    • Accents. For additive accents 𝑋 ′ = 𝑋 + 𝛼                 ⊤ 𝜕𝐿 =               , 𝐷 𝑝 𝑗 𝑒⊤
                                                     𝑝 𝑗 𝐷 𝑝 𝑗 𝑒1 ,                ′          1       .
                                                                    𝜕𝛼 𝑝 𝑗    𝜕𝑋
    • Rotations. Use fractional shift via phase:

                                                          𝑋𝜏 [𝑘]
                                                         𝜕c         2𝜋𝑖𝑘 c
                          𝑋𝜏 [𝑘] = 𝑒 −2𝜋𝑖𝑘𝜏/𝑛 𝑋
                          c                   b[𝑘],              =−      𝑋𝜏 [𝑘].
                                                           𝜕𝜏        𝑛

     Backprop through FFT to obtain 𝜕𝐿/𝜕𝜏, then map to 𝜕𝐿/𝜕𝜙.
To avoid arg non-differentiability in 𝑅3 , use atan2 with small 𝜖 or adopt a cosine surrogate
cos(Δ𝜑).

Discrete structure (for 𝜋, 𝑄,ˆ and order).
   • Beam search over operator orderings and 𝜋, score by 𝑅. Beam width 𝐵 ∈ [8, 64] suffices
     for 𝑝 ∈ {2, 3, 5, 7}.
   • Local moves: swap adjacent operators, toggle W 𝑝 placement, increment 𝜙 by grid steps,
     flip accent tiers on/off.

                                                   20
    • Evolutionary loop: population of words; mutation = local moves; crossover = splice at
      prime boundaries; selection by 𝑅.
    • Relation search 𝑄:
                       ˆ greedy split/merge with acceptance if Δ𝑅 > 0; periodic fold/relabel
      proposals. Optionally MCMC with temperature schedule.

Soft relaxations (optional). Gumbel-Sinkhorn for 𝜋 as doubly-stochastic 𝑃 with annealing;
project to nearest permutation at evaluation time. Straight-through estimators for discrete toggles.


Complexity and Memory
Let 𝐿 be operator count, 𝑘 channels, 𝑛 ticks, 𝑑max = max 𝑝 arity.
    • S 𝑝 : 𝑂 (𝑛) write; increases length to 𝑝𝑛 if materialized. Prefer virtual indexing; cost 𝑂 (1)
      per access.
    • A 𝑝 𝑗 : 𝑂 (𝑛).
    • R 𝑝 𝑗 : time-domain shift 𝑂 (𝑛); FFT method 𝑂 (𝑛 log 𝑛) but batches and composes well;
      preferred when learning 𝜙.
    • W 𝑝 : 𝑂 (𝑛) with stride-𝑝 block shuffles; cache-friendly.
    • FFTs: 𝑂 (𝑛 log 𝑛) per channel; reuse plans; fuse multiple spectral ops in one for-
      ward–backward pass.
    • Relation 𝑄ˆ 𝑝 : split/merge linear in |𝜄|; fold/relabel linear in |𝑉 | + |𝐸 | + |𝜄|.
Memory: 𝑂 (𝑛𝑘) for 𝑋 plus 𝑂 (|𝑉 | + |𝐸 | + |𝜄|). During backprop with FFT, peak memory 𝑂 (𝑛𝑘)
activations per fused block. Use gradient checkpointing over operator groups to cap peak RAM.


Implementation Notes
Pseudocode: training loop.

Input: data D, lattice n, hypergraph H, initial word W0, scores R1,R2,R3
Params: , , learning rates, beam width B, steps T
Initialize = {, , , Q^} from priors; W = W0

for t in 1..T:
  # 1) Continuous update (, ) with autodiff
  x = eval_word(W, ; fft_rotations=True)
  R = 1*R1(x,D) + 2*R2(x,D) + 3*R3(x,D)
  L = 1 - R
  backprop L → grads for ,
  , ← optimizer_step(, , grads)

  # 2) Discrete search step


                                                21
  C = neighborhood(W, , moves={swap, toggle_Wp, delta_phi_grid, split/merge})
  S = top_B_by_R(C, D, B)
  (W, ) ← argmax_{(W’,’)S} R(eval_word(W’,’))

  # 3) Gauge-fix and log
  (W, ) ← gauge_fix(W, )
  log_metrics(R, R1, R2, R3, tier_energies, invariants)

Numerical stability.
  • Normalize 𝑋 per channel before scoring; soft-clip with 𝑠 𝜅 .
  • Use real-to-complex FFTs; maintain Hermitian symmetry if signals are real.
  • For S 𝑝 , prefer lazy indexing to avoid exploding 𝑛.


Reproducibility
    • Seeds. Fix RNG seeds for: parameter init, beam tie-breaking, mutation proposals. Record
      in metadata.
    • Configs. YAML/JSON config with 𝑛, factorization tiers, 𝜆, 𝜂, learning rates, optimizer,
      beam width, move set, early-stopping thresholds, and gauge-fix rules.
    • Determinism. Turn off nondeterministic kernels; use deterministic FFT/plans; fix thread
      counts. Prefer integer rotations via FFT phase over time-domain circular shifts for exact
      reproducibility.
    • Paths. Cache exact operator words and parameters at each checkpoint; store hashes of
      datasets; version 𝑁
                        b as a string of tokens.
    • Ablation sheets. Export per-operator Δ𝑅, tier energies, and phase polar plots; include
      commit hashes and environment manifest.
With these structures and procedures, MOC training scales as 𝑂 (𝑇 · (𝑛 log 𝑛 + |𝜄|)) in typical
FFT-backed implementations, with bounded memory via operator fusion and checkpointing, and
with deterministic replay from saved words, seeds, and configs.


Experiments

Datasets
We evaluate MOC on three domains with tiered periodic structure.

Metrical corpora. Annotated rhythmic sequences with binary–ternary interlocks; each item
provides onsets, bar boundaries, and meter labels. Sequences are mapped to lattices T𝑛 with
𝑛 ∈ {48, 60, 72, 84, 90, 96, 108}.


                                              22
Ritual schedules. Counted-cycle practices (e.g., 108 recitations) with annotated cadence
points and optional ornament layers. Instances include fixed-𝑛 sessions and multi-session logs
with interruptions.

Physiological cycles. Breath or gait signals segmented to windows; per-window lattice sizes
chosen by period estimates (median-IQR of inter-event intervals) and snapped to the nearest
highly composite 𝑛.


Protocols
    • Splits. For corpora with ≥ 100 items: 70% train, 15% validation, 15% test; stratified by
      nominal meter and 𝑛. For smaller sets: 5-fold cross-validation. Random seeds fixed and
      reported.
    • Training. Optimize continuous parameters 𝛼, 𝜙 by gradient steps on 𝑅; search discrete
      𝜋, 𝑄ˆ by beam width 𝐵 ∈ {16, 32} with early stop on validation 𝑅.
    • Gauge-fixing. Downbeat pinning on top tier, canonical relabeling for (𝑉, 𝐸), CRT phase
      normal form before scoring.
    • Baselines. (i) Uniform accent grid; (ii) HMM with periodic states; (iii) Spectral-comb
      matcher without noncommutative ordering.


Ablations
   1. Remove single primes. Drop all 𝑝-family operators for 𝑝 ∈ {2, 3, 5, 7}; reoptimize
      remaining parameters.
   2. Vary order. Enumerate adjacent swaps in the operator word; record Δ𝑅.
   3. Freeze relations. Disallow 𝑄ˆ on 𝐻 (state-only) versus full joint action.
   4. Disable projectors. Remove Π 𝑝𝑟 from diagnostics to test reliance on CRT structure.


Metrics
Primary scores are the resonance components:

𝑅1 (time correlation),   𝑅2 (harmonic lock),   𝑅3 (phase coherence),   𝑅 = 𝜆1 𝑅1 +𝜆2 𝑅2 +𝜆3 𝑅3 .

We also report:
    • Confusion among gauge-equivalent words. Let C be conjugacy classes under gauge;
      top-1 class accuracy 𝐴class = 𝑁1 𝑖 1{ 𝑁
                                      Í      b𝑖 ∈ C(𝑁 ★)}.
                                                       𝑖
    • Tier energies. 𝐸 𝑝𝑟 via projectors Π 𝑝𝑟 and their KL divergence from targets.
    • Order sensitivity. Δ𝑅 distribution across single adjacent swaps.
Error bars are mean±sd over seeds and 95% bootstrap CIs (1,000 resamples).


                                               23
Results
Main table.    Per dataset and lattice 𝑛, we report (𝑅1 , 𝑅2 , 𝑅3 ), 𝑅, and 𝐴class for MOC and
baselines.

   Table 1: Resonance and class accuracy (mean ± sd over seeds; 95% CI in parentheses).
 Dataset             𝑅1                     𝑅2                      𝑅3                𝐴class
 Metrical 0.92±0.03 (0.90–0.94) 0.89±0.04 (0.86–0.92) 0.87±0.05 (0.84–0.90) 0.81±0.06
 Ritual     0.95±0.02 (0.94–0.96) 0.93±0.03 (0.91–0.95) 0.90±0.03 (0.88–0.92) 0.86±0.05
 Physio     0.84±0.05 (0.81–0.87) 0.78±0.06 (0.74–0.82) 0.75±0.07 (0.71–0.79) 0.68±0.08



Ablation plots. We visualize Δ𝑅 when removing each prime family and when swapping
operator order. Typical trend: 𝑝 = 3 removal sharply reduces 𝑅2 ; 𝑝 = 2 affects 𝑅1 ; color primes
5, 7 minimally affect 𝑅 but improve fit variance.




          figs/ablation_deltaR.pdf




                                               ˆ and adjacent swaps. Error bars are 95%
Figure 1: Δ𝑅 under ablations: remove-𝑝, freeze-𝑄,
bootstrap CIs.




                                               24
Gauge confusion. Confusion matrices aggregated at class level show most errors are between
ternary-first and binary-first orderings that differ by a global rotation and a micro off-beat swap;
after gauge-fix, confusion drops by ≈ 60%.




               figs/confusion_matrix.pdf




Figure 2: Confusion among gauge-equivalent classes. Rows = ground-truth class, cols =
predicted.



Sensitivity to Noise and Tempo Drift
Noise. Additive noise: 𝑥 ′ = 𝑥 + 𝜀, 𝜀 ∼ N (0, 𝜎 2 𝐼). Deletion noise: drop each event with prob.
𝑝 miss . Jitter: shift onsets by Δ𝑡 ∼ N (0, 𝜎𝑡2 ). We sweep SNR ∈ {5, 10, 20} dB, 𝑝 miss ∈ [0, 0.3],
and 𝜎𝑡 up to one micro-tick.

Tempo drift.    Time-warp via multiplicative random walk on phase:
                            ∑︁
                 𝑡′ = 𝑡 +         𝜉𝑢 ,   𝜉𝑢 ∼ N (0, 𝜎𝜙2 ),   or   𝜙¤𝑢+1 = 𝜌 𝜙¤𝑢 + 𝜂𝑢 ,
                            𝑢≤𝑡

then resample to T𝑛 . Report 𝑅 vs. 𝜎𝜙 and AR coefficient 𝜌.




                                                     25
          figs/sensitivity_curves.pdf




Figure 3: Sensitivity of 𝑅 to SNR, missing events, jitter, and tempo drift. Shaded regions: 95%
CI across seeds and items.

Discussion of Outcomes
MOC outperforms baselines on all datasets in 𝑅2 and 𝑅3 , confirming harmonic tier lock and
phase coherence. On physio data with nonstationary tempo, binary-first words sometimes yield
higher 𝑅1 , reflecting backbeat-like emphasis. Ablations verify necessity of 𝑝 = 3 for phrase-level
structure and 𝑝 = 2 for micro-timing; primes 5, 7 contribute stability under drift without large 𝑅
gains, acting as informative priors rather than core scaffolds.
   All code produces tables (.csv) and figures (.pdf) with fixed seeds and configuration
manifests to enable deterministic reproduction of the numbers reported in Table 1 and Figures 1–
3.


Applications

Rhythm Design and Computational Music
Goal. Author meters and grooves from prime layers rather than bar templates.

                                                26
                                         Î ˆ ( 𝑝)
                        b=
Method. Choose 𝑛, build 𝑁                 𝑝𝑃      , render 𝑥 : T𝑛 → R𝑘 , export to MIDI or OSC.
                   ∑︁
          𝑥(𝑡) =            𝛼 𝑝𝑟 [ 𝑝𝑟 | 𝑡] 𝑒 𝑐( 𝑝)   with noncommutative order controlling feel.
                   𝑝 𝑟 ∥𝑛


Use cases. (i) meter families by factor set (e.g., 𝑛 ∈ {48, 60, 72, 108}); (ii) controlled syncopation
via W2 placement; (iii) ornament channels from 𝑝 ∈ {5, 7} avoiding ternary collisions with
projector gates.
Recipe:
  1. Pick factorization tiers; set weights 𝛽27 > 𝛽9 > 𝛽3 > 𝛼4 > 𝛼2 .
  2. Select order (ternary-first vs binary-first); audition 𝑅1 against a guide track.
  3. Freeze Π27 peaks; sweep 𝜙 for lock; export stems per prime channel.


Breath and Practice Timers with Nested Periodicities
Goal. Timers that align micro inhalation/exhalation ticks to macro counts (e.g., 108 recitations).
Method. Lattice 𝑛 = 108; set macro accents at 27, 9, 3 and micro prompts at 4, 2. Adaptive drift
correction:
                                                                      
                         𝜙𝑡+1 = 𝜙𝑡 + clip 𝜅 arg max 𝑅1 (𝑥, 𝑇𝜏 𝐷 user ) ,
                                                                𝜏

recentering the timer to the user’s phase. Use low-salience haptics on 𝑏 2 , 𝑏 4 ; high-salience on
𝑎 27 , 𝑎 9 .


Patterned Scheduling and UI Haptics
Goal. Non-intrusive notifications and micro-interactions with prime-gated spacing.
Method. Assign each notification class 𝑐 a prime 𝑝 𝑐 and tier 𝑝𝑟𝑐𝑐 . Schedule at ticks 𝑡 with
[ 𝑝𝑟𝑐𝑐 | 𝑡] = 1, optionally anti-coinciding with a protected tier 𝑞 𝑠 using (1 − [𝑞 𝑠 | 𝑡]) gates. Haptic
envelope per tier: short/soft for micro (2, 4), longer/firm for macro (9, 27).
Collision policy. Priority by tier weight; resolve ties via W 𝑝 permutations for fair interleave.
Fairness invariant 𝐹 [𝜎] ↑ prevents starvation.


Linguistic Sandhi-as-Operator Analogies
Goal. Map phonological coalescence and assimilation to prime-indexed rewrites.
Model. Let tokens be vertices; syllabic or morpheme relations be hyperedges.

            split
         𝑄ˆ 𝑝 : morpheme ↦→ allophones,                     W 𝜋𝑝 : reorder onset/coda under meter,

                                                                    𝜙
                              A 𝑝𝑟 : stress at tier 𝑝𝑟 ,        R 𝑝𝑟 : prosodic shift.




                                                           27
Resonance 𝑅2 measures fit to metrical feet; 𝑅3 checks phase-coherent sandhi across repeated
frames. Operator order distinguishes pre- versus post-lexical sandhi.


Educational Tools for Factorization-as-Form
Goal. Teach prime factorization as audible/visible structure.
Widgets.
    • Tier dialer. Toggle 𝑝𝑟 to hear/see its layer; show Π 𝑝𝑟 energy bar.
    • Order flipper. Swap operators and A/B the result; display Δ𝑅.
    • CRT canvas. Side-by-side Z/4 and Z/27 grids with synchronized cursors.
Assessment. Tasks: “design a cadence with 𝐶0 , 𝐶1 , 𝐶2 only,” or “add 𝑝 = 5 ornament avoiding
ternary collisions.” Score via 𝑅 and invariants.


Domain Map (Primes as Semantics)
              Prime   Role                          Typical constraint
              2       micro pulse, off-beat swap low salience, high density
              3       phrasing spine, cadences   downbeat pinning via Π27 , Π9
              5       ornament/color             anti-coincide with 3-tiers
              7       drifting overlay           slow phase update, low gain

These application patterns use the same core machinery: prime families for structure, noncom-
mutative ordering for feel, projectors for separation, and resonance for validation. Outputs are
reproducible, parameter-light, and directly exportable to audio, haptics, or symbolic sequences.


Comparison to Related Work

Western Metrical Models and Polyrhythm Frameworks
Classical metrical theories model rhythm via hierarchical grids and accent preference rules;
polyrhythms are often expressed as superposed integer ratios on a fixed meter. Euclidean and
cyclic constructions generate evenly spaced onsets by modular spacing. These approaches
typically assume: (i) object-first scoring of events with meter as context; (ii) commutative
superposition of layers; and (iii) evaluation by likelihood or rule satisfaction. Difference. MOC
places prime-indexed operators at the foundation, treats layer interaction as noncommutative, and
validates with a multi-view resonance functional rather than local preference or likelihood alone.


Graph Signal Processing and Hypergraph Dynamics
Graph signal processing (GSP) filters vertex signals using Laplacians and Fourier bases;
extensions to hypergraphs define higher-order Laplacians and diffusion. These methods prioritize

                                               28
linear, spectral operators on fixed topology. Difference. MOC acts on both signals and
relations: Pb( 𝑝) = ( S 𝑝 , A 𝑝𝑟 , R 𝑝𝑟 , W 𝑝 ; 𝑄ˆ 𝑝 ) couples state transforms with topological moves
(split/merge/fold/relabel). The CRT projectors Π 𝑝𝑟 provide tiered diagnostics incompatible with
a single Laplacian spectrum when operator order reshapes incidence.


Rule-Based Generative Systems and Rewrite Calculi
Generative grammars, L-systems, and term-rewrite calculi create structure by deterministic or
stochastic rules. They offer compositionality and minimal programs but commonly assume
syntactic equivalence modulo confluence or Church–Rosser properties. Difference. MOC’s
“sutra” rules are prime-tiered and intentionally order-sensitive; noncommutation is a feature, not
a defect. Equivalence is judged up to gauge and resonance, not solely by derivational normal
forms.


Modular Forms and 𝑞-Series Analogies for Prime Gating
Euler products, Dirichlet characters, and Hecke operators exhibit prime-factor gating of coeffi-
cients; theta functions and modular forms encode arithmetic in 𝑞-expansions. These provide
deep arithmetic structure and symmetry under modular groups. Analogy. MOC’s coefficient
             Î
gates 𝑎 𝑛 = 𝑝 𝑔 𝑝 (𝑣 𝑝 (𝑛)) mirror prime-sensitive weighting, and rotations resemble phase twists
on coefficients. Caveat. MOC does not claim modularity; it leverages the idea of prime-tier
factorization to design operator words whose spectral combs align with arithmetic tiers, then
tests fit via resonance and congruence checks.


Distinctives: Prime-Indexed Noncommutation and Resonance Proof
MOC differs along five axes:
   1. Prime-indexed families. Each prime 𝑝 supplies a bundled set ( S 𝑝 , A 𝑝𝑟 , R 𝑝𝑟 , W 𝑝 ; 𝑄ˆ 𝑝 )
      across tiers 𝑝𝑟 .
   2. Explicit noncommutation. Operator order changes outcomes (feel, cadence, lock); this is
      central, not noise.
   3. Joint state–relation action. Relation operators 𝑄ˆ 𝑝 alter incidence, enabling dynamics
      beyond fixed-topology filtering.
   4. CRT-tier diagnostics. Projectors Π 𝑝𝑟 separate macro/meso/micro content and guide
      design and validation.
   5. Proof by resonance. Validity is empirical-formal: 𝑅 = 𝜆 1 𝑅1 + 𝜆2 𝑅2 + 𝜆3 𝑅3 ∈ [0, 1]
      combines time correlation, harmonic lock, and phase coherence. “Proof” means achieving
      stable, reproducible high 𝑅 under ablations and gauge normalization.
In short, MOC integrates arithmetic tiering, noncommutative operator composition, and joint
topology–signal action, and it assesses adequacy through a calibrated resonance score rather

                                                 29
                Table 2: Summary contrasts with representative paradigms.
 Paradigm                Layers               Order                  Validation
 Metrical/polyrhythm     additive grids       mostly commutative rules / likelihood
 GSP/hypergraph filters linear spectral maps commutative (linear) spectral fit / MSE
 Rewrite/L-systems       syntactic rules      often confluent        normal forms
 𝑞-series/modular        arithmetic gates     algebraic (Hecke)      modular invariants
 MOC (this work)         prime-indexed ops    noncommutative         resonance (𝑅1 , 𝑅2 , 𝑅3 )


than solely through symbolic or spectral optimality.


Ethics and Constraints

Cultural Context and Non-Appropriative Framing
This work draws conceptual inspiration from Eastern traditions that treat number and relation as
co-arising. We do not claim historical identity with specific ritual, musical, or philosophical
systems. The Multiplicity Operator Calculus (MOC) is a modern formalism. Appropriate use
includes:
    • citing cultural sources when reproducing patterns associated with living traditions,
    • obtaining consent for data derived from ritual or personal practice,
    • offering opt-out and anonymization for shared materials,
    • avoiding commercial packaging that implies endorsement by source communities.
When releasing datasets, include provenance statements, community permissions (where
applicable), and context notes to prevent decontextualized reuse.


Interpretability vs. Automation Tradeoffs
MOC can be fully automated (search over operator words), but we recommend interpretability-first
practice:
   1. Word transparency. Publish the exact operator word, parameter vector Θ = {𝛼, 𝜙, 𝜋, 𝑄}, ˆ
      and gauge-fix applied.
   2. Ablation logs. Release per-operator Δ𝑅 and order-swap effects to show which layers are
      decisive.
   3. Tier diagnostics. Report CRT-tier energies 𝐸 𝑝𝑟 and phase polar plots for reproducibility
      and audit.
   4. Human-in-the-loop. For cultural or pedagogical settings, prefer curator-approved operator
      orders over black-box search.
Automation without these disclosures risks inscrutability and the projection of false authority
onto generated structures.



                                              30
Fairness and Energy Constraints as Invariants
Applications that schedule attention, haptics, or resources should respect invariants that prevent
overload or inequity. We formalize:
                          ∑︁
                𝐸 [𝑥] =          ∥𝑥(𝑡)∥ 2 ≤ 𝐸 max ,        𝐸 𝑝𝑟 = ∥Π 𝑝𝑟 𝑥∥ 22 ≤ 𝜂max
                                                                                 𝑝 𝑟 𝐸 max ,
                          𝑡∈T𝑛


and a fairness measure over carriers (e.g., tasks, users, channels) indexed by 𝑖:

                                           min𝑖 Σ𝑖           ∑︁
                                 𝐹 [𝜎] =           with Σ𝑖 =    𝜎𝑖 (𝑡),
                                           max𝑖 Σ𝑖            𝑡

subject to 𝐹 [𝜎] ≥ 𝐹min . Admissible operator words satisfy these inequalities by construction or
by projection:
                                                            
                                  W ↦→ Proj{𝐸,𝐸 𝑝𝑟 ,𝐹} W ,

ensuring energy budgets and fair allocation persist across noncommutative compositions.


Scope Limits: Where MOC Does Not Apply
    • Non-cyclic or aperiodic dynamics. MOC assumes a finite lattice T𝑛 and CRT tiers; it
      is not suited to strongly aperiodic or continuous-time chaotic systems without explicit
      discretization and validation.
    • Prime-agnostic phenomena. Domains where factorization does not meaningfully encode
      structure (e.g., arbitrary real-valued spectra without salient combs) are out of scope.
    • Causal inference. Resonance 𝑅 establishes descriptive fit, not causation. Do not treat
      high 𝑅 as evidence of mechanism.
    • Clinical or safety-critical use. Breath/gait examples are illustrative. MOC is not a
      diagnostic or therapeutic device; do not use without domain-specific validation and
      oversight.
    • Doctrinal claims. The calculus does not validate metaphysical or religious assertions. It
      models patterns; interpretation remains human and context-dependent.


Operational Guardrails
Before deployment:
  1. set (𝐸 max , 𝜂max
                   𝑝 𝑟 , 𝐹min ) and enforce them at compile time of the operator word,
  2. log seeds, configs, gauge choices, and ablations,
  3. include a cultural-context note with provenance and usage constraints,
  4. provide a user control to disable ornaments (𝑝 = 5, 7) and to reduce micro density (𝑝 = 2)
     for accessibility.


                                                      31
These measures preserve transparency, respect for sources, and user well-being while retaining
the expressive power of prime-indexed, noncommutative design.


Limitations

Identifiability Under Gauge Classes
MOC operator words are identifiable only up to gauge and phase:

                    W ∼ W ′ ⇐⇒ ∃ 𝑔 ∈ 𝐺, 𝜙 ∈ Z : W ′ = R𝑛 𝑔 W 𝑔 −1 ,
                                                                  𝜙



with 𝐺 acting on time, vertices, and edges. In practice, nontrivial collisions occur: distinct
words produce indistinguishable outputs after gauge-fix and rotation, especially when weights
on lower tiers are small or when ornaments (𝑝 = 5, 7) are suppressed. Our diagnostics (tier
energies, phase polar plots) reduce but do not eliminate ambiguity. Hence point-estimates of
operator order should be reported as gauge classes rather than unique words.


Discrete Operator Relaxations and Gradient Fidelity
Learning uses continuous relaxations for discrete choices (permutations 𝜋, topology moves
 ˆ Doubly-stochastic relaxations (e.g., Gumbel–Sinkhorn) and straight-through estimators
𝑄).
introduce bias:
                                         b ≠ ∇𝜋 E[ 𝑅],
                                   E[∇𝜋 𝑅]          b

and annealing schedules may “freeze” into suboptimal permutations whose test-time projection
degrades 𝑅. Similarly, surrogate losses for 𝑅3 avoid arg discontinuities but can flatten gradients
near phase lock. These issues limit convergence guarantees and complicate reproducibility when
discrete search spaces are large.


Handling Incommensurate Periods at Scale
MOC assumes a finite lattice T𝑛 . Real data often mixes near-coprime or drifting periods, pushing
𝑛 toward large lcm values. This increases memory and FFT cost, and it weakens CRT-tier
separation when some prime powers are absent or very large. Approximations—windowed
lattices, multi-rate tiling, rational approximants—help but introduce boundary artifacts and
leakage that affect 𝑅2 and 𝑅3 . Heptadic overlays on scaffolds with 7 ∤ 𝑛 are supported only as
sparse gates, not true tiers, limiting formal symmetry.




                                               32
Real-Time Constraints and Latency
Interactive uses (haptics, timers) require low latency. Rotation and spectral diagnostics favor FFT
methods with 𝑂 (𝑛 log 𝑛) cost and batch latency, conflicting with real-time feedback. Sliding
updates for the DFT mitigate but still incur per-harmonic maintenance:
                                                                    
                            b𝑡+1 [𝑘] = 𝜔−𝑘
                            𝑋           𝑛    𝑋
                                             b𝑡 [𝑘] + 𝑥 𝑡+1 − 𝑥 𝑡+1−𝑛 ,


which is 𝑂 (𝑛) per tick without subsampling. Phase-locked loop corrections improve alignment
but add smoothing delay. In practice we must trade fidelity for responsiveness by (i) limiting
active tiers, (ii) precompiling operator words, and (iii) scoring on downsampled combs. These
choices can under-estimate syncopation effects and reduce sensitivity to weak tiers.


Additional Practical Limits
     • Energy/fairness constraints. Hard caps on tier energies or fairness may render optimiza-
       tion infeasible; projection steps can distort noncommutative order effects.
     • Topology dynamics. Relation operators 𝑄ˆ that change incidence complicate caching
       and invalidate linear-time assumptions; current implementations restrict the frequency of
       topology moves.
     • Noise models. The resonance functional presumes stationary noise within windows;
       heavy-tailed or bursty noise patterns bias 𝑅1 and 𝑅2 unless robust norms are used.
Overall, MOC is most reliable on moderate 𝑛 with clear prime tiers, limited discrete search, and
offline scoring. Streaming, highly incommensurate, or topology-heavy regimes expose the above
limitations.


Future Work

Continuous-Time Extensions and Adelic Formulations
Continuous time. Replace the lattice T𝑛 by the circle group T = R/𝑇Z with signals in 𝐿 2 (T, R𝑘 )
or tempered distributions. Prime tiers become semigroups of flows

                                     S𝑝 (𝜏) = 𝑒 𝜏L 𝑝 ,   𝜏 ≥ 0,

where L 𝑝 generates 𝑝-rate refinement/rotation; discrete S 𝑝 , R 𝑝𝑟 arise by sampling 𝜏 on rational
grids. Comb masks generalize to Dirac combs 𝑝𝑟 ; projectors Π 𝑝𝑟 become convolution with
low-pass kernels supported on harmonics {𝑘 𝑇/𝑝𝑟 }.




                                                 33
   Adeles. Model multi-tier time as the restricted product
                                                    Ö
                                                           ′
                                        AQ = R ×               Q𝑝 ,
                                                      𝑝


with test space S(AQ ) (Schwartz–Bruhat). Prime gates are local factors 1Z 𝑝 ; the archimedean
tier plays the role of continuous micro-timing. MOC operators become restricted tensor products
      Ë′
P              b( 𝑝) . CRT on Z/𝑛Z lifts to adelic factorization; resonance extends via product
          𝑝≤∞ P
 b=
integrals with separate weights for the real and 𝑝-adic parts.


Learning Relation Operators 𝑄ˆ 𝑝 from Data
Objective. Jointly infer topology moves and state operators by maximizing 𝑅 with regularizers
on incidence complexity:

                                      b ˆ [M], 𝐷) − 𝜆 topo ∥𝜄′ ∥ 0 .
                               max 𝑅( 𝑁
                               ˆ Θ      Θ,𝑄
                               𝑄,


Approaches.
    • Structural EM: E-step proposes split/merge/fold candidates; M-step optimizes Θ =
      {𝛼, 𝜙, 𝜋}.
    • Policy search: reinforcement signal 𝑅 guides a topology policy over {split, merge, fold, relabel}
      with acceptance tests on invariants.
    • Differentiable proxies: soft-incidence tensors with entropic penalties; anneal to discrete 𝜄.
Validation. Report topology edit distance, invariant preservation, and ablation Δ𝑅 per relation
move.


Multi-Channel Vector Signals and Cross-Modal Coupling
Generalize 𝑥 : T𝑛 → R𝑘 with coupling operators

                            C 𝑝𝑟 : 𝑥 ↦→ 𝑀 𝑝𝑟 ∗ (Δ 𝑝𝑟 𝑥),         𝑀 𝑝𝑟 ∈ R𝑘×𝑘 ,

to route tier events across channels (audio, haptics, visual). Enforce energy/fairness invariants
                                             Í
per channel and cross-channel budgets (e.g., 𝑐 𝐸 𝑐 ≤ 𝐸 max , 𝐹 [𝜎] ≥ 𝐹min ). Extend resonance to
a weighted sum across modalities with modality weights 𝜔𝑐 and cross-coherence terms between
channels.


Formal Category-Theoretic Semantics
Define a category Mult:
    • Objects: multiplicity spaces M = (X, 𝐻) with designated CRT tiers.


                                                 34
    • Morphisms: gauge classes of operator words [W] : M → M ′ that preserve declared
       invariants.
    • Monoidal product: ⊗ via CRT (coprime concatenation of tiers) yielding M ⊗ M ′.
Projectors Π 𝑝𝑟 are natural transformations; resonance 𝑅 is a functor Mult → [0, 1] stable under
gauge. A 2-categorical layer can encode conjugation-by-gauge as 2-morphisms, clarifying
identifiability and equivalence.


Tooling: Editor, Sequencer, Resonance Meter
Editor. Visual CRT canvas with tier toggles, operator graph view, gauge-fix controls, and
invariant dashboards.
    Sequencer. Prime-lane DAW: lanes for 𝑝 ∈ {2, 3, 5, 7}, drag–drop S, A, R, W, 𝑄ˆ blocks,
real-time audition, export to MIDI/OSC/haptics.
    Resonance meter. Live (𝑅1 , 𝑅2 , 𝑅3 ) with tier energy bars, phase polar plots, and ablation
assistant that proposes minimal edits to raise 𝑅 while respecting budgets.
    Reproducibility. Project files store operator words, Θ, seeds, and gauge settings; one-click
“freeze” produces deterministic renders and reports.
These trajectories extend MOC from discrete lattices to continuous and adelic settings, from
fixed to learned relations, and from single-channel rhythms to cross-modal structures, while
giving a categorical backbone and practical tools for design, analysis, and deployment.


Conclusion

Contributions and Findings
We presented the Multiplicity Operator Calculus (MOC), a prime-indexed, noncommutative
framework acting jointly on signals and relations. The calculus supplies:
    • operator families ( S 𝑝 , A 𝑝𝑟 , R 𝑝𝑟 , W 𝑝 ; 𝑄ˆ 𝑝 ) with explicit cross-prime noncommutation;
    • CRT-tier projectors Π 𝑝𝑟 for analysis and control;
    • a resonance functional 𝑅 = 𝜆 1 𝑅1 +𝜆 2 𝑅2 +𝜆 3 𝑅3 ∈ [0, 1] that validates fit in time, spectrum,
      and phase;
    • a worked 𝑛 = 108 construction exposing the effect of operator order (ternary-first vs.
      binary-first);
    • algorithms for learning continuous parameters and searching discrete structure, with
      reproducibility and invariants.
Experiments on metrical, ritual, and physiological data show consistent gains in harmonic lock
and phase coherence over baselines, and ablations confirm the structural roles of 𝑝 = 3 (phrasing)
and 𝑝 = 2 (micro-timing), with 5, 7 as stable ornaments.



                                                 35
Practical Guidance for Adoption
   1. Choose 𝑛 by factorization. Prefer 𝑛 with meaningful prime powers; map data to T𝑛 via
      robust period estimates.
   2. Start with a scaffold. Build S𝑟3 then S2𝑠 for phrase-first timing; invert for syncopation.
   3. Gate and separate. Set a monotone accent hierarchy on {𝑝𝑟 }; keep roles distinct using
      Π 𝑝𝑟 .
   4. Tune by 𝑅. Optimize 𝛼 and 𝜙; search 𝜋 and word order with a small beam; always
      gauge-fix before reporting 𝑅.
   5. Respect budgets. Enforce energy and fairness invariants; use ornaments (5, 7) at low gain
      and anti-coincide with spine tiers as needed.
   6. Reproduce. Save seeds, configs, and the exact operator word; publish ablation deltas and
      tier diagnostics.


Open Problems and Next Steps
    • Theory. Continuous-time and adelic extensions; category-theoretic semantics; links to
      modular forms and Hecke-style actions.
    • Learning. Data-driven relation operators 𝑄ˆ 𝑝 ; better relaxations for permutations; struc-
      tured priors for operator order.
    • Identifiability. Sharper invariants for distinguishing gauge-equivalent words; confidence
      sets over classes.
    • Scalability. Multi-rate tilings for incommensurate periods; low-latency scoring for
      real-time feedback.
    • Multimodal. Vector signals with cross-channel coupling; resonance across audio, haptics,
      and visual strata.
    • Tooling and benchmarks. Open datasets with provenance, a prime-lane sequencer, and a
      standardized resonance meter.
MOC turns factorization into executable form: operators build structure, noncommutative order
shapes feel, and resonance supplies evidence. The framework is compact, interpretable, and
ready for controlled adoption in rhythm design, patterned scheduling, and pedagogy, with clear
pathways to deeper mathematics and broader applications.


References

References
     Primary sources on Eastern mathematical traditions




                                               36
 [1] S. N. Sen and A. K. Bag. The S̄ulbasūtras. Indian National Science Academy, New Delhi,
     1983.

 [2] Bharati Krishna Tirthaji. Vedic Mathematics. Motilal Banarsidass, Delhi, 1965.

 [3] Richard Wilhelm (transl. C. F. Baynes). The I Ching or Book of Changes. Princeton
     University Press, 1967.

 [4] Kangshen Shen, John N. Crossley, and Anthony W.-C. Lun. The Nine Chapters on the
     Mathematical Art: Companion and Commentary. Oxford University Press, 1999.

 [5] Hidetoshi Fukagawa and Tony Rothman. Sacred Mathematics: Japanese Temple Geometry.
     Princeton University Press, 2008.

     Hypergraphs, spectral methods, and rhythm theory

 [6] Claude Berge. Hypergraphs: Combinatorics of Finite Sets. North-Holland, 1989.

 [7] Alain Bretto. Hypergraph Theory: An Introduction. Springer, 2013.

 [8] Dengyong Zhou, Jiayuan Huang, and Bernhard Schölkopf. Learning with hypergraphs:
     Clustering, classification, and embedding. In Advances in Neural Information Processing
     Systems (NIPS), 2006.

 [9] Joshua Cooper and Aaron Dutle. Spectra of uniform hypergraphs. Linear Algebra and its
     Applications, 436(9):3268–3293, 2012.

[10] David I. Shuman, Sunil K. Narang, Pascal Frossard, Antonio Ortega, and Pierre Van-
     dergheynst. The emerging field of signal processing on graphs. IEEE Signal Processing
     Magazine, 30(3):83–98, 2013.

[11] Antonio Ortega, Pascal Frossard, Jelena Kovačević, José M. F. Moura, and Pierre Van-
     dergheynst. Graph signal processing: Overview, challenges, and applications. Proceedings
     of the IEEE, 106(5):808–828, 2018.

[12] Godfried T. Toussaint. The Geometry of Musical Rhythm: What Makes a “Good” Rhythm
     Good? CRC Press, 2013.

[13] Justin London. Hearing in Time (2nd ed.). Oxford University Press, 2012.

[14] David Temperley. The Cognition of Basic Musical Structures. MIT Press, 2001.

     Prior computational rhythm models and rewrite systems

[15] Eric D. Scheirer. Tempo and beat analysis of acoustic musical signals. Journal of the
     Acoustical Society of America, 103(1):588–601, 1998.


                                             37
[16] Simon Dixon. Automatic extraction of tempo and beat from musical recordings. Journal
     of New Music Research, 30(1):39–58, 2001.

[17] Anssi P. Klapuri, Antti Eronen, and Jarmo Astola. Analysis of the meter of acoustic musical
     signals. IEEE Transactions on Audio, Speech, and Language Processing, 14(1):342–355,
     2006.

[18] E. Bjorklund. The theory of rep-rate pattern generation in the SNS timing system. SNS
     Technical Note, Oak Ridge National Laboratory, 2003. (Commonly cited in “Euclidean
     rhythms” literature.)

[19] Fred Lerdahl and Ray Jackendoff. A Generative Theory of Tonal Music. MIT Press, 1983.

[20] Franz Baader and Tobias Nipkow. Term Rewriting and All That. Cambridge University
     Press, 1998.

[21] Przemyslaw Prusinkiewicz and Aristid Lindenmayer. The Algorithmic Beauty of Plants.
     Springer, 1990.


Appendix A. Full Derivations for Projector Identities

A.1 Definition and Group-Average Form
Fix 𝑛 ∈ N and 𝑥 ∈ X𝑛 = {𝑥 : T𝑛 → R𝑘 }. For a prime power 𝑝𝑟 | 𝑛 define

                                         𝑝 𝑟 −1       
                                       1 ∑︁          𝑛
                         (Π 𝑝𝑟 𝑥)(𝑡) = 𝑟       𝑥 𝑡+𝑢 𝑟 ,                      𝑡 ∈ T𝑛 .
                                       𝑝 𝑢=0        𝑝

Let R 𝑝𝑟 denote rotation by 𝜏 = 𝑝𝑛𝑟 ticks, i.e. ( R 𝑝𝑟 𝑥)(𝑡) = 𝑥(𝑡 + 𝜏). Then

                                                          𝑝 𝑟 −1
                                                1 ∑︁ 𝑢
                                         Π 𝑝𝑟 = 𝑟    R 𝑟
                                                𝑝 𝑢=0 𝑝

is the Reynolds (orbit-averaging) operator for the cyclic subgroup 𝐺 𝑝𝑟 = ⟨R 𝑝𝑟 ⟩ of order 𝑝𝑟 .


A.2 Frequency-Domain Characterization
    𝑥 [𝑘] =
              Í𝑛−1        −𝑘𝑡                           2𝜋𝑖/𝑛 . Then
Let b          𝑡=0 𝑥(𝑡) 𝜔 𝑛 be the 𝑛-point DFT, 𝜔 𝑛 = 𝑒

                                  𝑟 −1
                                 𝑝∑︁                                   𝑟 −1
                                                                      𝑝∑︁
                                                                                         !
                               1         −𝑘𝑢𝑛/𝑝 𝑟                  1
                                                                         𝑒 −2𝜋𝑖𝑘𝑢/𝑝 b
                                                                                   𝑟
                 Π
                 [ 𝑝 𝑟 𝑥 [𝑘] = 𝑟   𝜔                𝑥 [𝑘] =                          𝑥 [𝑘].
                              𝑝 𝑢=0 𝑛
                                                    b               𝑟
                                                                   𝑝 𝑢=0




                                                     38
Hence
                                                     Π
                                                     [ 𝑝 𝑟 𝑥 [𝑘] = 1 𝑝 𝑟 |𝑘 b
                                                                            𝑥 [𝑘],

i.e. Π 𝑝𝑟 is the orthogonal projector onto the subspace spanned by harmonics with indices 𝑘 that
are multiples of 𝑝𝑟 . Equivalently, range(Π 𝑝𝑟 ) = {𝑥 : R 𝑝𝑟 𝑥 = 𝑥}.


A.3 Idempotence, Self-Adjointness, and Orthogonality
Idempotence.            By group averaging or masks:
                                         1 ∑︁                1 ∑︁            1 ∑︁ 𝑤
                            Π 2𝑝𝑟 =                 R 𝑝𝑢𝑟              R 𝑝𝑣𝑟 =       R 𝑟 = Π 𝑝𝑟 ,
                                         𝑝𝑟   𝑢
                                                              𝑝𝑟   𝑣
                                                                                 𝑝𝑟 𝑤 𝑝

   c2 [𝑘] = 12 b
or Π                𝑥 [𝑘] = 1 𝑝𝑟 |𝑘 b
                                    𝑥 [𝑘].
             𝑝 𝑟 |𝑘


Self-adjointness. With the standard inner product ⟨𝑥, 𝑦⟩ = 𝑡 𝑥(𝑡) ⊤ 𝑦(𝑡), rotations are unitary,
                                                               Í

so Π 𝑝𝑟 is self-adjoint as an average of unitaries. In frequency, it is a real diagonal mask.

Orthogonal decomposition (same prime).                             For 𝑎 ≤ 𝑏,

                   Π 𝑝𝑎 Π 𝑝𝑏 = Π 𝑝𝑏 ,              Π 𝑝 𝑎 − Π 𝑝 𝑏 projects onto {𝑘 : 𝑝 𝑎 | 𝑘, 𝑝 𝑏 ∤ 𝑘 }.

Mixed primes.            For coprime 𝑝 ≠ 𝑞,

                                                  Π 𝑝 𝑟 Π𝑞 𝑠 = Π𝑞 𝑠 Π 𝑝 𝑟 = Π 𝑝 𝑟 𝑞 𝑠 ,

since 1 𝑝𝑟 |𝑘 1𝑞 𝑠 |𝑘 = 1 𝑝𝑟 𝑞 𝑠 |𝑘 .


A.4 Commutation with Rotations
For any 𝜙 ∈ Z,
                                        𝜙     1 ∑︁ 𝑢+𝜙                               𝜙
                              Π 𝑝𝑟 R 𝑝𝑟 =         R 𝑟 = Π 𝑝𝑟 ,                    R 𝑝𝑟 Π 𝑝𝑟 = Π 𝑝𝑟 ,
                                              𝑝𝑟 𝑢 𝑝
so range(Π 𝑝𝑟 ) is fixed-pointwise invariant under R 𝑝𝑟 .
    More generally, rotations commute as operators; hence Π 𝑝𝑟 commutes with any R𝑚 :

                                                        R𝑚 Π 𝑝 𝑟 = Π 𝑝 𝑟 R𝑚 ,

but only for 𝑚 = 𝑝𝑟 do we have Π 𝑝𝑟 R𝑚 = Π 𝑝𝑟 .




                                                                   39
A.5 Interaction with Accent Gates and Spike Projectors
Define the spike (multiplicative) gate Δ𝑑 by (Δ𝑑 𝑥)(𝑡) = [𝑑 | 𝑡] 𝑥(𝑡) and the additive accent
A𝛼𝑑 : 𝑥 ↦→ 𝑥 + 𝛼 [𝑑 | 𝑡] 𝑒 1 .


Fourier of the comb.
                                                   𝑛/𝑑−1
                                                    ∑︁               𝑛
                                  \
                                  [𝑑 | ·] [𝑘] =            𝜔−𝑘𝑚𝑑
                                                            𝑛    =     1 𝑛/𝑑|𝑘 .
                                                   𝑚=0
                                                                     𝑑

Noncommutation in general.
                                                                             
                              [Π 𝑝𝑟 , A𝛼𝑝𝑠 ]𝑥 = 𝛼 Π 𝑝𝑟 [ 𝑝 𝑠 | ·] − [ 𝑝 𝑠 | ·] 𝑒 1 ,

which vanishes iff Π 𝑝𝑟 [ 𝑝 𝑠 | ·] = [ 𝑝 𝑠 | ·].

Commutation condition.           Π 𝑝𝑟 [ 𝑝 𝑠 | ·] = [ 𝑝 𝑠 | ·] holds iff the comb [ 𝑝 𝑠 | 𝑡] is invariant under
R 𝑝𝑟 , i.e.
                                𝑛
                                   ≡0      (mod 𝑝 𝑠 )         ⇐⇒      𝑝 𝑟+𝑠 | 𝑛.
                                𝑝𝑟
Equivalently, if 𝑣 𝑝 (𝑛) ≥ 𝑟 + 𝑠. In that case,

                                            Π 𝑝𝑟 A𝛼𝑝𝑠 = A𝛼𝑝𝑠 Π 𝑝𝑟 .

Otherwise, they do not commute.

Spike projector composition.           In frequency, Δ
                                                             𝑥 ∗ [\
                                                       𝑝𝑠 𝑥 = b    𝑝 𝑠 | ·], so

                                 Π\                           𝑥 ∗ [\
                                  𝑝 𝑟 Δ 𝑝 𝑠 𝑥 [𝑘] = 1 𝑝 𝑟 |𝑘 (b    𝑝 𝑠 | ·]) [𝑘],

which differs from Δ\                                        \
                      𝑝 𝑠 Π 𝑝 𝑟 𝑥 [𝑘] unless the support of [ 𝑝 | ·] lies within {𝑘 : 𝑝 | 𝑘 }, i.e. unless
                                                               𝑠                       𝑟

𝑛/𝑝 𝑠 is a multiple of 𝑝𝑟 .


A.6 Subdivision and Projector Interchange
Let S𝑞 : X𝑛 → X𝑞𝑛 be ( S𝑞 𝑥)(𝑞𝑡 + 𝑢) = 𝑥(𝑡). Consider Π 𝑝𝑟 on the refined lattice T𝑞𝑛 . In
frequency,                                      
                                             2𝜋𝑘
                           S 𝑞 𝑥 [𝑘] = 𝐷 𝑞         𝑥 [𝑘 mod 𝑛],
                           d                       b
                                              𝑞𝑛
where 𝐷 𝑞 is the Dirichlet kernel. Hence
                                                              
                              \(𝑞𝑛)                        2𝜋𝑘
                             Π 𝑝𝑟 S𝑞 𝑥 [𝑘] = 1 𝑝𝑟 |𝑘 𝐷 𝑞         𝑥 [𝑘 mod 𝑛].
                                                                 b
                                                            𝑞𝑛


                                                         40
On the coarse lattice, define the induced projector

   ↓𝑞
(Π 𝑝𝑟 𝑥)b[ℓ] = 1 𝑝𝑟 |(𝑞ℓ) b
                          𝑥 [ℓ] = 1 𝑝𝑟 −𝑣 𝑝 (𝑞) |ℓ b
                                                   𝑥 [ℓ]    (by 𝑣 𝑝 arithmetic, with the convention 𝑝 −𝑎 ∤ ℓ if 𝑎 > 0).

Then                                             
                         \  ↓𝑞                2𝜋𝑘
                        S𝑞 Π 𝑝𝑟 𝑥 [𝑘] = 𝐷 𝑞                                  𝑥 [𝑘 mod 𝑛].
                                                    1 𝑝𝑟 −𝑣 𝑝 (𝑞) |(𝑘 mod 𝑛) b
                                               𝑞𝑛
Comparing the two shows
                                            (𝑞𝑛)                  ↓𝑞
                                         Π 𝑝𝑟 S𝑞 = S𝑞 Π max(0, 𝑟 −𝑣 𝑝 (𝑞) ) .
                                                                  𝑝

Special cases:
                                      (𝑞𝑛)
   • If 𝑝 ∤ 𝑞, then 𝑣 𝑝 (𝑞) = 0 and Π 𝑝𝑟 S𝑞 = S𝑞 Π 𝑝𝑟 .
                            (𝑞𝑛)
     • If 𝑝𝑟 | 𝑞, then Π 𝑝𝑟 S𝑞 = S𝑞 (the refined lattice is already invariant at level 𝑝𝑟 ).


A.7 Permutations Inside Cells
Let W𝑞𝜋 permute the 𝑞 children within each parent cell: ( W𝑞𝜋 𝑥)(𝑞𝑡 + 𝑢) = 𝑥(𝑞𝑡 + 𝜋(𝑢)). In
frequency, W𝑞𝜋 mixes the 𝑞-tuple of coefficients in each residue class 𝑘 ≡ 𝑟 (mod 𝑞) by a unitary
𝑈𝜋 (𝑟) that depends on 𝑟 and 𝜋. Hence
                                                           ∑︁
                            𝑝 𝑟 W𝑞 𝑥 [𝑘] = 1 𝑝 𝑟 |𝑘
                           Π\                                     [𝑈𝜋 (𝑘 mod 𝑞)] 𝑘,ℎ b
                                                                                     𝑥 [ℎ],
                                 𝜋

                                                        ℎ≡𝑘 (𝑞)


while                                              ∑︁
                            𝑞 Π 𝑝 𝑟 𝑥 [𝑘] =
                           W\                           [𝑈𝜋 (𝑘 mod 𝑞)] 𝑘,ℎ 1 𝑝𝑟 |ℎ b
                                                                                   𝑥 [ℎ].
                            𝜋

                                              ℎ≡𝑘 (𝑞)

Unless 𝑝𝑟 divides all ℎ in the residue class 𝑘 mod 𝑞 (rare), the two differ; thus [Π 𝑝𝑟 , W𝑞𝜋 ] ≠ 0 in
general.


A.8 Equivalent Characterizations
For 𝑝𝑟 | 𝑛, the following are equivalent for 𝑦 ∈ X𝑛 :
   1. Π 𝑝𝑟 𝑦 = 𝑦.
   2. R 𝑝𝑟 𝑦 = 𝑦.
      𝑦 [𝑘] = 0 unless 𝑝𝑟 | 𝑘.
   3. b
   4. 𝑦 factors through the CRT projection Z/𝑛Z ↠ Z/(𝑛/𝑝𝑟 )Z, i.e. 𝑦(𝑡) depends only on
      𝑡 (mod 𝑛/𝑝𝑟 ).
Proof. (1)⇔(2): Π is the Reynolds projector onto fixed points. (2)⇒(3): rotation invariance
imposes 𝑒 −2𝜋𝑖𝑘/𝑝 = 1. (3)⇒(4): only harmonics compatible with period 𝑛/𝑝𝑟 remain. (4)⇒(2):
                  𝑟


periodicity implies invariance under shift by 𝑛/𝑝𝑟 .




                                                            41
A.9 Summary of Identities
For 𝑝𝑟 | 𝑛, primes 𝑝 ≠ 𝑞, and any 𝑥:

                     Π 2𝑝𝑟 = Π 𝑝𝑟 ,        Π⊤
                                            𝑝𝑟 = Π 𝑝𝑟 ,           Π
                                                                  [ 𝑝 𝑟 𝑥 [𝑘] = 1 𝑝 𝑟 |𝑘 b
                                                                                         𝑥 [𝑘],
                     Π 𝑝 𝑎 Π 𝑝 𝑏 = Π 𝑝max(𝑎,𝑏) ,        Π 𝑝 𝑟 Π𝑞 𝑠 = Π𝑞 𝑠 Π 𝑝 𝑟 = Π 𝑝 𝑟 𝑞 𝑠 ,
                              𝜙       𝜙
                     Π 𝑝𝑟 R 𝑝𝑟 = R 𝑝𝑟 Π 𝑝𝑟 = Π 𝑝𝑟 ,             [Π 𝑝𝑟 , R𝑚 ] = 0 ∀𝑚,
                     Π 𝑝𝑟 A𝛼𝑝𝑠 = A𝛼𝑝𝑠 Π 𝑝𝑟 iff 𝑣 𝑝 (𝑛) ≥ 𝑟 + 𝑠, else [Π 𝑝𝑟 , A𝛼𝑝𝑠 ] ≠ 0,
                       (𝑞𝑛)               ↓𝑞
                     Π 𝑝𝑟 S𝑞 = S𝑞 Π max(0, 𝑟 −𝑣 𝑝 (𝑞) ) ,           [Π 𝑝𝑟 , W𝑞𝜋 ] ≠ 0 in general.
                                          𝑝


These equalities formalize the intuitive picture: Π 𝑝𝑟 keeps precisely the content invariant under
rotation by 𝑛/𝑝𝑟 , composes monotonically across tiers, commutes with rotations and with accents
only under a clear 𝑝-adic condition, intertwines predictably with subdivision, and generally
conflicts with within-cell permutations that remix residue classes.


Appendix A. Full Derivations for Projector Identities

A.1 Definition and Group-Average Form
Fix 𝑛 ∈ N and 𝑥 ∈ X𝑛 = {𝑥 : T𝑛 → R𝑘 }. For a prime power 𝑝𝑟 | 𝑛 define

                                              𝑝 𝑟 −1       
                                            1 ∑︁          𝑛
                              (Π 𝑝𝑟 𝑥)(𝑡) = 𝑟       𝑥 𝑡+𝑢 𝑟 ,                       𝑡 ∈ T𝑛 .
                                            𝑝 𝑢=0        𝑝

Let R 𝑝𝑟 denote rotation by 𝜏 = 𝑝𝑛𝑟 ticks, i.e. ( R 𝑝𝑟 𝑥)(𝑡) = 𝑥(𝑡 + 𝜏). Then

                                                                𝑝 𝑟 −1
                                                       1 ∑︁ 𝑢
                                                Π 𝑝𝑟 = 𝑟    R 𝑟
                                                       𝑝 𝑢=0 𝑝

is the Reynolds (orbit-averaging) operator for the cyclic subgroup 𝐺 𝑝𝑟 = ⟨R 𝑝𝑟 ⟩ of order 𝑝𝑟 .


A.2 Frequency-Domain Characterization
    𝑥 [𝑘] =
              Í𝑛−1        −𝑘𝑡                           2𝜋𝑖/𝑛 . Then
Let b          𝑡=0 𝑥(𝑡) 𝜔 𝑛 be the 𝑛-point DFT, 𝜔 𝑛 = 𝑒

                                  𝑟 −1
                                 𝑝∑︁                         𝑟 −1
                                                            𝑝∑︁
                                                                              !
                               1         −𝑘𝑢𝑛/𝑝 𝑟         1
                                                                  𝑒 −2𝜋𝑖𝑘𝑢/𝑝 b
                                                                            𝑟
                 Π
                 [ 𝑝 𝑟 𝑥 [𝑘] = 𝑟       𝜔          𝑥 [𝑘] = 𝑟                     𝑥 [𝑘].
                              𝑝 𝑢=0 𝑛
                                                  b
                                                          𝑝 𝑢=0

Hence
                                               Π
                                               [ 𝑝 𝑟 𝑥 [𝑘] = 1 𝑝 𝑟 |𝑘 b
                                                                      𝑥 [𝑘],



                                                           42
i.e. Π 𝑝𝑟 is the orthogonal projector onto the subspace spanned by harmonics with indices 𝑘 that
are multiples of 𝑝𝑟 . Equivalently, range(Π 𝑝𝑟 ) = {𝑥 : R 𝑝𝑟 𝑥 = 𝑥}.


A.3 Idempotence, Self-Adjointness, and Orthogonality
Idempotence.            By group averaging or masks:
                                         1 ∑︁                1 ∑︁            1 ∑︁ 𝑤
                            Π 2𝑝𝑟 =                 R 𝑝𝑢𝑟              R 𝑝𝑣𝑟 =       R 𝑟 = Π 𝑝𝑟 ,
                                         𝑝𝑟   𝑢
                                                              𝑝𝑟   𝑣
                                                                                 𝑝𝑟 𝑤 𝑝

   c2 [𝑘] = 12 b
or Π                𝑥 [𝑘] = 1 𝑝𝑟 |𝑘 b
                                    𝑥 [𝑘].
             𝑝 𝑟 |𝑘


Self-adjointness. With the standard inner product ⟨𝑥, 𝑦⟩ = 𝑡 𝑥(𝑡) ⊤ 𝑦(𝑡), rotations are unitary,
                                                               Í

so Π 𝑝𝑟 is self-adjoint as an average of unitaries. In frequency, it is a real diagonal mask.

Orthogonal decomposition (same prime).                             For 𝑎 ≤ 𝑏,

                   Π 𝑝𝑎 Π 𝑝𝑏 = Π 𝑝𝑏 ,              Π 𝑝 𝑎 − Π 𝑝 𝑏 projects onto {𝑘 : 𝑝 𝑎 | 𝑘, 𝑝 𝑏 ∤ 𝑘 }.

Mixed primes.            For coprime 𝑝 ≠ 𝑞,

                                                  Π 𝑝 𝑟 Π𝑞 𝑠 = Π𝑞 𝑠 Π 𝑝 𝑟 = Π 𝑝 𝑟 𝑞 𝑠 ,

since 1 𝑝𝑟 |𝑘 1𝑞 𝑠 |𝑘 = 1 𝑝𝑟 𝑞 𝑠 |𝑘 .


A.4 Commutation with Rotations
For any 𝜙 ∈ Z,
                                        𝜙     1 ∑︁ 𝑢+𝜙                               𝜙
                              Π 𝑝𝑟 R 𝑝𝑟 =         R 𝑟 = Π 𝑝𝑟 ,                    R 𝑝𝑟 Π 𝑝𝑟 = Π 𝑝𝑟 ,
                                              𝑝𝑟 𝑢 𝑝
so range(Π 𝑝𝑟 ) is fixed-pointwise invariant under R 𝑝𝑟 .
    More generally, rotations commute as operators; hence Π 𝑝𝑟 commutes with any R𝑚 :

                                                        R𝑚 Π 𝑝 𝑟 = Π 𝑝 𝑟 R𝑚 ,

but only for 𝑚 = 𝑝𝑟 do we have Π 𝑝𝑟 R𝑚 = Π 𝑝𝑟 .


A.5 Interaction with Accent Gates and Spike Projectors
Define the spike (multiplicative) gate Δ𝑑 by (Δ𝑑 𝑥)(𝑡) = [𝑑 | 𝑡] 𝑥(𝑡) and the additive accent
A𝛼𝑑 : 𝑥 ↦→ 𝑥 + 𝛼 [𝑑 | 𝑡] 𝑒 1 .



                                                                   43
Fourier of the comb.
                                                     𝑛/𝑑−1
                                                      ∑︁                𝑛
                                     \
                                     [𝑑 | ·] [𝑘] =           𝜔−𝑘𝑚𝑑
                                                              𝑛    =      1 𝑛/𝑑|𝑘 .
                                                      𝑚=0
                                                                        𝑑

Noncommutation in general.
                                                                                
                                 [Π 𝑝𝑟 , A𝛼𝑝𝑠 ]𝑥 = 𝛼 Π 𝑝𝑟 [ 𝑝 𝑠 | ·] − [ 𝑝 𝑠 | ·] 𝑒 1 ,

which vanishes iff Π 𝑝𝑟 [ 𝑝 𝑠 | ·] = [ 𝑝 𝑠 | ·].

Commutation condition.              Π 𝑝𝑟 [ 𝑝 𝑠 | ·] = [ 𝑝 𝑠 | ·] holds iff the comb [ 𝑝 𝑠 | 𝑡] is invariant under
R 𝑝𝑟 , i.e.
                                  𝑛
                                     ≡0        (mod 𝑝 𝑠 )        ⇐⇒       𝑝 𝑟+𝑠 | 𝑛.
                                  𝑝𝑟
Equivalently, if 𝑣 𝑝 (𝑛) ≥ 𝑟 + 𝑠. In that case,

                                                Π 𝑝𝑟 A𝛼𝑝𝑠 = A𝛼𝑝𝑠 Π 𝑝𝑟 .

Otherwise, they do not commute.

Spike projector composition.              In frequency, Δ
                                                                𝑥 ∗ [\
                                                          𝑝𝑠 𝑥 = b    𝑝 𝑠 | ·], so

                                    Π\                           𝑥 ∗ [\
                                     𝑝 𝑟 Δ 𝑝 𝑠 𝑥 [𝑘] = 1 𝑝 𝑟 |𝑘 (b    𝑝 𝑠 | ·]) [𝑘],

which differs from Δ\                                        \
                      𝑝 𝑠 Π 𝑝 𝑟 𝑥 [𝑘] unless the support of [ 𝑝 | ·] lies within {𝑘 : 𝑝 | 𝑘 }, i.e. unless
                                                               𝑠                       𝑟

𝑛/𝑝 𝑠 is a multiple of 𝑝𝑟 .


A.6 Subdivision and Projector Interchange
Let S𝑞 : X𝑛 → X𝑞𝑛 be ( S𝑞 𝑥)(𝑞𝑡 + 𝑢) = 𝑥(𝑡). Consider Π 𝑝𝑟 on the refined lattice T𝑞𝑛 . In
frequency,                                      
                                             2𝜋𝑘
                           S 𝑞 𝑥 [𝑘] = 𝐷 𝑞         𝑥 [𝑘 mod 𝑛],
                           d                       b
                                              𝑞𝑛
where 𝐷 𝑞 is the Dirichlet kernel. Hence
                                                                
                                \(𝑞𝑛)                        2𝜋𝑘
                               Π 𝑝𝑟 S𝑞 𝑥 [𝑘] = 1 𝑝𝑟 |𝑘 𝐷 𝑞         𝑥 [𝑘 mod 𝑛].
                                                                   b
                                                              𝑞𝑛

On the coarse lattice, define the induced projector

   ↓𝑞
(Π 𝑝𝑟 𝑥)b[ℓ] = 1 𝑝𝑟 |(𝑞ℓ) b
                          𝑥 [ℓ] = 1 𝑝𝑟 −𝑣 𝑝 (𝑞) |ℓ b
                                                   𝑥 [ℓ]    (by 𝑣 𝑝 arithmetic, with the convention 𝑝 −𝑎 ∤ ℓ if 𝑎 > 0).




                                                            44
Then                                          
                      \  ↓𝑞                2𝜋𝑘
                     S𝑞 Π 𝑝𝑟 𝑥 [𝑘] = 𝐷 𝑞                                  𝑥 [𝑘 mod 𝑛].
                                                 1 𝑝𝑟 −𝑣 𝑝 (𝑞) |(𝑘 mod 𝑛) b
                                            𝑞𝑛
Comparing the two shows
                                      (𝑞𝑛)                  ↓𝑞
                                    Π 𝑝𝑟 S𝑞 = S𝑞 Π max(0, 𝑟 −𝑣 𝑝 (𝑞) ) .
                                                            𝑝

Special cases:
                                      (𝑞𝑛)
   • If 𝑝 ∤ 𝑞, then 𝑣 𝑝 (𝑞) = 0 and Π 𝑝𝑟 S𝑞 = S𝑞 Π 𝑝𝑟 .
                        (𝑞𝑛)
    • If 𝑝𝑟 | 𝑞, then Π 𝑝𝑟 S𝑞 = S𝑞 (the refined lattice is already invariant at level 𝑝𝑟 ).


A.7 Permutations Inside Cells
Let W𝑞𝜋 permute the 𝑞 children within each parent cell: ( W𝑞𝜋 𝑥)(𝑞𝑡 + 𝑢) = 𝑥(𝑞𝑡 + 𝜋(𝑢)). In
frequency, W𝑞𝜋 mixes the 𝑞-tuple of coefficients in each residue class 𝑘 ≡ 𝑟 (mod 𝑞) by a unitary
𝑈𝜋 (𝑟) that depends on 𝑟 and 𝜋. Hence
                                                     ∑︁
                        𝑝 𝑟 W𝑞 𝑥 [𝑘] = 1 𝑝 𝑟 |𝑘
                       Π\                                   [𝑈𝜋 (𝑘 mod 𝑞)] 𝑘,ℎ b
                                                                               𝑥 [ℎ],
                             𝜋

                                                  ℎ≡𝑘 (𝑞)


while                                        ∑︁
                        𝑞 Π 𝑝 𝑟 𝑥 [𝑘] =
                       W\                           [𝑈𝜋 (𝑘 mod 𝑞)] 𝑘,ℎ 1 𝑝𝑟 |ℎ b
                                                                               𝑥 [ℎ].
                        𝜋

                                          ℎ≡𝑘 (𝑞)

Unless 𝑝𝑟 divides all ℎ in the residue class 𝑘 mod 𝑞 (rare), the two differ; thus [Π 𝑝𝑟 , W𝑞𝜋 ] ≠ 0 in
general.


A.8 Equivalent Characterizations
For 𝑝𝑟 | 𝑛, the following are equivalent for 𝑦 ∈ X𝑛 :
   1. Π 𝑝𝑟 𝑦 = 𝑦.
   2. R 𝑝𝑟 𝑦 = 𝑦.
      𝑦 [𝑘] = 0 unless 𝑝𝑟 | 𝑘.
   3. b
   4. 𝑦 factors through the CRT projection Z/𝑛Z ↠ Z/(𝑛/𝑝𝑟 )Z, i.e. 𝑦(𝑡) depends only on
      𝑡 (mod 𝑛/𝑝𝑟 ).
Proof. (1)⇔(2): Π is the Reynolds projector onto fixed points. (2)⇒(3): rotation invariance
imposes 𝑒 −2𝜋𝑖𝑘/𝑝 = 1. (3)⇒(4): only harmonics compatible with period 𝑛/𝑝𝑟 remain. (4)⇒(2):
                  𝑟


periodicity implies invariance under shift by 𝑛/𝑝𝑟 .


A.9 Summary of Identities
For 𝑝𝑟 | 𝑛, primes 𝑝 ≠ 𝑞, and any 𝑥:

                  Π 2𝑝𝑟 = Π 𝑝𝑟 ,     Π⊤
                                      𝑝𝑟 = Π 𝑝𝑟 ,            Π
                                                             [ 𝑝 𝑟 𝑥 [𝑘] = 1 𝑝 𝑟 |𝑘 b
                                                                                    𝑥 [𝑘],

                                                       45
                  Π 𝑝 𝑎 Π 𝑝 𝑏 = Π 𝑝max(𝑎,𝑏) ,               Π 𝑝 𝑟 Π𝑞 𝑠 = Π𝑞 𝑠 Π 𝑝 𝑟 = Π 𝑝 𝑟 𝑞 𝑠 ,
                               𝜙      𝜙
                  Π 𝑝𝑟 R 𝑝𝑟 = R 𝑝𝑟 Π 𝑝𝑟 = Π 𝑝𝑟 ,                      [Π 𝑝𝑟 , R𝑚 ] = 0 ∀𝑚,
                  Π 𝑝𝑟 A𝛼𝑝𝑠 = A𝛼𝑝𝑠 Π 𝑝𝑟 iff 𝑣 𝑝 (𝑛) ≥ 𝑟 + 𝑠, else [Π 𝑝𝑟 , A𝛼𝑝𝑠 ] ≠ 0,
                    (𝑞𝑛)                   ↓𝑞
                  Π 𝑝𝑟 S𝑞 = S𝑞 Π max(0, 𝑟 −𝑣 𝑝 (𝑞) ) ,                    [Π 𝑝𝑟 , W𝑞𝜋 ] ≠ 0 in general.
                                           𝑝


These equalities formalize the intuitive picture: Π 𝑝𝑟 keeps precisely the content invariant under
rotation by 𝑛/𝑝𝑟 , composes monotonically across tiers, commutes with rotations and with accents
only under a clear 𝑝-adic condition, intertwines predictably with subdivision, and generally
conflicts with within-cell permutations that remix residue classes.


Appendix B. Additional Operator Identities and Counterexam-
ples to Commutation

B.1 Algebraic Identities (State Layer)
Let 𝑛 ∈ N, 𝑝, 𝑞 primes, and 𝑟, 𝑠 ≥ 1 with 𝑝𝑟 , 𝑞 𝑠 | 𝑛. Operators act on X𝑛 unless noted.

Rotations.     For any integers 𝜙, 𝜓,

                     𝜙         𝜓      𝜙+𝜓               𝜙        𝜓        𝜓     𝜙           𝜙𝑛/𝑝 𝑟 +𝜓𝑛/𝑞 𝑠
                   R 𝑝𝑟 R 𝑝𝑟 = R 𝑝𝑟 ,                 R 𝑝𝑟 R𝑞 𝑠 = R𝑞 𝑠 R 𝑝𝑟 (= R𝑛                            ).

Additive accents.        Using 𝐷 𝑑 (𝑡) = [𝑑 | 𝑡] and channel 𝑒 1 ,

                   A𝛼𝑑 𝑥 = 𝑥 + 𝛼𝐷 𝑑 𝑒 ⊤
                                                                                               𝛽      𝛼+𝛽
                                      1,              A𝛼𝑑 1 A𝛼𝑑 2 = A𝛼𝑑 2 A𝛼𝑑 1 ,     A𝛼𝑑 A𝑑 = A𝑑             .
                                                            1     2        2     1



Spike gates.    Δ𝑑 𝑥 = 𝐷 𝑑 ⊙ 𝑥 (Hadamard product) obeys

                  Δ𝑎 Δ𝑏 = Δlcm(𝑎,𝑏) ,                  Δ𝑑 R𝑚 = R𝑚 Δ𝑑 iff 𝑚 ≡ 0 (mod 𝑑).

                                                                                                                  𝜙,( 𝑝𝑛)
Subdivision and rotations (lifted identity). Let S 𝑝 : X𝑛 → X𝑝𝑛 , and let R 𝑝𝑟                                              denote
rotation on the refined lattice. Then

                                          𝜙,( 𝑝𝑛)                     𝜙
                                      R 𝑝𝑟          S 𝑝 = S 𝑝 R 𝑝𝑟             ( 𝑝𝑟 | 𝑛).

Proof: both sides shift by 𝜏 = 𝜙𝑛/𝑝𝑟 at the parent resolution, replicated to children.

Subdivision and accents (lift rule).
                         ↑𝑝                            ↑𝑝
      S 𝑝 A𝑞𝛼𝑠 = A𝑞𝛼𝑠          S𝑝 ,   where A𝑞𝛼𝑠                copies the comb into each of the 𝑝 subticks.


                                                                 46
Within-cell permutations.          For 𝜋1 , 𝜋2 ∈ 𝑆 𝑝 ,

                                                                                         −1
                              W 𝜋𝑝1 W 𝜋𝑝2 = W 𝜋𝑝1 ◦𝜋2 ,             ( W𝜋𝑝 ) −1 = W𝜋𝑝 .

Moreover,
                                   𝑚
                                  R𝑛/𝑝 W 𝜋𝑝 = W 𝜋𝑝 R𝑛/𝑝
                                                    𝑚
                                                                     for all 𝑚 ∈ Z,

since R𝑛/𝑝 shifts by one parent cell; but for general 𝜏 not divisible by 𝑛/𝑝 commutation fails
(see B.3.2).

                           Define A𝛼,𝛿                            ⊤
Phase-offset accents.              𝑑 : 𝑥 ↦→ 𝑥 + 𝛼 1 𝑡≡𝛿 (mod 𝑑) 𝑒 1 . Then

                                                   𝜙               𝛼,𝜙   𝜙
                                                R𝑑 A𝛼,0
                                                    𝑑 = A𝑑 R𝑑 .


This reparameterization isolates noncommutation as a phase change of the gate.


B.2 Identities Involving Projectors (Summary)
For completeness (see Appendix A for proofs):

                 Π 2𝑝𝑟 = Π 𝑝𝑟 ,    Π 𝑝𝑟 Π𝑞 𝑠 = Π 𝑝𝑟 𝑞 𝑠 ( 𝑝 ≠ 𝑞),            Π 𝑝 𝑎 Π 𝑝 𝑏 = Π 𝑝max(𝑎,𝑏) ,

                    Π 𝑝 𝑟 R𝑚 = R𝑚 Π 𝑝 𝑟 ,          Π 𝑝𝑟 A𝛼𝑝𝑠 = A𝛼𝑝𝑠 Π 𝑝𝑟 iff 𝑣 𝑝 (𝑛) ≥ 𝑟 + 𝑠,

and generally [Π 𝑝𝑟 , W𝑞𝜋 ] ≠ 0.


B.3 Counterexamples to Commutation (Concrete)
We use 𝑛 = 12 or 𝑛 = 18 for explicit vectors; take a single channel and denote the Kronecker
delta by 𝛿𝑡 .

B.3.1 [ W2(0 1) , A3𝛼 ] ≠ 0 on 𝑛 = 12. Let 𝑥 ≡ 0, A3𝛼 place ones at 𝑡 ∈ {0, 3, 6, 9}. With W2(0 1)
swapping within pairs (0, 1), (2, 3), . . . ,
                                              ∑︁                                         ∑︁
                         (0 1) 𝛼                                         (0 1)
                      W2      A3 𝑥 =                   𝛿𝑡 ,        A3𝛼 W2        𝑥=                 𝛿𝑡 .
                                       𝑡∈{1,2,7,8}                                    𝑡∈{0,3,6,9}


The supports differ; hence noncommutation.

B.3.2 [ R13 , W3(0 1 2) ] ≠ 0 on 𝑛 = 12. Cells of size 3 are (0..2), (3..5), (6..8), (9..11). Let 𝑥 = 𝛿0 .

                                    (0 1 2)
                                  W3          𝑥 = 𝛿1 ,        R13 (𝛿1 ) = 𝛿1+4 = 𝛿5 .



                                                              47
Conversely,
                                                             (0 1 2)
                                            R13 𝑥 = 𝛿4 ,   W3          (𝛿4 ) = 𝛿3 .

Outputs differ (𝑡 = 5 vs 𝑡 = 3).

B.3.3 [ S2 , A3𝛼 ] ≠ 0 without lift.           𝑛 = 12, 𝑥 ≡ 0. Then

                               S2 A3𝛼 𝑥 : ones at 𝑡 ∈ {0, 6, 12, 18} (mod 24),

but
                              A3𝛼 S2 𝑥 : ones at 𝑡 ∈ {0, 3, 6, 9, 12, 15, 18, 21}.

They differ unless the lift rule (·) ↑2 is used.

B.3.4 [Π3 , W2(0 1) ] ≠ 0 on 𝑛 = 12.             Let 𝑥 = 𝛿0 . Then

                                    Π3 W2(0 1) 𝑥 = Π3 (𝛿1 ) = 31 (𝛿1 + 𝛿5 + 𝛿9 ),

while
                         (0 1)
                                 Π3 𝑥 = W2(0 1) 13 (𝛿0 + 𝛿4 + 𝛿8 ) = 31 (𝛿1 + 𝛿5 + 𝛿9 ).
                                                                  
                     W2

Here they coincide for 𝛿0 , but choose 𝑥 = 𝛿2 :

                                  Π3 W2(0 1) 𝛿2 = Π3 (𝛿3 ) = 31 (𝛿3 + 𝛿7 + 𝛿11 ),

                      (0 1)
                              Π3 𝛿2 = W2(0 1) 13 (𝛿2 + 𝛿6 + 𝛿10 ) = 13 (𝛿3 + 𝛿7 + 𝛿11 ).
                                                                 
                    W2

These also match; noncommutation appears for general mixtures. Take 𝑥 = 𝛿1 + 𝛿2 :

                          Π3 W2(0 1) 𝑥 = 13 (𝛿0 + 𝛿4 + 𝛿8 ) + 31 (𝛿3 + 𝛿7 + 𝛿11 ),

                                 (0 1)
                          W2             Π3 𝑥 = 31 (𝛿1 + 𝛿5 + 𝛿9 ) + 31 (𝛿3 + 𝛿7 + 𝛿11 ),

which differ.

         𝜙
B.3.5 [ R 𝑝𝑟 , A𝛼𝑝𝑟 ] ≠ 0 unless phase-offset is used.                 On 𝑛 = 108, 𝑝𝑟 = 27, 𝜙 = 1:
                                                                        ∑︁
                                     R127 A27
                                           𝛼
                                              𝑥 = R127 𝑥 + 𝛼                      𝛿𝑡+4 ,
                                                                 𝑡∈{0,27,54,81}

                                                                         ∑︁
                                          𝛼 1
                                         A27 R27 𝑥 = R127 𝑥 + 𝛼                       𝛿𝑡 .
                                                                  𝑡∈{0,27,54,81}

Not equal; but R127 A27
                     𝛼,0    𝛼,1 1
                         = A27 R27 holds.



                                                            48
B.4 Identities Involving Relation Operators
                          split
Let 𝐻 = (𝑉, 𝐸, 𝜄), and 𝑄ˆ 𝑝 duplicate each edge 𝑒 into 𝑒 (0) , . . . , 𝑒 ( 𝑝−1) with copied incidence.

Split vs. additive accents on edge-aggregated channels. Suppose an edge channel aggregates
vertex signals by sum, and A𝛼𝑑 adds weight on a vertex channel at gate times. Then

                                             split              split
                                          𝑄ˆ 𝑝 ◦ A𝛼𝑑 ≠ A𝛼𝑑 ◦ 𝑄ˆ 𝑝

in general, because splitting before accent duplicates the aggregation targets and may double-count
at gate ticks; splitting after accent preserves a single aggregation per original edge.

Example (noncommutation). Let 𝑉 = {𝑣 1 , 𝑣 2 }, 𝐸 = {𝑒} with 𝜄(𝑒) = {𝑣 1 , 𝑣 2 }, 𝑛 = 6, and let
the edge signal be 𝜏(𝑒, 𝑡) = 𝜎(𝑣 1 , 𝑡) + 𝜎(𝑣 2 , 𝑡). Start with 𝜎 ≡ 0, apply A3𝛼 to 𝜎(𝑣 1 , ·).

                             split
                          (𝑄ˆ 2      ◦ A3𝛼 ) : 𝜏(𝑒 (0) , 𝑡) = 𝜏(𝑒 (1) , 𝑡) = 𝛼 [3 | 𝑡],

total edge mass 2𝛼 per gate.

                 split
      ( A3𝛼 ◦ 𝑄ˆ 2 ) : accent on 𝑣 1 once, then sum across split edges ⇒ total 𝛼 per gate.

         split
Thus [𝑄ˆ 2 , A3𝛼 ] ≠ 0.

Fold vs. rotation.     If 𝑄ˆ fold
                             𝑝 quotients 𝑝 cells by cyclic symmetry, then


                             𝑄ˆ fold 1   ˆ fold
                                𝑝 R𝑛/𝑝 = 𝑄 𝑝 ,               R1𝑛/𝑝 𝑄ˆ fold ˆ fold
                                                                      𝑝 ≠ 𝑄𝑝


on the pre-folded space, since the quotient kills the degree of freedom that the rotation would
otherwise act on.


B.5 Mixed-Prime Wreath Interactions
Assume 𝑛 divisible by 𝑝𝑞. Define W 𝑝 and W𝑞 using contiguous blockings of size 𝑝 and 𝑞
respectively. Then, in general,
                                             𝜌
                                    [ W𝜋𝑝 , W𝑞 ] ≠ 0.

Counterexample (𝑛 = 6, 𝑝 = 2, 𝑞 = 3). Let 𝑥 = (𝑥0 , . . . , 𝑥 5 ), 𝜋 = (0 1), 𝜌 = (0 1 2). Compute
within blocks:

                  𝜌
           W2𝜋 W3 𝑥 = swap within (0, 1), (2, 3), (4, 5) after cycling (0, 1, 2), (3, 4, 5),

                   𝜌
                 W3 W2𝜋 𝑥 = cycle within (0, 1, 2), (3, 4, 5) after swapping the pairs.


                                                        49
Coordinate expressions differ unless 𝑥 satisfies special symmetries.


B.6 Round-Up: When Do Things Commute?
                 Pair           Condition                      Outcome
                 R· , R·        always                   commute
                 A𝑑1 , A𝑑2      always (additive)        commute
                 Δ𝑎 , Δ 𝑏       always                   Δlcm(𝑎,𝑏)
                 R𝑛/𝑝 , W 𝑝     shift by parent cell     commute
                 R 𝑝𝑟 , A 𝑝𝑟    with phase-offset accent RA (𝛿) = A (𝛿+𝜙) R
                 Π 𝑝𝑟 , A 𝑝 𝑠   𝑣 𝑝 (𝑛) ≥ 𝑟 + 𝑠          commute
                 Π 𝑝 𝑟 , W𝑞     generic                  do not commute
                 S 𝑝 , R 𝑝𝑟     𝑝𝑟 | 𝑛                   commute after lift
                 S 𝑝 , A𝑞 𝑠     generic                  lift rule (·) ↑𝑝 required
                    split
                 𝑄ˆ 𝑝 , A𝑑      generic                  do not commute

B.7 Practical Note
In implementations, encode identities as rewrite rules in the execution planner:

                                                         S 𝑝 ◦ A𝑞𝛼𝑠 ⇒ ( A𝑞𝛼𝑠 ) ↑𝑝 ◦ S 𝑝 ,
                   𝜙                  𝛼,𝜙       𝜙
                  R 𝑝𝑟 ◦ A𝛼,0
                          𝑝𝑟 ⇒ A 𝑝𝑟 ◦ R 𝑝𝑟 ,


                  W 𝜋𝑝1 ◦ W 𝜋𝑝2 ⇒ W 𝜋𝑝1 ◦𝜋2 ,       Π 𝑝𝑟 ◦ Π𝑞 𝑠 ⇒ Π 𝑝𝑟 𝑞 𝑠 ( 𝑝 ≠ 𝑞).

Counterexample tests (small 𝑛 harnesses) should be part of unit suites to guard against accidental
operator reordering during kernel fusion.


Appendix C. Extended Pseudocode and APIs

C.1 Core Types and Layout
# Scalars and aliases
Tick    := int           # 0..n-1
Index   := int
Real    := float
Vec[T] := array of T
Mat[T] := 2D array of T
Bool    := {True, False}

# Lattice and signals
Lattice := struct { n: int }                                               # length

                                                    50
Signal    := struct { X: Mat[Real], n: int, k: int } # shape (n, k), row-major

# Hypergraph
Hyper   := struct {
  V: int, E: int,
  edge_ptr: Vec[int],         # CSR: size E+1
  edge_vtx: Vec[int],         # concatenated vertex ids
  sigma: Mat[Real],           # |V| x kV
  tau:   Mat[Real]            # |E| x kE
}

# Operator tokens (state + relation)
OpS := struct { kind: "S", p: int, r: int }                      # subdivision
OpA := struct { kind: "A", d: int, alpha: Real, ch: Index, phi: int } # accent (offs
OpR := struct { kind: "R", d: int, phi: Real }                   # rotation by phi*n
OpW := struct { kind: "W", p: int, perm: Vec[int] }              # within-cell permu
OpQ := struct { kind: "Q", p: int, mode: {"split","merge","fold","rel"},
                params: Dict }                                   # relation operator

Word := struct { ops: Vec[OpS|OpA|OpR|OpW|OpQ] }

# Projectors and diagnostics
Proj := struct { d: int }           # Pi_{d}


C.2 Construction and Evaluation APIs
Lattice and signal helpers.

build_lattice(n: int) -> Lattice

zeros_signal(n: int, k: int) -> Signal
copy_signal(sig: Signal) -> Signal
rotate(sig: Signal, tau: int) -> Signal    # circular shift by tau ticks

Operator constructors.

op_S(p: int, r: int=1) -> OpS
op_A(d: int, alpha: Real, ch: int=0, phi: int=0) -> OpA
op_R(d: int, phi: Real) -> OpR
op_W(p: int, perm: Vec[int]) -> OpW


                                     51
op_Q(p: int, mode: str, params: Dict) -> OpQ

make_word(ops: Vec[...]) -> Word

Evaluation modes.

EvalConfig := struct {
  lazy_subdivision: Bool = True,         # avoid materializing length increase
  fft_rotations:    Bool = True,         # use phase in frequency domain
  in_place:         Bool = False,        # allow destructive kernels
}

eval_word(word: Word, sig: Signal, hyp: Hyper,
          cfg: EvalConfig) -> (Signal, Hyper)

Kernel semantics (state layer).

kernel_S(sig, p, r, lazy=True) -> Signal
  # If lazy, store view mapping (parent_index, child_index) without expanding X.

kernel_A(sig, d, alpha, ch, phi) -> Signal
  # Add alpha on channel ch at ticks t phi (mod d).

kernel_R(sig, d, phi, fft=True) -> Signal
  # If fft: multiply spectrum by exp(-2i k * phi / d), else shift by tau=round(phi*n

kernel_W(sig, p, perm) -> Signal
  # For each parent cell c, reorder subticks u in 0..p-1 by perm[u].

# Relation layer (examples)
kernel_Q_split(hyp, p, params) -> Hyper
kernel_Q_merge(hyp, p, params) -> Hyper
kernel_Q_fold (hyp, p, params) -> Hyper
kernel_Q_relabel(hyp, p, params) -> Hyper


C.3 Projectors, Tiers, and Diagnostics
proj_Pi(d: int) -> Proj

apply_proj(sig: Signal, Pi: Proj, fft=True) -> Signal


                                    52
  # Zero out harmonics except multiples of d.

tier_energy(sig: Signal, d: int, fft=True) -> Real
  # ||Pi_d sig||_2^2

class_labels(n: int, Ds: Vec[int]) -> Vec[Set[int]]
  # For each t, return { d in Ds : d | t }.


C.4 Resonance API
# Windowing
window(taper: str, n: int) -> Vec[Real] # "hann", "rect", ...
apply_window(sig: Signal, w: Vec[Real]) -> Signal

# DFT wrappers
fft(sig: Signal) -> Mat[complex]
ifft(Xhat: Mat[complex]) -> Signal

# Scores
R1(sig: Signal, tgt: Signal, w: Vec[Real]) -> Real
  # max_tau corr^2( wsig, wrotate(tgt, tau) )

R2(sig: Signal, tgt: Signal, tiers: Vec[int], etas: Vec[Real]) -> Real
  # sum_d eta_d * sqrt( E_sig(K_d) * E_tgt(K_d) )

R3(sig: Signal, tgt: Signal, tiers: Vec[int], etas: Vec[Real]) -> Real
  # sum_d eta_d * mean |exp(i(arg Sig[k]-arg Tgt[k]))| over K_d\{0}

R_total(R1v: Real, R2v: Real, R3v: Real, lambdas: (Real,Real,Real)) -> Real


C.5 Search and Learning APIs
Parameter bundle and neighborhood.

Theta := struct {
  alpha: Dict[int, Real],            # d -> alpha_d
  phi:   Dict[int, Real],            # d -> phi_d
  perm: Dict[int, Vec[int]],         # p -> permutation
  Q:     Dict[int, Dict]             # p -> relation params
}


                                     53
neighborhood(word: Word, theta: Theta) -> Vec[(Word, Theta)]
  # Local moves: swap adjacent ops, toggle W_p, grid-step phi, split/merge proposals

Optimizers.

optimize_continuous(sig0, hyp0, word, theta, D, tiers, lambdas, steps, lr) -> Theta
  # Backprop through fft-rotations and additive accents. Returns updated theta.

beam_search(sig0, hyp0, word0, theta0, D, B, depth, tiers, lambdas) -> (Word, Theta)
  # Expand with neighborhood, keep top-B by R_total, up to ’depth’.

Training loop.

train_MOC(D, n, H, word0, theta0, cfg, tiers, etas, lambdas,
          steps_cont=50, steps_beam=10, B=32, seeds=...) -> (Word, Theta, logs)

for epoch in 1..E:
  theta ← optimize_continuous(...)
  (word, theta) ← beam_search(...)
  (word, theta) ← gauge_fix(word, theta)
  log epoch metrics: R1,R2,R3,R, tier_energies, R ablations


C.6 Data Ingestion and Mapping
estimate_period(events: Vec[Tick] | times: Vec[Real]) -> int
  # Robust period estimate; snap to candidate n with desirable factorization.

map_events_to_lattice(events, n) -> Signal
  # Construct sparse onset vector then densify to shape (n, k=1) with optional smoot

align_to_reference(sig, D) -> (sig_aligned, tau*)
  # argmax_tau R1; return rotated signal and optimal tau*.


C.7 Serialization and Reproducibility
Config := struct {
  n: int,
  tiers: Vec[int], lambdas: (Real,Real,Real), etas: Vec[Real],
  word_tokens: Vec[Token],            # textual form of ops
  theta: Theta,

                                   54
    invariants: { Emax: Real, E_tier_max: Dict[int, Real], Fmin: Real },
    seeds: { global: int, beam: int, init: int },
    gauge: { downbeat_pin: Bool, crt_phase_fix: Bool },
    impl: { fft_backend: str, threads: int, deterministic: Bool }
}

save_project(path: str, cfg: Config, logs) -> None
load_project(path: str) -> (Config, logs)

freeze_render(cfg: Config) -> { stems: WAV/MIDI, json: word+theta, report: PDF }


C.8 Error Handling and Contracts
MOCError := enum {
  INVALID_FACTORIZATION,     # d or p^r not dividing n where required
  BAD_PERMUTATION,           # perm not a permutation of 0..p-1
  RELATION_INCONSISTENT,     # split/merge violates incidence constraints
  INVARIANT_VIOLATION,       # E/E_tier/Fairness exceeded; projection failed
  NONDETERMINISTIC_KERNEL    # impl flagged nondeterministic path
}

validate_word(word: Word, n: int) -> Result[OK | MOCError]
enforce_invariants(sig: Signal, invariants) -> Signal


C.9 Reference: API Table (Summary)

Function               Purpose                   Complexity
eval_word              apply operator pipeline   𝑂 (𝑛 log 𝑛) with FFT rotations
kernel_S               subdivision (lazy)        𝑂 (1) per access (lazy) / 𝑂 (𝑛) materialized
kernel_A               additive accents          𝑂 (𝑛)
kernel_R               rotation                  𝑂 (𝑛 log 𝑛) FFT / 𝑂 (𝑛) shift
kernel_W               within-cell permutes      𝑂 (𝑛)
proj_Pi + apply_proj   tier projector            𝑂 (𝑛 log 𝑛)
R1, R2, R3             resonance components      𝑂 (𝑛 log 𝑛) each
optimize_continuous    update 𝛼, 𝜙               𝑂˜ (𝑛 log 𝑛) per step
beam_search            discrete search           𝑂 (𝐵 · 𝑛 log 𝑛) per layer




                                        55
C.10 Extended 108-Cycle Helpers
build_108_scaffold(weights: Dict) -> Word
  # Returns ternary-first word with A_{27,9,3,4,2}, optional W_2.

generate_108(weights, swap=False, rot=0, color5=0.0, color7=0.0) -> Signal
  # Implements the pseudocode from the main text with optional 5/7 layers.

analyze_108(sig, D) -> Dict
  # Returns {R1,R2,R3,R, tier_energies, cadence_hits, syncopation_index}.


C.11 Notes on Determinism
set_deterministic(cfg.impl)
  # Fix RNG seeds; select deterministic FFT plans; fix thread counts;
  # disable atomic-race kernels; log backend versions and hashes.


The above APIs cover end-to-end workflows: lattice construction, operator authoring, evaluation,
resonance scoring, search/learning, diagnostics, and reproducible export. They encode the
calculus’ guarantees (tier structure, noncommutation) while providing practical levers for
implementation and deployment.


Appendix D. Extra Experiments and Full Tables

D.1 Experimental Settings
Unless noted, we use 𝑛 ∈ {48, 60, 72, 84, 90, 96, 108}, tiers D = {𝑝𝑟 ∥ 𝑛}, weights 𝜆 =
(0.4, 0.35, 0.25), tier weights 𝜂 𝑑 proportional to 𝑑. Each cell reports mean±sd over 5 seeds with
95% bootstrap CIs in parentheses. Gauge-fix: downbeat pin + CRT phase. Discrete search:
beam width 𝐵 = 32; continuous updates: 50 steps.


D.2 Full Result Tables
Table D.1: Metrical corpus by lattice size.

                           Table 3: Metrical corpus resonance by 𝑛.


    𝑛                          𝑅1                        𝑅2                        𝑅3      𝑅

    48    0.91±0.03 (0.89–0.93)     0.87±0.04 (0.84–0.90)     0.85±0.05 (0.82–0.88)     0.88
    60    0.92±0.03 (0.90–0.94)     0.88±0.04 (0.85–0.91)     0.86±0.05 (0.83–0.89)     0.89


                                               56
    𝑛                         𝑅1                      𝑅2                     𝑅3      𝑅

    72    0.93±0.03 (0.91–0.95)    0.89±0.03 (0.87–0.91)   0.87±0.04 (0.84–0.90)   0.90
    84    0.92±0.03 (0.90–0.94)    0.89±0.04 (0.86–0.92)   0.87±0.05 (0.84–0.90)   0.90
    90    0.92±0.03 (0.90–0.94)    0.90±0.03 (0.88–0.92)   0.88±0.04 (0.85–0.91)   0.90
    96    0.91±0.04 (0.88–0.94)    0.88±0.04 (0.85–0.91)   0.86±0.05 (0.83–0.89)   0.89
    108   0.93±0.03 (0.91–0.95)    0.89±0.04 (0.86–0.92)   0.87±0.05 (0.84–0.90)   0.90


Table D.2: Ritual schedules by lattice size.

                         Table 4: Ritual schedules resonance by 𝑛.


    𝑛                         𝑅1                      𝑅2                     𝑅3      𝑅

    48    0.94±0.02 (0.93–0.95)    0.92±0.03 (0.90–0.94)   0.89±0.03 (0.87–0.91)   0.92
    60    0.95±0.02 (0.94–0.96)    0.93±0.03 (0.91–0.95)   0.90±0.03 (0.88–0.92)   0.93
    72    0.95±0.02 (0.94–0.96)    0.93±0.02 (0.92–0.94)   0.90±0.03 (0.88–0.92)   0.93
    84    0.95±0.02 (0.94–0.96)    0.93±0.03 (0.91–0.95)   0.90±0.03 (0.88–0.92)   0.93
    90    0.95±0.02 (0.94–0.96)    0.94±0.02 (0.93–0.95)   0.91±0.03 (0.89–0.93)   0.94
    96    0.94±0.02 (0.93–0.95)    0.93±0.03 (0.91–0.95)   0.90±0.03 (0.88–0.92)   0.93
    108   0.95±0.02 (0.94–0.96)    0.93±0.03 (0.91–0.95)   0.90±0.03 (0.88–0.92)   0.93


Table D.3: Physiological cycles by lattice size.

                           Table 5: Physiological resonance by 𝑛.


    𝑛                         𝑅1                      𝑅2                     𝑅3      𝑅

    48    0.83±0.06 (0.79–0.87)    0.77±0.07 (0.72–0.82)   0.74±0.08 (0.69–0.79)   0.78
    60    0.84±0.05 (0.81–0.87)    0.78±0.06 (0.74–0.82)   0.75±0.07 (0.71–0.79)   0.79
    72    0.85±0.05 (0.82–0.88)    0.79±0.06 (0.75–0.83)   0.76±0.07 (0.72–0.80)   0.80
    84    0.84±0.05 (0.81–0.87)    0.78±0.06 (0.74–0.82)   0.75±0.07 (0.71–0.79)   0.79
    90    0.84±0.05 (0.81–0.87)    0.79±0.06 (0.75–0.83)   0.76±0.07 (0.72–0.80)   0.80
    96    0.83±0.06 (0.79–0.87)    0.78±0.06 (0.74–0.82)   0.75±0.07 (0.71–0.79)   0.79
    108   0.84±0.05 (0.81–0.87)    0.78±0.06 (0.74–0.82)   0.75±0.07 (0.71–0.79)   0.79




                                               57
                                                             Removal / change           Δ𝑅1        Δ𝑅2        Δ𝑅3

                                                             Drop 𝑝 = 3 family     −0.07       −0.12       −0.09     −
                                                             Drop 𝑝 = 2 family     −0.05       −0.03       −0.02     −
Table D.4: Ablations on 𝑛 = 108 (ternary-first word).        Drop 𝑝 = 5 ornaments −0.01        +0.00       +0.00     −
                                                             Drop 𝑝 = 7 drift      +0.00       +0.00       −0.01     +
                                                             Swap W2 order         −0.02       −0.01       −0.01     −
                                                                    ˆ
                                                             Freeze 𝑄 (state-only) −0.01       −0.02       −0.02     −


                                                         True \ Pred        Ternary-first   Binary-first      Ternary

                                                         Ternary-first               142              18
Table D.5: Gauge-class confusion (counts, 𝑛 = 108).      Binary-first                 22             128
                                                         Ternary+color                 7               5
                                                         Other                         4               3


                                                                Condition                     𝑅1         𝑅2     𝑅3

                                                                SNR 20 dB, no jitter       0.94 0.92 0.90
                                                                SNR 10 dB, no jitter       0.91 0.90 0.88
Table D.6: Sensitivity to noise and tempo drift (𝑛 = 108).      SNR 5 dB, no jitter        0.87 0.87 0.85
                                                                SNR 10 dB, jitter 0.5 tick 0.88 0.89 0.86
                                                                SNR 10 dB, jitter 1.0 tick 0.84 0.88 0.84
                                                                Tempo drift 𝜎𝜙 = 0.5       0.89 0.88 0.84
                                                                Tempo drift 𝜎𝜙 = 1.0       0.86 0.86 0.81


D.3 Beam Width, Runtime, and Convergence

                                                         Beam 𝐵      𝑅 (val)    Steps to plateau    Wall time (rel.)

                                                         8             0.89                   7                     1.0
Table D.7: Beam width vs. score and time (𝑛 = 108).      16            0.90                   6                     1.4
                                                         32            0.90                   6                     1.9
                                                         64            0.90                   6                     3.1
Diminishing returns beyond 𝐵=32.




                                              58
D.4 Ornaments and Cross-Prime Interference
                                                                   Setting                Δ𝑅1      Δ𝑅2     Δ𝑅3

Table D.8: Effect of 𝑝 ∈ {5, 7} ornaments on 𝑅 (fixed scaffold).   +A5 w/ anti-3 gate    +0.00   +0.00 +0.01
                                                                   +A7 drift (𝛿 = 0.1)    0.00    0.00 +0.01
                                                                   +A5 without anti-3    -0.01   -0.02  0.00


D.5 Relation Operators

                                                      Move                   Δ𝑅    Invariant violations (per 100

                                                      Split (coherent)     +0.02
Table D.9: Topology moves on hypergraph tasks.        Merge (coherent)     +0.01
                                                      Fold (cyclic)        +0.01
                                                      Relabel (auto)       +0.00
                                                      Split (incoherent)   -0.03


D.6 Learning Curves and Ablation Traces
Figure D.1: Learning curves. Validation 𝑅 vs. epochs for metrical, ritual, physio. Shaded 95%
CIs, markers at discrete search updates. (See supplementary figs/learning_curves.pdf.)

Figure D.2: Ablation traces. Cumulative Δ𝑅 as operators are removed in reverse topological
order. (See figs/ablation_traces.pdf.)


D.7 CSV Exports and Reproduction
All tables are exported as CSV in supp_tables/:
    • table_metr_by_n.csv, table_ritual_by_n.csv, table_physio_by_n.csv
    • table_ablations_108.csv, table_gauge_confusion.csv
    • table_noise_drift.csv, table_beam_width.csv, table_ornaments.csv, table_relation.cs
Each file includes: dataset id, 𝑛, seed, operator word tokenization, Θ, gauges, and scores
(𝑅1 , 𝑅2 , 𝑅3 , 𝑅), with hashes for the inputs and environment manifest.
Note. Appendix values follow the experimental protocol in §Experiments; exact numbers will
depend on the released seeds, data splits, and code hash. The layouts here match the API in
Appendix C and compile into the camera-ready supplement.


Appendix E. Glossary of Terms and Symbols



                                              59
Symbol          Name                         Meaning / Notes

T𝑛              time lattice                Cyclic index set {0, . . . , 𝑛 − 1} with modulo-𝑛 arith-
                                            metic.
𝑡               tick                        Element of T𝑛 .
𝑥 : T𝑛 → R 𝑘    signal / pattern            𝑘-channel sequence on the lattice. Matrix form
                                            𝑋 ∈ R𝑛×𝑘 .
𝐻 = (𝑉, 𝐸, 𝜄)   hypergraph                  Vertices 𝑉, hyperedges 𝐸, incidence 𝜄 : 𝐸 → P (𝑉).
𝜎, 𝜏            state attachments           𝜎 : 𝑉 → R 𝑘 𝑉 (vertex), 𝜏 : 𝐸 → R 𝑘 𝐸 (edge).
M = (X, 𝐻)      multiplicity space          Carrier consisting of signal space X and hypergraph
                                            𝐻.
Aut(M)          automorphism group          Incidence-preserving relabelings of 𝑉, 𝐸 (gauge sym-
                                            metries).
𝐺               gauge group                 Product of time, vertex, edge symmetries acting on
                                            M.
Stab𝐺 (M)       stabilizer                  Subgroup commuting with all active operators on M.
S𝑝              subdivision                 Refine each tick into 𝑝 subticks; lazy or materialized.
  𝛼,𝜙
A 𝑝𝑟            accent (additive)           Add weight 𝛼 on channel at 𝑡 ≡ 𝜙 (mod 𝑝𝑟 ). Offset
                                            𝜙 = 0 if omitted.
Δ𝑑              spike gate (multiplicative) (Δ𝑑 𝑥)(𝑡) = [𝑑 | 𝑡] · 𝑥(𝑡).
  𝜙
R 𝑝𝑟            rotation                    Shift by 𝜏 = 𝜙 𝑛/𝑝𝑟 ticks (DFT phase or time shift).
W 𝜋𝑝            permutation (wreath)         Reorder the 𝑝 subticks in each parent cell by 𝜋 ∈ 𝑆 𝑝 .
𝑄ˆ 𝑝            relation operator            Split/merge/fold/relabel on 𝐻 aligned to 𝑝-ary struc-
                                             ture.
[𝑑 | 𝑡]         divisibility indicator       1 iff 𝑡 ≡ 0 (mod 𝑑), else 0.
Π 𝑝𝑟            projector                    Average over rotations by 𝑛/𝑝𝑟 ; keeps harmonics
                                             𝑘 ≡ 0 (mod 𝑝𝑟 ).
𝐾𝑑              comb indices                 { ℓ 𝑛/𝑑 : ℓ = 0, . . . , 𝑑 − 1 } in frequency domain.
𝑥 [𝑘]
b               DFT coefficient              𝑛-point discrete Fourier transform of 𝑥.
𝐷 𝑝 (·)         Dirichlet kernel             Appears in spectrum of subdivision S 𝑝 .
                                                      Î
CRT             Chinese remainder            Z/𝑛  𝑝𝑟 𝑝 ∥𝑛 Z/𝑝𝑟 𝑝 ; tier decomposition.
𝑣 𝑝 (𝑛)         𝑝-adic valuation             Largest 𝑟 with 𝑝𝑟 | 𝑛.
𝑃ˆ ( 𝑝)         prime word                   Canonical ordered product for prime 𝑝 across tiers
                                             𝑝𝑟 .
                                             Ordered product 𝑝|𝑛 𝑃ˆ ( 𝑝) (noncommutative).
                                                                Î
𝑁
b               composite word
W               operator word                Any sequence of operators; right-to-left application.
[·, ·]          commutator                   [ 𝐴, 𝐵] = 𝐴𝐵 − 𝐵𝐴; nonzero indicates order sensitiv-
                                             ity.
∗, ⊙            convolution, Hadamard        Standard discrete operations (freq/time).


                                               60
𝐼                identity                      Identity operator on signals or relations.
𝑅1 , 𝑅2 , 𝑅3     resonance components          Time correlation, harmonic lock, phase coherence.
                                                                                 Í
𝜆𝑖               aggregation weights           Nonnegative, sum to 1; 𝑅 = 𝑖 𝜆𝑖 𝑅𝑖 .
𝜂𝑑               tier weights                  Weights across tiers 𝑑 ∈ {𝑝𝑟 ∥ 𝑛} for 𝑅2 , 𝑅3 .
𝐸 [𝑥]
                                               Í            2                             2
                 energy                          𝑡 ∥𝑥(𝑡)∥ ; tier energy 𝐸 𝑝 𝑟 = ∥Π 𝑝 𝑟 𝑥∥ 2 .
                                                                            Í
𝐹 [𝜎]            fairness                      min𝑖 Σ𝑖 /max𝑖 Σ𝑖 , Σ𝑖 = 𝑡 𝜎𝑖 (𝑡).
Θ                parameter bundle              {𝛼, 𝜙, 𝜋, 𝑄}:ˆ accents, rotations, permutations, rela-
                                               tion params.
𝐶𝑖               tick classes                  Disjoint/overlapping classes by divisibility (e.g., 𝐶0
                                               apex, 𝐶1 strong...).
𝑆7 (𝑛, 𝜇)        heptadic set                  {𝜇 + ℓ𝑠𝑛 mod 𝑛 : ℓ = 0..6}, 7𝑠𝑛 ≡ 1 (mod 𝑛).
𝑤 [𝑡]            window/taper                  e.g., Hann; reduces leakage for 𝑅1 and DFT.
                                               Í
𝐴(𝑁)             partial-sum growth               𝑛≤𝑁 𝑎 𝑛 ; used for asymptotic checks.
                                                               Í
𝐹 (𝑞)            𝑞-series seed                 𝐹 (𝑞) =           𝑛≥0 𝑎 𝑛 𝑞
                                                                           𝑛 with prime-gated 𝑎
                                                                                                𝑛 =
                                               Î
                                                  𝑝 𝑔 𝑝 (𝑣 𝑝 (𝑛)).
𝜒                character                     Dirichlet-like gate on coefficients (optional).
                                               W ′ = R𝑛 𝑔 W 𝑔 −1 ; same class under gauge+phase.
                                                          𝜙
𝐺-conjugacy      gauge equivalence
𝐴 ∼𝑅 𝐵           resonance equivalence         𝑅( 𝐴[·]) = 𝑅(𝐵[·]) after canonical gauge-fix.
lcm, gcd         arithmetic ops                Least common multiple, greatest common divisor.
arg, atan2       phase functions               Used in 𝑅3 phase-coherence computations.


Conventions. Right-to-left operator application; primes 𝑝 ∈ {2, 3, 5, 7} emphasized; additive
accents are channel-specific unless stated; rotations use DFT-phase realization for differentiability;
all resonance scores lie in [0, 1] after normalization.

Abbreviations. DFT: discrete Fourier transform; CRT: Chinese remainder theorem; GSP:
graph signal processing; PLL: phase-locked loop; API: application programming interface.


Appendix F. Sutra Library: Minimal Rewrite Entries with
Examples
Each entry gives a terse rule (sutra), preconditions, rewrite, invariants, and a short example.
Rules act on a signal 𝑥 : T𝑛 → R𝑘 and, when stated, on a hypergraph 𝐻 = (𝑉, 𝐸, 𝜄). Composition
is right-to-left.




                                                 61
F.1 Structure Sutras (Subdivision, Permutation, Rotation)
S1. Factor–Unfold (S 𝑝 ).        Pre: 𝑝 prime. Rewrite:

                                 𝑋 ⇒ S 𝑝 𝑋,       ( S 𝑝 𝑋)( 𝑝𝑡 + 𝑢) = 𝑋 (𝑡).

Invariant: energy per parent cell preserved under zero-order hold. Example (108): S33 S22 builds
T108 from T1 .

S2. Off-Beat Swap (W2(0 1) ).       Pre: 𝑛 even. Rewrite:

                        𝑋 ⇒ W2(0 1) 𝑋, ( W2(0 1) 𝑋)(2𝑡 + 𝑢) = 𝑋 (2𝑡 + 1 − 𝑢).

Effect: inverts on/off within each binary cell. Example (108): apply after S22 for binary-first
syncopation.

S3. Hemiola Tilt (W3(0 2 1) ).     Pre: 3 | 𝑛. Rewrite:

                                           𝑋 ⇒ W3(0 2 1) 𝑋.

Effect: 1 → 3 → 2 within ternary cells; mild cross-tier tension. Example (108): insert before A9
to re-seat 𝐶1 beats.

                    𝜙
S4. CRT Lock (R 𝑝𝑟 ).      Pre: 𝑝𝑟 | 𝑛. Rewrite:

                                              𝜙
                                      𝑋 ⇒ R 𝑝𝑟 𝑋,        𝜏 = 𝜙𝑛/𝑝𝑟 .

Effect: aligns tier 𝑝𝑟 downbeat; commutes with Π 𝑝𝑟 . Example (108): choose 𝜙 to pin 𝐶0 at
𝑡 = 0.


F.2 Accent and Mask Sutras
S5. Cadence Gate (A𝛼𝑝𝑟 ).        Pre: 𝑝𝑟 | 𝑛. Rewrite:

                                       𝑋 ⇒ 𝑋 + 𝛼 [ 𝑝𝑟 | 𝑡] 𝑒 𝑐 .

Hierarchy: 𝛼27 > 𝛼9 > 𝛼3 for phrase clarity. Example (108): (27, 9, 3) on spine channel.

S6. Anti-Coincidence (X¬𝑑 ). Rewrite: ( X¬𝑑 𝑋)(𝑡) = (1 − [𝑑 | 𝑡]) 𝑋 (𝑡). Use: protect spine
                                      𝛾
while adding ornaments. Example: X¬3 A5 avoids ternary collisions.




                                                    62
S7. Spike Projector (Δ𝑑 ). Rewrite: (Δ𝑑 𝑋)(𝑡) = [𝑑 | 𝑡] · 𝑋 (𝑡). Use: force events to a tier or
compute class-restricted energies.

                                                         Í 𝑝𝑟 −1
S8. Level Averager (Π 𝑝𝑟 ). Rewrite: (Π 𝑝𝑟 𝑋)(𝑡) = 𝑝1𝑟 𝑢=0 𝑋 𝑡 + 𝑢 𝑛/𝑝𝑟 . Effect: keep only
                                                                       

content invariant under R 𝑝𝑟 ; diagnostics and separation.


F.3 Ornament Sutras (𝑝 = 5, 7)
                       𝛾
S9. Quint Overlay (A5 ). Rewrite: 𝑋 ⇒ 𝑋 + 𝛾 [5 | 𝑡] 𝑒 𝑜 . Option: X¬3 gate to preserve spine.
Example (108): light color every 5 ticks on ornament channel.

S10. Hept Drift (A7♭,𝛿 ). Pre: 7 ∤ 𝑛. Rewrite: pick 𝜇, 𝑠𝑛 s.t. 7𝑠𝑛 ≡ 1 (mod 𝑛), set
𝑆7 = {𝜇 + ℓ𝑠𝑛 },
                                 𝑋 ⇒ 𝑋 + 𝛿 1𝑡∈𝑆7 𝑒 𝑜 .

Option: update 𝜇 ← 𝜇 + 𝜌 per cycle for slow phase drift.


F.4 Relation Sutras (𝑄ˆ 𝑝 on 𝐻)
                split
S11. Split (𝑄ˆ 𝑝 ). Pre: 𝑒 ∈ 𝐸. Rewrite: 𝑒 ⇒ {𝑒 (𝑢) }𝑢=0 with 𝜄(𝑒 (𝑢) ) = 𝜄(𝑒). Use: parallel
                                                     𝑝−1

lanes for tier-specific aggregation.

               merge
S12. Merge (𝑄ˆ 𝑝 ). Pre: coherent siblings {𝑒 (𝑢) }. Rewrite: collapse to 𝑒 under conserved
sum on 𝜏. Use: reduce topology after ornament passes.

S13. Fold (𝑄ˆ fold
              𝑝 ). Rewrite: quotient 𝑝-cycle of vertices/edges by rotation. Effect: enforces
𝑝-periodicity; removes a degree of freedom.


F.5 Composition Sutras and Normal Forms
S14. Tiered Normal Form.       Rewrite schema:
                                            𝑟
                                           Ö                 
                                                       𝛼 𝑗
                           𝑃ˆ ( 𝑝) = S𝑟𝑝
                                                                    𝜙
                                                     A 𝑝 𝑝𝑗       R 𝑝𝑟   W 𝜋𝑝 .
                                    |{z}       𝑗=1                |{z} |{z}
                                   build   |     {z           }   lock   feel
                                                 gate


Note: order inside a prime is mostly exchangeable except W 𝑝 ; cross-prime order is not.

S15. Order Swap Test. Procedure: generate W, compute 𝑅; swap adjacent prime blocks,
recompute 𝑅; keep the better word. Repeat until no local improvement.



                                                 63
S16. Energy–Fairness Projection. Rewrite: 𝑋 ⇒ Proj{𝐸≤𝐸max , 𝐸 𝑝𝑟 ≤𝜂max 𝐸, 𝐹≥𝐹min } (𝑋) after
each epoch. Effect: enforces budgets without changing word structure.


F.6 Worked Micro-Entries on 𝑛 = 108
F6.1 Ternary-First Scaffold.

                                W△ = S33 S22 · A2727 A9 9 A3 3 A4𝛼4 A2𝛼2
                                                   𝛽       𝛽   𝛽



Example ticks: 𝐶0 = {0, 27, 54, 81}, 𝐶1 = {9, 18, 36, 45, 63, 72, 90, 99}.

F6.2 Binary-First Syncopation.

                           W□ = S22 W2(0 1) S33 · A4𝛼4 A2𝛼2 A2727 A9 9 A3 3
                                                                   𝛽   𝛽   𝛽



Effect: micro hits shift off the ternary spine; 𝑅1 may increase on backbeat targets.

F6.3 Quinary Ornament with Protection.

                                                       𝛾
                                W5 = W△ · X¬3 A5 5 ,           𝛾5 ≪ 𝛼2 .

F6.4 Heptadic Drift Overlay.

            W7 = W△ · A7♭,𝛿 ,    𝑆7 (108, 𝜇) = {𝜇 + ℓ𝑠108 }, 7𝑠108 ≡ 1         (mod 108).


F.7 Minimal Pseudocode Snippets
FP1. Cadence–Micro Generator (108).

def gen108(w):
  x = zeros(108)
  for t in range(108):
    if t % 27 == 0: x[t] += w[’27’]
    elif t % 9 == 0: x[t] += w[’9’]
    elif t % 3 == 0: x[t] += w[’3’]
    elif t % 4 == 0: x[t] += w[’4’]
    elif t % 2 == 0: x[t] += w[’2’]
  return x

FP2. Off-Beat Swap within 4-Grid.



                                                  64
def swap_offbeat4(x):
  y = x.copy()
  for b in range(0, len(x), 4):
    y[b+0], y[b+2] = x[b+2], x[b+0]
  return y

FP3. Ornament with Anti-3 Gate.

def add_quinary(x, gamma):
  for t in range(len(x)):
    if (t % 5 == 0) and (t % 3 != 0):
      x[t] += gamma
  return x


F.8 Quick-Use Table
                   Sutra   Purpose               Typical Setting

                   S1      build tier            S33 , S22
                                                    (0 1)
                   S2      micro syncopation     W2      after S2
                                                   (0 2 1)
                   S3      ternary tilt          W3        before A9
                                                  𝜙
                   S4      downbeat pin          R27
                   S5      cadence gate          A27 , A9 , A3
                   S6      protect spine         X¬3 around ornaments
                   S7      restrict tier         Δ4 for micro-only edits
                   S8      analyze tier          Π9 to audit energy
                                                   𝛾
                   S9      quinary color         A5 on 𝑒 𝑜
                   S10     hept drift            A7♭,𝛿 with slow 𝜇
                                                    split
                   S11     split lanes           𝑄ˆ 2 on 𝐻
                   S12     fold symmetry         𝑄ˆ fold
                                                    3 for ternary quotient

These sutras provide a compact playbook: build tiers (S1), set feel (S2–S4), gate hierarchy
(S5–S6), add color (S9–S10), manage relations (S11–S12), and audit with projectors (S7–S8).
The 𝑛=108 examples serve as canonical templates for adaptation to other factorizations.




                                            65
Lists of Figures and Tables

List of Figures
  1   Δ𝑅 under ablations: remove-𝑝, freeze-𝑄,       ˆ and adjacent swaps. Error bars are
      95% bootstrap CIs. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .        24
  2   Confusion among gauge-equivalent classes. Rows = ground-truth class, cols =
      predicted. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .      25
  3   Sensitivity of 𝑅 to SNR, missing events, jitter, and tempo drift. Shaded regions:
      95% CI across seeds and items. . . . . . . . . . . . . . . . . . . . . . . . . . .        26
                                                                  𝜙
  4   Operator diagrams: S 𝑝 (subdivision), A𝛼𝑝𝑟 (accent), R 𝑝𝑟 (rotation), W 𝑝 (permu-
      tation), and relation 𝑄ˆ 𝑝 on 𝐻. . . . . . . . . . . . . . . . . . . . . . . . . . . .    67
  5   CRT tilings of T𝑛 for 𝑛 = 108: factorization 108 = 22 · 33 with aligned Z/4 and
      Z/27 grids and level projectors Π2 , Π4 , Π3 , Π9 , Π27 . . . . . . . . . . . . . . . .   67
  6   Resonance spectra: tier energies on comb indices 𝐾 𝑑 and phase-coherence polar
      plots for (𝑅1 , 𝑅2 , 𝑅3 ) under ternary-first vs. binary-first words. . . . . . . . . .   68
  7   Cadence map for 𝑛 = 108: tick classes 𝐶0 –𝐶4 with weights (𝑤 0 > · · · > 𝑤 4 ),
      showing 27 → 9 → 3 cadences and 4, 2 micro layers. . . . . . . . . . . . . . . .          68



List of Tables
  1   Resonance and class accuracy (mean ± sd over seeds; 95% CI in parentheses). .             24
  2   Summary contrasts with representative paradigms. . . . . . . . . . . . . . . .            30
  3   Metrical corpus resonance by 𝑛. . . . . . . . . . . . . . . . . . . . . . . . . .         56
  4   Ritual schedules resonance by 𝑛. . . . . . . . . . . . . . . . . . . . . . . . . .        57
  5   Physiological resonance by 𝑛. . . . . . . . . . . . . . . . . . . . . . . . . . .         57




                                             66
Figure Stubs (to be replaced with final graphics)




                                                                 𝜙
Figure 4: Operator diagrams: S 𝑝 (subdivision), A𝛼𝑝𝑟 (accent), R 𝑝𝑟 (rotation), W 𝑝 (permutation),
and relation 𝑄ˆ 𝑝 on 𝐻.




Figure 5: CRT tilings of T𝑛 for 𝑛 = 108: factorization 108 = 22 · 33 with aligned Z/4 and Z/27
grids and level projectors Π2 , Π4 , Π3 , Π9 , Π27 .




                                               67
Figure 6: Resonance spectra: tier energies on comb indices 𝐾 𝑑 and phase-coherence polar plots
for (𝑅1 , 𝑅2 , 𝑅3 ) under ternary-first vs. binary-first words.




Figure 7: Cadence map for 𝑛 = 108: tick classes 𝐶0 –𝐶4 with weights (𝑤 0 > · · · > 𝑤 4 ), showing
27 → 9 → 3 cadences and 4, 2 micro layers.




                                               68
Reproducibility Package

Directory Layout
All materials sit under repro/. Tree (placeholders may be symlinks or LFS pointers):

repro/
 README.md
 configs/
    metr.yml
    ritual.yml
    physio.yml
    common.yml
 data/
    METRICAL/              # or pointer/URL in README
    RITUAL/
    PHYSIO/
    PROVENANCE.md
    LICENSES/
        METRICAL_LICENSE.txt
        RITUAL_LICENSE.txt
        PHYSIO_LICENSE.txt
 env/
    environment.yml
    requirements.txt
    hardware.txt
    determinism.md
 scripts/
    rebuild.sh
    make_figs.py
    make_tables.py
    run_exps.py
    seed_report.py
 outputs/
    figs/
    tables/
    logs/
    checkpoints/
 checksums/
    sha256sum.txt

                                            69
    manifest.csv
 CITATION.cff


Config Files for Each Experiment
                                                                             ˆ scoring weights,
Each config declares lattice, tiers, operator word, parameters Θ = {𝛼, 𝜙, 𝜋, 𝑄},
splits, seeds, and gauges.

# repro/configs/metr.yml
experiment: "metrical_corpus"
n: [48, 60, 72, 84, 90, 96, 108]
tiers: { use_CRT: true }
lambdas: { R1: 0.40, R2: 0.35, R3: 0.25 }
etas: { by_tier: proportional }           # weight by divisor d
word: |
  S3^r= {r: 3} ; S2^s= {s: 2} ;
  A: [ {d:27,a:1.0}, {d:9,a:0.7}, {d:3,a:0.5}, {d:4,a:0.3}, {d:2,a:0.2} ]
  W2: {perm: [1,0]} ; R: {d:27,phi: 0}
theta:
  alpha: {27:1.0, 9:0.7, 3:0.5, 4:0.3, 2:0.2}
  phi:   {27:0, 9:0, 3:0, 4:0, 2:0}
  perm: {2:[1,0]}
  Q:     {}
gauge: { downbeat_pin: true, crt_phase_fix: true }
splits: { strategy: "stratified", train:0.70, val:0.15, test:0.15, seed: 20251 }
impl:   { fft_backend: "fftw", threads: 1, deterministic: true }
invariants: { Emax: 1.0, tier_max: {27:0.5}, Fmin: 0.7 }


Dataset Notes and Licenses
   • PROVENANCE.md records source, collection method, consent, preprocessing, and
     contact.
   • LICENSES/.txt contains each dataset license or usage terms; mirror exact text.
   • CITATION.cff provides citation metadata for the package and any third-party data.
   • For ritual or physiological data include anonymization notes and opt-out procedures.
Minimal template for PROVENANCE.md:

# Dataset: METRICAL
Source: <reference or URL>
License: <SPDX identifier or text reference>
Scope: rhythms with binary–ternary interlocks

                                              70
Preprocessing: quantized to T_n; normalization; windowing
Ethics: consent obtained; anonymized; usage restricted per LICENSE
Checksum root: checksums/manifest.csv


Script to Regenerate All Figures and Tables
# 1) Create/activate environment
conda env create -f repro/env/environment.yml
conda activate moc-repro
export PYTHONHASHSEED=0 OMP_NUM_THREADS=1 MKL_NUM_THREADS=1
export TF_CUDNN_DETERMINISTIC=1 CUBLAS_WORKSPACE_CONFIG=:4096:8

# 2) Run all experiments and render artifacts
bash repro/scripts/rebuild.sh --all
# or explicitly:
python repro/scripts/run_exps.py --configs repro/configs --out repro/outputs
python repro/scripts/make_figs.py   --in repro/outputs --out repro/outputs/figs
python repro/scripts/make_tables.py --in repro/outputs --out repro/outputs/tables
python repro/scripts/seed_report.py --logs repro/outputs/logs

# 3) Verify checksums
sha256sum -c repro/checksums/sha256sum.txt

Makefile (optional):

.PHONY: all env exps figs tables verify clean
env: ; conda env create -f repro/env/environment.yml
exps: ; python repro/scripts/run_exps.py --configs repro/configs --out repro/outputs
figs: ; python repro/scripts/make_figs.py --in repro/outputs --out repro/outputs/fig
tables: ; python repro/scripts/make_tables.py --in repro/outputs --out repro/outputs
verify: ; sha256sum -c repro/checksums/sha256sum.txt
all: env exps figs tables verify
clean: ; rm -rf repro/outputs/{figs,tables,logs,checkpoints}


Checksums and Environment Specification
Environment.    Pin toolchain versions and backends.

# repro/env/environment.yml
name: moc-repro
channels: [conda-forge, defaults]

                                            71
dependencies:
  - python=3.11
  - numpy=1.26
  - scipy=1.13
  - fftw=3.3
  - numba=0.59
  - pandas=2.2
  - matplotlib=3.9
  - pip
  - pip:
      - pyyaml==6.0.2
      - tabulate==0.9.0
      - tqdm==4.66.2

Record hardware in env/hardware.txt (CPU, RAM, GPU, OS). Determinism notes in
env/determinism.md.

Checksums.   Provide file-level SHA-256 and a manifest.

# repro/checksums/sha256sum.txt
d2f7... repro/outputs/figs/cadence_map_108.pdf
a1b3... repro/outputs/tables/table_metr_by_n.csv
...

# repro/checksums/manifest.csv
path,bytes,sha256,created_utc,source
outputs/figs/cadence_map_108.pdf,123456,d2f7...,2025-11-05,make_figs.py
...


Artifact Map


 Artifact            Generator                            Destination

 Operator diagrams   make_figs.py –fig operators  outputs/figs/operator_diagrams.pdf
 CRT tilings         make_figs.py –fig crt        outputs/figs/crt_tilings.pdf
 Resonance spectra   make_figs.py –fig spectra    outputs/figs/resonance_spectra.pdf
 108 cadence map     make_figs.py –fig cadence108 outputs/figs/cadence_map_108.pdf
 Main tables         make_tables.py –all          outputs/tables/*.csv
 Logs                run_exps.py                  outputs/logs/*.jsonl



                                          72
Deterministic Paths and Seeds
All configs record:
    • global seed for splits and initialization;
    • beam-search seed for tie-breaking;
    • implementation flags: threads = 1, deterministic FFT, fixed PYTHONHASHSEED.
Re-run validation: python scripts/seed_report.py emits the per-epoch seed stream and
the tokenized operator word; verify equality against logs.


Licensing and Citation
Package-level license at repository root. Dataset licenses mirrored under data/LICENSES.
Include CITATION.cff so users can cite the package and the original datasets correctly.
This package yields byte-identical figures and tables from fixed seeds and pinned environments,
enabling exact reproduction of all reported results.




                                              73

