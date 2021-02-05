---
title: "🔀 Version control with git."
author: ["Alexey Bochkarev"]
date: 2021-01-30
lastmod: 2021-02-05T01:45:30+01:00
tags: ["tech-seminar", "talk"]
categories: ["tools"]
draft: true
summary: A quick intro to version control with git.
---

<div class="note">

**Summary** <hr>

-   [backup](https://en.wikipedia.org/wiki/Backup): is protecting against data loss. So, _when_ your computer dies, you
    are not too far behind. Any sort of <span class="underline">regular</span> backup procedure helps.
-   **(our focus)** [version control](https://en.wikipedia.org/wiki/Version%5Fcontrol): is keeping track of changes in your files. So that you know
    what did you do, when, why, and can get back if needed. There are several
    tools, [git](https://git-scm.com/) is _very_ popular.
-   Think of it as a "protocol", and a (local) app that runs it. [GitHub](https://github.com) is
    the most popular website offering hosting of git repositories.
    (There are alternatives.)
-   Git is "distributed": you work in a local copy. So, it is fast, and can work
    offline[^fn:1].
-   It is especially good to track any sort of plain-text files (source code,
    latex documents, markdown, etc.).
-   It allows (and encourages) _branching_, when you keep several "lineages" of your
    code to test your ideas, while keeping a "clean" version easily available.
-   This note contains a brief overview and discusses a simple example of
    _individual_ (not collaborative) use.
-   There are **many** resources online. E.g. ["ProGit"](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup) is a good book.&nbsp;[^fn:2]
-   Working from a command line helps a lot to understand what's going on, but:
-   There are many excellent tools that help productivity:
    -   stand-alone clients ([Github Desktop](https://desktop.github.com/), [GitKraken](https://www.gitkraken.com/), etc.);
    -   some very good editor integrations -- in [VSCode](https://code.visualstudio.com/), [Atom](https://atom.io/), [Sublime](https://www.sublimetext.com), Emacs (see
        [Magit](https://magit.vc/)), or almost any other serious editor or IDE.

Corrections, suggestions, and comments are very [welcome](mailto:tech%5Fseminar@bochkarev.io).

</div>


## Introduction {#introduction}


### Some context {#some-context}

There are two somewhat adjacent problems: backups and version control. [Backup](https://en.wikipedia.org/wiki/Backup)
basically means making "snapshots" for further recovery. It is an essential part
of any IT infrastructure; it can be done with built-in tools (e.g., "time
machine" for Apple laptops), [borgbackup](https://borgbackup.readthedocs.io/en/stable/) or `rsync` the `/home` directory on
Linux, or anything else along these lines. I think the key is to have regular **procedure**.

Now, [version control systems](https://en.wikipedia.org/wiki/Version%5Fcontrol) are used to keep track of changes in your files.
    [Git](https://en.wikipedia.org/wiki/Git) is one of the most popular ones. Alternatives include [subversion (SVN)](https://en.wikipedia.org/wiki/Apache%5FSubversion),
    [mercurial](https://en.wikipedia.org/wiki/Mercurial), and [more](https://en.wikipedia.org/wiki/Comparison%5Fof%5Fversion-control%5Fsoftware). Further we will focus on version control and,
    specifically, git.

(_collaboration_ on code and other plain-text files is another topic, which
  happens to be addressed by git particularly well -- but this is out of the
  scope of this note.)

-   Issues
-   Fork, PR, wiki.


### Tools for today {#tools-for-today}

**1)** You would need to have **git** installed. Check from the command line:

```bash
git --version
```

which gave me:

```text
git version 2.27.0
```

If it did not work, start [here](https://git-scm.com/download). It works out of the box on my GNU/Linux
machine, but if I were to use other systems, I would look into [GitForWindows](https://gitforwindows.org/)
(see also a larger [tutorial](https://courses.cs.washington.edu/courses/cse154/20au/resources/assets/vscode-git-tutorial/windows/index.html)), or hoped that MacOS will suggest me to install
it automatically (or, e.g., try to `brew install git`, if not -- see [brew](https://brew.sh/)
for more details).

As pointed out in the [docs](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup), you would need to set your name and email (to be
associated with your changes in the code).

```bash
$ git config --global user.name "Your Name"
$ git config --global user.email YourName@example.com
$ git config --global init.defaultBranch main # set the name of the default branch
```

**2)** We will need a text editor, of course. Any one will work. I am using
[(Space)Emacs](https://www.spacemacs.org/) with [Magit](https://magit.vc/) on a daily basis, but it was more convenient to make
a demo on [VSCode](https://code.visualstudio.com/) ([-ium](https://vscodium.com/)) with a standard extension called _GitGraph_. Good
editors have plugins that support git well and simplify many operations. For
discussion here, I will show commands as issued from the command line, but I find
editor integration more convenient to use for most tasks.

**3)** It is convenient to see what is happening in our repo on **GitHub**, so I
   used an account there for the example below. I tend to use Github pretty
   extensively to keep a copy of my code online[^fn:3].


### On Git vs. Github {#on-git-vs-dot-github}

-   git is a _"protocol"_, a (distributed) version control system.
-   _distributed:_ so, you keep a local copy and work with it.
-   many providers offer hosting compatible with git protocol.
    Examples are:
    -   [github](https://github.com/)
    -   [gitlab](https://about.gitlab.com/)
    -   [bitbucket](https://bitbucket.org)
    -   there are more exotic options -- e.g., see [keybase.io](https://keybase.io/blog/encrypted-git-for-everyone)?
    -   you, if you'd like (e.g., see [gitea](https://gitea.io/en-us/));

<!--listend-->

-   another (important!) story: the social aspect
    (Github is the de-facto standard).
    -   Show your code.
    -   Collaborate.


### The big picture {#the-big-picture}

-   your project lives in a _repo_ (a home, y'know);
-   it is in fact just a folder with a special `.git` subfolder,
    where the magic happens.
-   there is "working area", "staging area", and
-   a very simple workflow would look as follows:

{{< figure src="/ox-hugo/workflow.svg" >}}

-   We will start with a command-line interface -- because it is
    instructive. It might help to use something else later.
    (preferably, within your editor).
-   People say, you might want to get back to the command line
    from time to time.


## Key concepts with a running example {#key-concepts-with-a-running-example}


### Basics {#basics}

Assume we would like to develop some code in Python (this will be our running
example). So, we create a folder and immediately initialize a repo:

```bash
git init
```

What happened, is it created a special directory, `.git`, that will contain
the information concerning the version history. Now, let us add some code and
save it as `new_doc.py`:

```python
print("Hello world")

for i in range(5):
	print("i=" + str(i))
```

Assume we have implemented some basic functionality, and would like to save a
snapshot of this state of the repo. Note that git "knows" that we have some changes:

```bash
git status
```

So, we first add the changes to the "staging area":

```bash
git add .
```

and then create a record in the versions history with:

```bash
git commit -m"first commit"
```

Let's say, we continue the development, and add more code, so that `new_doc.py` now reads:

```python
print("Hello world")

for i in range(5):
	for j in range(5):
		print("i=" + str(i)+", j=" + str(j))
```

We can add this change as well, in a similar way, issuing command `git add .`
(or `git add new_doc.py`, if we wanted to add this particular file only). Note that git
is aware of specific changes. We can highlight them by saying:

```bash
git diff
```

(Indeed, we replaced the `print` line with a `print` in an inner loop.)

We can finish the process, again, with the command:

```bash
git commit -m"inner loop"
```

```bash
git reset
```

will reset the staged area -- as the appearing help says, it does **not** delete
or alter any files, it just removes everything from the "stage area" (you can
then add everything, or part of it, back -- as usual, with `git add`).


### Fast-forward the example (key commands) {#fast-forward-the-example--key-commands}

-   a repo (local folder);
-   a remote (repo); `clone`.
-   `add`, `commit`, `push`;
-   `branch`, `checkout`, `merge`;
-   `pull`
-   `branch -d <branchName>`
    and `git push origin --delete branchName`.
-   resolving conflicts.
    -   create repo: `git init`
    -   create file
    -   check `git status`
    -   add changes: `git add`
    -   `git commit`
    -   edit files (vscode).
    -   see diff (`git diff`). commit
    -   add to github
    -   add readme
    -   push changes
    -   create branch
    -   list these `git branch`
    -   develop a feature.
    -   merge back
    -   introduce merge conflict
    -   resolve it
    -   introduce a conflict at Github.
    -   resolve it locally.
    -   git [tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging): `git tag -m"..." v1.0`
        and `git push --tags`.
    -   `git clone` example: local
        and remote


### Remote repo {#remote-repo}


### Branches {#branches}

So, the usual workflow is to have:

-   main branch
-   feature branches.
-   there is [more](https://nvie.com/posts/a-successful-git-branching-model/) info (with pictures).
    All of them: `git branch`
    Not merged into master: `git branch --no-merged master`

    ```bash
    $ git rev-parse --abbrev-ref HEAD # current branch
    $ git rev-parse HEAD # current commit
    ```

    e.g.

    ```bash
    tgs -m "I'm on branch $(git rev-parse --abbrev-ref HEAD), commit $(git rev-parse HEAD)"
    ```

    The history:

{{< figure src="/ox-hugo/versions-history.svg" >}}


### Resolving conflicts {#resolving-conflicts}


## Some tips, tricks, and notes {#some-tips-tricks-and-notes}


### Tags {#tags}


### Exploring the past {#exploring-the-past}

-   github -- points + blame
-   timeline in VSCode
-   cmd line
    First, get the list of commits:

<!--listend-->

```bash
$ git log --pretty=oneline --abbrev-commit
```

Then, knowing the commit:

```bash
$ git show REVISION:path/to/file > path_to_backup.copy
```

(it is `abbrev-commit` option to `git-log` that makes SHA-s short and
manageable. Note that you don't need to fill in all the 40 symbols anyways --
first several of them would suffice. Like, at least four, if it is unambiguous
-- see the [docs](https://git-scm.com/book/be/v2/Git-Tools-Revision-Selection)).

-   where did this figure come from?


### Ignoring files {#ignoring-files}


### Large files {#large-files}

-   there is a limit per file (I guess, 100Mb).
-   you don't need everything in the repo: `.gitignore`.
-   there is something called [git LFS](https://git-lfs.github.com/). (large file storage.)
    see also [GitHub docs](https://docs.github.com/en/github/managing-large-files/working-with-large-files) on large files.


## Further reading {#further-reading}

-   A repository ("repo"; think "project") lives in a folder on your hard drive.
-   The magic happens because there is a hidden folder called `.git`, where
    `git` (an application) keeps the data about versions, when you ask it to.
-   A repo may or may not have a "remote" counterpart (a "folder" on your, or
    someone else's computer).
-   Any file can be "tracked" by git (or ignored -- see also about a special
    `.gitignore` file).
-   Here are some key operations related to editing files locally:
    -   create a repo (`git init`);
    -   edit the code/latex/whatever text (in any text editor);
    -   mark some, or all your changes as a candidates for a new "node" in versions
        history (`git add <filename>`, or `git add .` for everything, or mark
        specific changes _within_ a file, if your editor supports it).
    -   create this new "node" in versions history (`git commit -m"<your one-line description>"`).

<!--listend-->

-   You can _branch_ history. Usually, you create a "feature" branch to test
    things. Then either forget it (going back to the "main" branch), or `merge` it
    to the master, to have everything in your "official" version of the code. See
    `git checkout -b` (to a _new_ branch), `git checkout` (existing branch), `git
      merge` (branches), `git branch --delete`


## Further reading and notes. {#further-reading-and-notes-dot}

-   interactive tutorials and other useful stuff: <https://try.github.io/>
-   [ProGit](https://git-scm.com/book/en/v2/Git-Basics-Tagging) book. (CC-BY-NC-SA 3.0)
-   A [visual](https://marklodato.github.io/visual-git-guide/index-en.html?no-svg) git reference.
-   git [primer](https://danielmiessler.com/study/git/).
-   other sources (these were from some reddit question, I guess.)
-   you might want to check out [r/git](https://www.reddit.com/r/git/).
-   version-controlling `.ipynb` -s is not that cool, but still useful.
    (there are some [notes](https://blog.reviewnb.com/jupyter-version-control/) out there -- but I do not use `.ipynb` actively)
-   visualizing `.ipynb` from github: see <https://nbviewer.jupyter.org/>
-   a quick note on GithubPages.
-   there is something called "submodules" (repo-in-a-repo).
-   the tool is **very** flexible, but I guess all problems
    have solutions discussed somewhere online...

[^fn:1]: Note that you do not need a Github account to work with git. I have several repos completely offline -- just to track versions locally. You do not loose anything this way, except collaboration features and an off-site backup.
[^fn:2]: There is also an extensive built-in help. E.g., see `git help everyday`, `git help gittutorial`, `git help git`, and others. Of course, there are all sorts of introductions, books, manuals, and cheatsheets out there.
[^fn:3]: Note that you can make a repo "private", so no one by default will have access, besides you. (see the [docs](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repository-visibility))
