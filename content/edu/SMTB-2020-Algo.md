---
title: "(Talk) A Glimpse into Algorithms"
author: ["admin"]
date: 2020-07-29
lastmod: 2021-01-28T15:06:45+01:00
tags: ["SMTB", "talk"]
categories: ["edu"]
draft: false
summary: This is a talk presented to high-school students during [SMTB](https://molbioschool.org/en/)-2020. Quick numerical illustrations for runtime, correctness and such fun things.
hidetoc: t

links:
- icon: "i-gh"
  name: "Repo"
  url: "https://github.com/alex-bochkarev/SMTB-Algo"
- icon: "i-ipynb"
  name: "View notebook"
  url: "https://nbviewer.jupyter.org/github/alex-bochkarev/SMTB-Algo/blob/master/2020-07_SMTB_Algo_AB.ipynb"
---

This was a (slightly more than) one-hour lecture for high-school students during
the wonderful [School of Molecular and Theoretical Biology](https://molbioschool.org/en) in 2020. I wanted to
experiment with a couple of things, both in terms of content and the tech.


## On the content {#on-the-content}

I wanted to take some simple, easy-to-present example of an algorithm
(sorting! what else?..) and illustrate the notion of asymptotic runtime
_numerically_. It turned out to be pretty fun to do with Python, as I (humbly)
think. It was pretty close to pseudocode, I suppose. Along the way we
discussed _correctness_ and ways to test an implementation against a set of
random instances. It already barely fit into an hour timeframe.

The second part of the talk was devoted to a brief discussion of data
structures -- also with numerical illustrations of lists and linked lists (and
insertion time).

As usual, comments are very [welcome](/contact).


## On the tech {#on-the-tech}

I tried to present from [Jupyter notebook](https://jupyter.org/) with [RISE](https://rise.readthedocs.io/en/stable/) plugin, which produced
  pretty fancy [Reveal.js](https://revealjs.com/) slides. But the most important part is that this setting
  allowed me to run code interactively and tweak things interactively, which
  of course was very useful in a talk devoted to algorithms.
