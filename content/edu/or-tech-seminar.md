---
title: "💬 OR Tech Seminar: outline"
author: ["Alexey Bochkarev"]
date: 2021-01-14
lastmod: 2021-01-24T10:15:36+01:00
tags: ["tech-seminar"]
categories: ["tools", "edu"]
draft: false
summary: A quick note on OR Tech Seminar topics and logistics.
aliases:
  - /tools/or-tech-seminar
---

{{< figure src="/images/TechSeminar_logo.png" >}}

This is an overview page for "OR Tech Seminar" organized with support from
[Clemson INFORMS Student Chapter](https://cecas.clemson.edu/informs/). Date and time[^fn:1] for specific events will be posted here
once agreed upon. All materials will be also linked from the seminar descriptions
below. Everything is subject to change. Comments and
suggestions are very [welcome](mailto:tech%5Fseminar@bochkarev.io).

<br/>

| Where  | When                          |
|--------|-------------------------------|
| Online | Weekly, Mondays, 10-00 AM EST |


## The format {#the-format}

We will be discussing various tools (in a very broad sense) we, as
researchers, use -- to share experience, configs, and ideas. Each seminar will
consist of a speaker presentation with a discussion along the way, at most
one hour in total.


## Core discussion {#core-discussion}

1.  <span class="timestamp-wrapper"><span class="timestamp">[2021-01-25 Mon 10:00]</span></span>: 📰 **Working with the literature:** tools and approaches.
    -   Managing references: relevant software (**Zotero**, JabRef, Mendeley and friends).
    -   Using the literature: latex/bibtex, editor integrations, etc. (very brief)
    -   Discovering the literature: how to? (feeds, mailing lists, reading club, etc.)
    -   A note on notes.
2.  💻 **All things version-control:** a quick intro to Git.
    -   Version control, backups, when to use (always!)
    -   Git, github, and the team.
    -   Repositories (remote, local). Create, fork, clone, and other spells.
    -   Keeping track of your code/text-1: stage, commit, push, pull.
    -   Keeping track of your code/text-2: branches -- branch, merge, rebase, resolving conflicts.
    -   General tips and further reading.
3.  🌧 **(Cloud) The Command Line - 1:** Surviving on the cloud.
    -   Logging in to the cluster. Login shell vs. comp node. Bash-related basics
        (moving around, editing, installing things, etc.).
    -   Running things: commands, aliases, pipes, `stdout/stderr`, scripts,
        access rights (`chmod`). Very intro bash scripting.
    -   Some utils (`tar`, `head`, `tail`, `split`, `shuf`, etc.)
4.  🌩 **(Cloud) The Command Line - 2:** making it work for you.
    -   Moving things between remote and local machines (`scp`, `rsync`, `github`, etc.).
    -   Running jobs on the cluster: PBS basics; modules, file systems.
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

[^fn:1]: Clemson local time.
