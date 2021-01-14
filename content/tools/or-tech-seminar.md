---
title: "💬 OR Tech Seminar: scope and logistics."
author: ["admin"]
date: 2021-01-14
lastmod: 2021-01-14T12:41:06+01:00
tags: ["tech-seminar"]
categories: ["tools"]
draft: false
summary: A quick note on OR Tech Seminar topics and logistics.
---

This is a (perhaps, temporary) note to discuss topics for "OR Tech Seminar"
organized being organized by [Clemson INFORMS Student Chapter](https://cecas.clemson.edu/informs/) (discussion within CU / Chapter,
but I guess the materials can be made available in public...).


## General notes / logistics. {#general-notes-logistics-dot}

I propose to discuss various tools (in a very broad sense) we, as researchers,
use -- to share experience, configs, and ideas. Ideally, we'd like to discuss
specific setups people use. I believe, lists of links/bookmarks should be
preferred to re-inventing the materials, unless we might significantly benefit
from some detailed consideration.

I would propose to agree on time around the first half of the day (Clemson
time), to hold a weekly or bi-weekly seminars via Zoom. I think it will be
completely okay if a seminar will be short (like, half an hour, plus-minus --
but depending on what we want from it). _(an announcement regarding specific
time will be here)_.

I will do my best to upload all the materials here. If you'd want anything
included, or have any other suggestions, please [let](mailto:tech-seminar@bochkarev.io) me know.


## Tentative list of topics. {#tentative-list-of-topics-dot}

1.  📰 **Working with the literature: tools and approaches.**
    -   Mostly discuss relevant software (Zotero, JabRef, Mendeley and friends, who
        uses what).
    -   some quick notes on latex/bibtex things.
    -   discuss monitoring the literature, etc.
    -   maybe discuss reading / journal club?..
    -   note-taking?
2.  💻 **A quick intro to Git**. Actually, **all things version-control**.
    -   Git, github, and the team.
    -   remote and local repos, commits, merge and conflicts, branches, etc.
    -   (There is a lot of materials out there, the purpose is to try to find a
        balance between "long-and-comprehensive" and "quick-basics-for-a-developer")
3.  🌧 **Surviving on the cloud-1:** surviving yourself.
    -   Moving around, editing stuff, saving preferences; command aliases, where to
        save preferences, pipes (`stdout` vs. `stderr`), maybe key utils (like `tar`) etc.
    -   Automating things: files, scripts, access rights (`chmod`). Very intro bash
        scripting.
4.  🌩 **Surviving on the cloud-2:** making it work for you.
    -   Logging into the cluster. Login shell vs. comp node.
    -   Moving things between remote and local machines (`scp`, `rsync`, `github`, what else?).
    -   Running jobs on the cluster: PBS basics; modules, file systems.
    -   Running things in parallel (a quick [GNU parallel](https://www.gnu.org/software/parallel/) demo).
    -   [Makefiles](https://en.wikipedia.org/wiki/Makefile), maybe? And how one can use these in research...


## Other topics TBD: {#other-topics-tbd}

1.  💻 **Couple of things about Python**: this is something I really do **not** want to
    discuss, unless there are specific people who would be interested.
    There is a lot of materials available out there on the Internet. I could make
    a list, though. Tentative topics might include:
    -   **Day 1: A quick intro to Python.** (Meet Jupyter notebook.) A demo of the
        syntax, vars/loops/comments (that’s important)/ maybe classes, etc. When to
        use (as opposed to C++, for example). Links to online courses.
    -   **Day 2: Solving optimization problems with Python.** Just a couple of
        examples. Language – package – solver. (try something really simple with
        Gurobi and/or CBC solver, I guess). Links to Gurobi manuals. Alternative
        (give an example in C++, if time permits).
2.  👓 **Selected topics on programming.** This is something I do not quite
    understand a structure for, but we could try to design a list of interesting
    topics:
    -   speeding up code: vectorized computations vs. loops, `map`, and such
        things. (I guess, might be a topic in Python, a lot of this would work out
        of the box in Julia... we'd need to decide which language(s) to focus on)
    -   recording runtimes (`time` package in Python, `%time` in Jupyter...)
    -   all things Jupyter? Extracting code, presenting from within Jupyter,
        publishing a notebook, ... I don't really like it, but if anyone is
        interested / has a lot to say, it might be interesting.
    -   maybe parallel computations in Julia? (or include this into the "cloud" topic above?)
    -   what else? Is it worth a separate discussion?
