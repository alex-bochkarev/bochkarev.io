---
title: "My programming stack"
author: ["admin"]
date: 2021-09-27
lastmod: 2021-09-27T01:03:18-04:00
categories: ["notes"]
draft: false
summary: A brief summary of the core software stack I use for research.

---

I am not a software engineer, but we do a lot of programming and computational
work in OR/IE. I like to have a GNU/Linux system as a basis, and on top of that:

-   For [research](/research/), quick prototyping, and teaching illustrations I have been mostly using python (and, more recently, [Julia](https://julialang.org/)). Conceptually, I am pretty comfortable with OOP, but have limited exposure to FP.
-   I really like R/[ggplot](https://ggplot2.tidyverse.org/)/[tidyverse](https://www.tidyverse.org/) in general for quick visualization and exploratory data analysis (see code [example](https://github.com/alex-bochkarev/dotplot-gen)),
-   For high performance computing I use a comp cluster with Portable Batch System (PBS) along with `bash` and `make` as a "glue" in my computing (see a small [example](https://github.com/alex-bochkarev/tgs-curl) and related [note](https://www.bochkarev.io/tools/cluster-msg/)).
-   For a high-performance code, besides Julia, I would go with C++ or Java. (My last experience involved implementing [Ellipsoid method](https://en.wikipedia.org/wiki/Ellipsoid%5Fmethod) for LPs as a [course project](https://github.com/alex-bochkarev/MATH8100%5FProject).)
-   I don't really like Jupyter notebooks due to complicated version control, but I must admit it might be handy, and I had some success with it for [teaching](/teaching/) (e.g., see [notebook/lecture example](https://nbviewer.jupyter.org/github/alex-bochkarev/Algo-SMTB-2021/blob/main/T1-2-Algorithms.ipynb))

This is the core, but of course a lot is determined by the problem at hand. Note that I shared some more thoughts on "general toolbox" in a [dedicated seminar](https://www.bochkarev.io/edu/or-tech-seminar/) we run in early 2021, and some smaller notes are indexed in ["Misc notes"](/notes/) section.
