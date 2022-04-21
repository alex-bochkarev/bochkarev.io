---
title: "Current work"
nocat: true
hidetoc: true
---

Here is a brief summary of my current research projects. Please feel free to
reach out if you are interested in details. 

### 1) On collections of BDDs and "order-associated" diagrams.
![Branch and Bound tree](./siftup.png#full-shadow)

**Summary:** Designing a heuristic to find a "good" shared order
of layers for a pair of Binary Decision Diagrams ([BDDs](https://en.wikipedia.org/wiki/Binary_decision_diagram)) and applying
it to build an exact solution to a hard optimization problem: a variant of facility location.

<details> <summary> [ More details ]</summary>

The project focuses on Binary Decision Diagrams and their applications in
optimization. This data structure was developed to efficiently manipulate
Boolean functions, and sometimes it seems handy to represent a "logical"
(binary) constraint as a diagram. So, some optimization problems can be
naturally reformulated as linked network flows through a collection of diagrams
(and we are looking for a ["Consistent
path"](https://doi.org/10.1287/opre.2020.1979) through several diagrams).
Informally speaking, the latter can be solved relatively easily if the diagrams
have their layers in the same order. Good order of layers may make a diagram
small, but in a bad case the size of the diagram grows exponentially. Finding a
best order of layers is NP-hard, even for a single diagram. The project is structured into
two large, more or less independent parts.

First, we build a heuristic to "align" the diagrams. The
central idea is simple: when we swap two adjacent layers in
a diagram, their size change. But instead of working with
the original diagrams, which can be computationally
expensive, we can just keep track of the upper bounds on the
layer sizes. This gives rise to a smaller auxiliary problem
that sometimes does allow to find good shared order of
layers in reasonable time.

In the second part of the project we actually use this idea
to attack a hard combinatorial problem, a variant of the facility
location. We demonstrate how to parameterize the problem
using a collection of BDDs and compare several ways to
obtain an (exact) optimal solution, revealing that
Consistent Path representation along with the proposed
"alignment" heuristic might allow to obtain some performance
benefits (especially when we'd need to re-solve the problem
with different numerical data) and sensitivity information.
</details>

🖊️ **Working paper:** Bochkarev, Alexey, and J. Cole Smith. “On Aligning Non-Order-Associated Binary Decision Diagrams.” Under revision in *INFORMS Journal on Computing*.

💬 **Presentation:** at INFORMS Annual Meeting 2020. [(slides)](./2020_10_Informs_Bochkarev.pdf)

💾 **Code and data:** work in progress ([current version](./align-BDD/code-docs/overview.html "current code docs"))

💻 **Software stack:** Python, R/ggplot, graphviz (dot), Gurobi solver, PBS, GNU parallel, bash, make, sphinx.

### 2) An RL-powered heuristic for Dynamic Shortest-Path Interdiction
![Tree picture](./dspi_tree.png#full-shadow)

**Summary:** Designing algorithms to "play the game" of [Dynamic Shortest-Path
Interdiction](https://doi.org/10.1002/net.21712) (which is
NP-hard). We are trying to explore the problem state space using the techniques
involving random simulations and reinforcement learning.

<details> <summary>[ More details ]</summary>

We are considering a dynamic game between two agents,
"Evader" and "Interdictor", over a directed weighted graph.
The purpose of the Evader is to traverse a graph between
"source" and "terminal" nodes at the minimum possible cost,
given the other player's actions. The "Interdictor" is
seeking to maximize the Evader's cost by "attacking" certain
number of edges of the graph (which results in the arc cost
increasing by a pre-defined amount). The players take turns,
where the Evader's turn implies traversal of an arc, and the
Interdictor's turn is either an attack or a pass. This
variant of the game is known to be NP-hard, and an exact
algorithm boils down to enumerating all the relevant states in a
dynamic programming fashion. 

While existing research discusses bounds for
the optimal game cost, the literature on heuristics
(algorithms that would actually play that game, or propose a
*policy* for the players) has been generally lacking. We
look to fill in this gap by leveraging some ideas from the
realm of simulations and game playing research. </details>

🖊️ **Working paper:** in preparation, with Dr. J. Cole Smith. (Abstract submitted/accepted
to [INOC-2022](https://sites.google.com/view/inoc2022 "International Network
Optimization Conference 2022"))

💻 **Software stack:** Julia, graphviz (dot), R/ggplot, PBS, make (so far).
