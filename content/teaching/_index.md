---
title: "Teaching"
nocat: true
---
I like teaching, and I really enjoy the moments when I am able to convey not
only the technical results or algorithms per se, but get the core ideas and the
underlying mathematical intuition across. Sometimes it seems even possible to
convey such intuition assuming remarkably limited prerequisites --- such as in our
(mini-)courses aimed at high-school students interested in STEM. Admittedly, it
is not easy to get such a group together physically, hence my special interest
towards remote studies.

This page contains notes related to my teaching experience, which happens to
span, roughly, undergraduate and graduate university- (including continued
education), and partly high-school levels.

## University-level courses

### "Mathematics of Quantum Computing"
![RPTU Course picture](./rptu-course.png#full-shadow)

Together with Dr. Schöbel, we taught a one-semester (14 weeks) course `MAT-59-15-V-7` at
RPTU aimed at BSc and MSc students, where I was responsible for a half-semester worth
of material (second part) called "Quantum Algorithms", with a special emphasis on
quantum optimization.

### "Mathematical Foundations of Quantum Technology"

In the framework of [QuanTUK project](https://www.quantensysteme.info/projektatlas/projekte/q/quantuk)
funded by [BMFTR](https://www.bmftr.bund.de/EN/Home/home_node.html), we developed an MSc program ["Quantum Technologies"](https://fernstudium.rptu.de/en/distance-learning-programmes/technology-engineering-and-natural-sciences/quantum-technologies) for our (awesome!) Distance and Independent Studies Center ([DISC](https://fernstudium.rptu.de/en)). I authored two courses in the program, the second one in co-authorship with Dr. Schöbel.

!["Math Foundations" course picture](./qmath.png#full-shadow)

The first one covered the mathematical foundations of quantum computing,
including a few remarks about complex numbers, an introduction to linear algebra
in the context of quantum computing, and a few further ideas specific to quantum
algorithms (such as quantum teleportation, entanglement and oracle-based
algorithms).

### Quantum Algorithms and Quantum Optimization

!["Quantum Algorithms" course picture](./qalg.png#full-shadow)

The second course developed in the QuanTUK project, called "Quantum Computing
Part I" in the program, zoomed in on the topics of quantum algorithms in
general, and those relevant for quantum optimization in particular (including
the exposition related to Adiabatic theorem, annealing, and QAOA).

## Mini-courses aimed at high-school students
I have designed from scratch and delivered three mini-courses for [School for
Molecular and Theoretical Biology](https://molbioschool.org/en/) (SMTB) and
Puschino Winter School. Both were aimed at (gifted) high school students and
undergrads. They had nothing to do with the high school program, but I obviously
needed to exercise some care with respect to prerequisites. Each course
comprised four 50-minutes sessions.

### "A glimpse into Algorithms."
![Runtimes figure](./smtb_algo.png#full-shadow)

**Summary:** Introducing and illustrating some key concepts from CS using simple
numerical experiments in Python. A crash-course-intro to algorithms and data structures
from the computational perspective. E.g., discussing correctness starting from unit
tests; asymptotic, best/worst case, and other concepts related to runtime ---
with measuring actual runtime in seconds using Python's `time` module, etc. The
purpose was to mention the key ideas, demonstrate that they are (1) not "scary",
and (2) pretty relevant to the practice, even if you are not an (aspiring)
computer scientist or a programmer. (This aspect was especially relevant since
majority of the students had a background in biology, but was interested in
computational aspects as well.)

**More details:** for syllabus, a few methodological notes, and links to
actual teaching materials (slides / jupyter notebooks) see 👉 [here](/teaching/smtb-algo).

### "Practical Introduction to Probability Theory."
![Experiment with sample mean and variance](./smtb_probs.png#full-shadow)

**Summary:** This is a *theoretical* course, i.e., aimed in first place to
introduce and discuss the concepts of probability space, random events,
independence, random variables, and some others. However, it is presented kind of
"backwards": starting from numerical experiments and trying to
"reverse-engineer" the logic behind the math that we actually have in
Probability theory. The ultimate goal was to build (together with the students)
a usable, practical, but consistent mathematical model of random events.

**More details:** for syllabus, a few methodological notes, and links to
actual teaching materials (slides / jupyter notebooks) see 👉 [here](/teaching/smtb-prob).

### "How to teach machines: simple examples on ML."
![Experiment with sample mean and variance](./smtb_ml.png#full-shadow)

**Summary:** The idea was to provide a glimpse into ML by discussing three
fundamental model types: predicting a number (linear regression), predicting a
yes-or-no answer (logistic regression), and predicting... whatever (neural
network). Each topic included a simple numerical illustration (such as this
three-node network above), and a simple-but-practically-reasonable exercise
(such as handwritten number recognition with MNIST dataset, using the same
logic, but more neurons and layers.)

**More details:** syllabus and methodological notes (including teaching materials / jupyter notebooks) are 👉 [here](https://github.com/alex-bochkarev/ML-SMTB-2022).

## Full index of other "teaching" notes
Below is a complete list of my other notes and materials related to teaching. Any feedback /
suggestions / corrections are very welcome!
