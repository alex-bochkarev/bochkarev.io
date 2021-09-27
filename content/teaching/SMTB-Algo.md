---
title: "A Glimpse into Algorithms (minicourse)"
author: ["admin"]
date: 2020-07-29
lastmod: 2021-09-27T01:21:28-04:00
tags: ["SMTB", "talk", "course"]
categories: ["teaching"]
draft: false
summary: This is a quick computational intro to algorithms and data structures in the form of a mini-course, four one-hour sessions. Designed and presented for [SMTB](https://molbioschool.org/en/) in 2020 and 2021. Quick numerical illustrations for runtime, correctness, and other such fun things.

links:
- icon: "i-gh"
  name: "Syllabus (2021)"
  url: "https://github.com/alex-bochkarev/Algo-SMTB-2021"
- icon: "i-ipynb"
  name: "Notebook (2020)"
  url: "https://nbviewer.jupyter.org/github/alex-bochkarev/SMTB-Algo/blob/master/2020-07_SMTB_Algo_AB.ipynb"

aliases:
  - /edu/smtb-algo/
---

<div class="note">

Course materials for [School of Molecular and Theoretical Biology](https://molbioschool.org/en).

**Key idea:** to build an overview of some key concepts from computational
examples (in Python): to talk about algorithms, their correctness, asymptotic
runtime, space requirements, "scientific" analysis of algorithms, and data
structures in general.

This note describes the general logic and background of the course, teaching
materials are available via the links above. Comments / questions / suggestions are, as usual, very welcome!

</div>


## Revisions {#revisions}

-   `Version 1, Workshop (2020):` ca. 2 hours session, online. Russian (presentation) / English (materials),
-   `Version 2, Minicourse (2021):` four sessions, one hour each, online. Russian and English (materials in English only).


## Background {#background}

   This is an attempt to think about the matter from the
"experimental" perspective. For example, when discussing the asymptotic runtime,
people want to know that "this is slow" and "this is fast", but we use a
definition that allows to hide an arbitrary constant in it 🤷! This _is_ usually
pretty practical, just takes time to sink in. Why don't we just measure
"runtime" of an algorithm in seconds, with, you know, `time` function? So, my
purpose was to pick specific examples (in Python) and _show_ why a simple
stopwatch won't work, and try to derive better ways of measuring runtime. I
found that looking at an actual code of a simple algorithm did help the
discussion of more general concepts.


## Prerequisites and learning objectives {#prerequisites-and-learning-objectives}

The course did not assume any serious background in CS, but it was designed with a specific student in mind. Someone who is not _afraid_ of the code, but is still lost in how to analyze it and, ultimately, how to design it. The purpose was to give an intuitive understanding of:

-   the fact that algorithms and data structures can and should be analyzed in a systematic, scientific manner;
-   what is correctness, why and how to think about it (testing the code, finding counterexamples, proving correctness);
-   what are some key approaches to discussing runtime; what is O(·) notation;
-   what are "complexity classes";
-   the fact that there are different approaches to _designing_ an algorithm.
-   what is Dynamic Programming and how does global sequence alignment works (conceptually),
-   why data structures are important (even if you don't want to be a software engineer).

It seems impossible to lay a solid foundation in just four sessions, but I do hope that after the course the students were ready to pick up a good book or proceed with a course discussing these concepts in proper detail, and well equipped to succeed in such further learning.


## Course organization {#course-organization}

The course was organized into three blocks (the first one taking two hours):

-   Discussion of the concepts of correctness, time, and space properties, having sorting algorithms as the working example. We also discussed some patterns of designing algorithms: divide and conquer, greedy, etc.
-   A concept of dynamic programming and a specific example of such algorithm. (Due to the School's emphasis on Biology, folks were interested in sequence alignment algorithms.)
-   Introduction of data structures, very briefly comparing runtimes for different operations over arrays, linked lists, and dictionaries[^fn:1]

See the full [course outline](https://github.com/alex-bochkarev/Algo-SMTB-2021) for details.


## Technical details {#technical-details}

The course was delivered online. The central idea required working with the
code most of the time, so I presented the material directly from [Jupyter
notebook](https://jupyter.org/) with [RISE](https://rise.readthedocs.io/en/stable/) plugin (which produced [Reveal.js](https://revealjs.com/) slides). This allowed me
to run code interactively, change parameters, comment/uncomment lines, and
observe what is going on.

The built-in "chalkboard" feature also proved to be very convenient: for
writing on top of the slides or on a clean blackboard (using a simple
drawing tablet).

[^fn:1]: of course, without any real discussion of hash tables --- it was barely enough time even so.
