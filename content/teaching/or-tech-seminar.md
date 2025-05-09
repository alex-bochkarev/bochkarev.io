---
title: "💬 OR Tech Seminar: outline"
author: ["Alexey Bochkarev"]
date: 2021-01-14
lastmod: 2021-09-28T22:33:00-04:00
tags: ["tech-seminar"]
categories: ["teaching"]
draft: false
summary: A quick note on OR Tech Seminar topics and logistics.
hidetoc: t

description: "OR Tech Seminar with CU INFORMS Student Chapter: an outline."
images:
  - "/images/TechSeminar_logo.png"
  
links:
- icon: "i-play"
  name: "Video"
  url: "https://clemson.box.com/s/p75mzqb9sfw5u2my61axi15qqzu8y4nc"

aliases:
  - /edu/or-tech-seminar/
  - /tools/or-tech-seminar/

hide_from_list: true
---

{{< figure src="/images/TechSeminar_logo.png" >}}

This is an overview page for "OR Tech Seminar" organized with support from
[Clemson INFORMS Student Chapter](https://cecas.clemson.edu/informs/). The core discussion (Mondays, 10-00 AM EST) is
finished, unless we decide there are more topics we would like to talk about.

Some more notes will be posted here soon. (Clemson login is required to access
the [recordings](https://clemson.box.com/s/p75mzqb9sfw5u2my61axi15qqzu8y4nc).) Comments and suggestions are very [welcome](mailto:tech%5Fseminar@bochkarev.io) -- both on past and
possible future seminars.


## The format {#the-format}

We will be discussing various tools (in a very broad sense) we, as
researchers, use -- to share experience, configs, and ideas. Each seminar will
consist of a speaker presentation with a discussion along the way, at most
one hour in total. <br/> <br/>


## Core discussion {#core-discussion}

1.  📰 **Working with the literature:** tools and approaches. (2021-01-25)
       <a class="sticker" href="/notes/ts-literature/">&nbsp;Summary&nbsp;</a>
    -   Managing references (Zotero, JabRef, Mendeley and friends).
    -   Using the literature: latex/bibtex, editors, etc. (very brief)
    -   Discovering the literature (feeds, mailing lists, etc.)
    -   A note on notes.
2.  **🔀 Version-control:** a quick intro to Git. (2021-02-01)
       <a class="sticker" href="/notes/ts-git/">&nbsp;Summary&nbsp;</a>
    -   Version control, backups, when to use (always!)
    -   Git, github, and the team.
    -   Repositories (remote, local). Create, fork, `clone`, and other spells.
    -   Keeping track of your code/text: `add`, `commit`, `push/pull`.
    -   Workflow / branches -- `checkout, merge`, rebasing, conflicts.
3.  🌧 **(Cloud) The Command Line.** (Two seminars: 2021-02-08 and 2021-02-15)
    Notes on the cluster / working in the shell:
    -   logging in / comp nodes vs. login shell, a note on file systems.
    -   Moving things between remote and local machines (`scp`, `rsync`, `github`, etc.).
    -   Shell-related basics (moving around, editing, installing things, etc.).
    -   Running things: commands, aliases, pipes, `stdout/stderr`, scripts,
        access rights (`chmod`). Very intro bash scripting.
    -   Some utils (`tar`, `head`, `tail`, `split`, `shuf`, etc.)
    -   Running jobs on the cluster: PBS basics; modules.
    -   Running things in parallel (a quick [GNU parallel](https://www.gnu.org/software/parallel/) demo, etc.).
    -   Possibly, [Makefiles](https://en.wikipedia.org/wiki/Makefile).


## Additional topics (work in progress) {#additional-topics--work-in-progress}

1.  💻 **Introductory materials on Python**:
    -   Syntax basics / learning resources.
    -   Versions, environments, managing packages (`conda`, `pip`)
    -   Jupyter notebooks (extracting code, presenting, exporting, JupyterHub,
        etc. A word on alternatives)
    -   Optimization in Python (with [Gurobi](https://www.gurobi.com/) solver and `gurobipy`) -- a quick example.
    -   A word on scripting in Python (maybe a quick example).
    -   Further reading.
2.  💻 **Selected materials on Julia**. Note: we have a collection of materials on
    different topics related to [Julia](https://julialang.org/) from the previous year seminars by [Murwan
    Siddig](https://msiddig.people.clemson.edu/) -- see his  <a href="https://github.com/murwansiddig/Julia_tutorials">Julia tutorials</a> repo.
3.  👓 **Selected topics on programming.**
    -   Speeding up code in Python: special libraries, loops, vectorized computations, `map`,
        etc.
    -   "Profiling" python code ("what's so slow?")
    -   ... and in Julia: very brief notes on parallel computations and precompiling.
