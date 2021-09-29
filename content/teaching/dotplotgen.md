---
title: Dotplot sample generation utility
categories: ["teaching"]
tags: ["bioinformatics"]
date: 2019-05-20
summary: A utility to facilitate the discussion of the [dot-plot](https://en.wikipedia.org/wiki/Dot_plot_(bioinformatics)) concept. Written in R with ggplot.
links:
  - icon: i-gh
    name: "Source"
    url: "https://github.com/alex-bochkarev/dotplot-gen"
---

In bioinformatics, there is a special type of graph that is sometimes used to
compare two sequences, that is called a
[dot-plot](https://en.wikipedia.org/wiki/Dot_plot_(bioinformatics)). I have
written a tiny R script to randomly generate such graphs / event sequences (in
fact, a simple wrapper around `ggplot2` and co.). Please see
[github](https://github.com/alex-bochkarev/dotplot-gen) for details.
