---
title: "A Practical Introduction to Probability Theory (minicourse)"
author: ["admin"]
date: 2021-09-25
lastmod: 2021-09-27T01:56:42-04:00
tags: ["SMTB", "talk", "course"]
categories: ["teaching"]
draft: false
summary: This is a quick numerical intro to probability theory in the form of a mini-course, four one-hour sessions. Designed for [SMTB](https://molbioschool.org/en/) and Puschino Winter School in 2021. Discussing mathematical models for random things from the perspective of numerical examples in Python.

links:
- icon: "i-gh"
  name: "Syllabus (ENG)"
  url: "https://github.com/alex-bochkarev/Probs-SMTB-2021"
- icon: "i-gh"
  name: "Syllabus (RUS)"
  url: "https://github.com/alex-bochkarev/zpsh-21-probs"
aliases:
  - /edu/smtb-prob/
---

<div class="note">

Course materials for [School of Molecular and Theoretical Biology](https://molbioschool.org/en) and Puschino Winter School 2021.

**Key idea:** build a very brief introduction to probability theory by modeling random events in Python, trying to analyze them empirically, and introduce theoretical concepts when they become necessary as we proceed.

This note describes the general logic and background of the course, teaching
materials are available via the links above. Comments / questions / suggestions are very welcome!

</div>


## Revisions {#revisions}

-   `Version 1:` Russian, for Puschino Winter School (2021)
-   `Version 2:` English and Russian, for SMTB (2021)


## Background {#background}

  The idea of using numerical experiments to illustrate the concepts of
probability is certainly not new (see, e.g., a great introduction ["Seeing
Theory"](https://seeing-theory.brown.edu/index.html#firstPage) by the team from Brown University). However, I wanted to _model_ the
events explicitly in Python, in a more "Industrial Engineering" way, if you
will. I still had to resort to many pretty standard "blackboard" discussions,
but I am satisfied with the amount of Python code I was able to introduce into
the discusson 😄.

Another cornerstone of the course was that it was focused on _theory_. So, the key objective was not to teach how to solve simple problems, but to give some intuition on the key concepts from probability theory, how and "why" they work like this.


## Prerequisites and learning objectives {#prerequisites-and-learning-objectives}

The course was designed for students comfortable with the basic school math,
and curious to learn more. Ability to _write_ code in Python seemed not
strictly necessary, but of course they were assumed not to be afraid of the
programming per se.

The objective was to mention, and give some intuition stemming from the numerical illustrations on the concepts of: random events/experiments, probability (from a frequentist perspective) and probability space, dependent and independent events, conditional probability, (discrete) random variables, excpectation and variance.

As a separate point, I wanted to introduce a concept of Probability Space: of course, without diving into _all_ the details of sigma-algebras and such, but at least explaining _why we need it_ at all.

While it is obviously impossible to establish a solid command of the material during such short time (and without "proper" home assignments), I hope that the students walked away with intuitive understanding of some of the key concepts, interested and pretty well prepared to learn more in a standard university course.


## Course organization {#course-organization}

The course was organized into three key topics and an additional, last one:

-   A model for random events.
-   Independence, tests, and Co.
-   Discrete random variables.
-   Continuous random variables (\*)

(\*) We did succeed discussing some new concepts, but the exposition would objectively benefit from at least another hour.

See the full [course outline](https://github.com/alex-bochkarev/Probs-SMTB-2021) for details.


## Technical details {#technical-details}

The course was delivered online. We worked with the
code for a noticeable share of the time, so I presented the material
directly from [Jupyter notebook](https://jupyter.org/) with [RISE](https://rise.readthedocs.io/en/stable/) plugin (which produced [Reveal.js](https://revealjs.com/)
slides on the fly). Running code interactively and changing parameters allowed to make
some nice illustrations on the concept of probability as a "long-term
frequency", "two/three-sigmas", and such.

I used the built-in "chalkbord" within Jupyter most of the time: sometimes it
was really handy to write on top of the slides, such as during the discussion
of the "histogram" concept. For some worked examples I switched to another
program, [Xournal++](https://github.com/xournalpp/xournalpp): a cross-platform, FOSS (GPLv2), and just very convenient
one. Allowed for a lot of flexibility in drawing using a simple graphical
tablet (page backgrounds, sizes, colors, etc.) and saved the resulting pages
as PDFs.
