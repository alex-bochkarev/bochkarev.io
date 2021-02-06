---
title: "🔀 Version control with git."
author: ["Alexey Bochkarev"]
date: 2021-01-30
lastmod: 2021-02-06T15:32:56+01:00
tags: ["tech-seminar", "talk"]
categories: ["tools"]
draft: false
summary: A quick intro to version control with git.

description: "A quick intro note on git (with a simple example)."
images:
  - "/images/git_conflict.png"
---

<div class="note">

**Summary** <hr> This is a note for someone far from software development, but
interested in tracking changes in source code and other text-based files. The
logic is built around a specific, trivial example.

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
-   There are **many** resources online. E.g. ["ProGit"](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup) is a good book.
-   Working from a command line helps a lot to understand what's going on, but:
-   There are many excellent tools that help productivity --
    -   stand-alone clients ([Github Desktop](https://desktop.github.com/), [GitKraken](https://www.gitkraken.com/), etc.);
    -   some very good editor integrations -- in [VSCode](https://code.visualstudio.com/), [Atom](https://atom.io/), [Sublime](https://www.sublimetext.com), Emacs (see
        [Magit](https://magit.vc/)), or almost any other serious editor or IDE.

Corrections, suggestions, and comments are very [welcome](mailto:tech%5Fseminar@bochkarev.io).

</div>


## Introduction {#introduction}


### Some context {#some-context}

There are two adjacent problems: backups and version control.

-   [Backup](https://en.wikipedia.org/wiki/Backup) basically means making "snapshots" for further recovery. I think the
    key is to have regular **procedure**, which any suitable tools: built-in software
    (e.g., "time machine" for Apple), [borgbackup](https://borgbackup.readthedocs.io/en/stable/), or just `rsync`, etc.
-   [version control systems](https://en.wikipedia.org/wiki/Version%5Fcontrol) are used to keep track of changes in your files.
    [Git](https://en.wikipedia.org/wiki/Git) is one of the most popular ones. Alternatives include [subversion (SVN)](https://en.wikipedia.org/wiki/Apache%5FSubversion),
    [mercurial](https://en.wikipedia.org/wiki/Mercurial), and [more](https://en.wikipedia.org/wiki/Comparison%5Fof%5Fversion-control%5Fsoftware). Further we will focus on version control and,
    specifically, git.

(_Collaboration_ on code and other plain-text files is another topic, which
    happens to be addressed particularly well by git -- but this is out of the
    scope of this note.)


### Tools for today {#tools-for-today}

**1)** You would need to have **git** installed. Check from the command line:

```bash
git --version
```

which gave me:

```text
git version 2.27.0
```

<details> <summary> [ What if not? ]</summary>

If it did not work, start [here](https://git-scm.com/download). It works out of the box on my GNU/Linux
machine, but if I were to use other systems, I would look into [GitForWindows](https://gitforwindows.org/)
(see also a larger [tutorial](https://courses.cs.washington.edu/courses/cse154/20au/resources/assets/vscode-git-tutorial/windows/index.html)), or hoped that MacOS will suggest me to install
it automatically (or, e.g., try to `brew install git`, if not -- see [brew](https://brew.sh/)
for more details).

</details>

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

**3)** It is convenient to see what is happening in our repo on [GitHub](https://pages.github.com/), so I
   used an account there for the example below. I tend to use Github pretty
   extensively to keep a copy of my code online[^fn:2].


### On Git vs. Github {#on-git-vs-dot-github}

Git is a version control system -- think a _"protocol"_. You work with a local
app (`git`) that tracks changes in your local folder. Many providers offer
_hosting_ compatible with git. Examples include [GitHub](https://github.com/), [GitLab](https://about.gitlab.com/), [BitBucket](https://bitbucket.org) and
others. Self-hosted options are available (e.g., see [gitea](https://gitea.io/en-us/) or GitLab).

Usually, third-party providers implement "social" tools as well:
to facilitate collaborations, comments, issue tracking, etc. And also just allow
to demonstrate what kind of code you write. I think GitHub is _de facto_
standard at the moment.


### The big picture {#the-big-picture}

A project lives in a repository (_"repo"_). In fact, it is just a folder with a
  special `.git` subfolder, where the magic happens. There is something called
  "working area", "staging area", and repositories:

{{< figure src="/images/ts-git/workflow.svg#notalink" link="/images/ts-git/workflow.svg#notalink" >}}


## Key concepts with a running example {#key-concepts-with-a-running-example}


### Basics: tracking changes {#basics-tracking-changes}

Assume we would like to develop some code in Python (this will be our running
example). So, we create a folder and immediately initialize a repo:

```bash
git init
```

Output:

```text
Initialized empty Git repository in /home/bochkarev/sandbox/demo-repo/.git/
```

It has created a special directory, `.git`, that will contain
the information concerning the history. Now, let us add some code and
save it as `new_doc.py`:

```python
print("Hello world")

for i in range(5):
	print("i=" + str(i))
```

Assume we have implemented some basic functionality, and would like to save a
snapshot of this state in the repo. Note that git "knows" that we have some
changes now:

```bash
git status
```

Output:

```text
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	new_doc.py

nothing added to commit but untracked files present (use "git add" to track)
```

So, as git suggests, we first add the changes to the "staging area":

```bash
git add .
```

Here the period `.` means "all files in the current directory" (we could have
used a specific filename instead). Now `git status` shows that we have "changes
to be committed" (saved to the versions history):

```bash
git status
```

Output:

```text
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   new_doc.py
```

We actually create a record in the versions history with:

```bash
git commit -m"first commit"
```

Output:

```text
[master (root-commit) de41445] first commit
 1 file changed, 4 insertions(+)
 create mode 100644 new_doc.py
```

Let's say, we continue the development, and add more code, so that `new_doc.py` now reads:

```python
print("Hello world")

for i in range(5):
	for j in range(5):
		print("i=" + str(i)+", j=" + str(j))
```

Note that git is aware of specific changes. We can highlight them by saying:

```bash
git diff
```

Output:

```text
diff --git a/new_doc.py b/new_doc.py
index fe46b97..105a3b3 100644
--- a/new_doc.py
+++ b/new_doc.py
@@ -1,4 +1,5 @@
 print("Hello world")

 for i in range(5):
-	print("i=" + str(i))
+    for j in range(5):
+        print("i=" + str(i)+", j=" + str(j))
```

Indeed, we replaced the `print` line with a `print` in an inner loop: removed
lines are indicated with a minus sign in the beginning, added lines marked with
plus. Of course, it is not necessary to stare at cryptic symbols in the shell:
e.g., VSCode will highlight these changes nicely, if you switch to "Version
Control" tab and choose the changed file (`new_doc.py`):

![Changes highlighted](/images/ts-git/2021-02-05_13-11-46_screenshot.png#full-shadow)

If we are happy with the changes, again, we add them to the "staging" area and
"commit" to the versions history with commands:

```bash
git add .
git commit -m"inner loop"
```

Output:

```text
[master acd00af] inner loop
 1 file changed, 2 insertions(+), 1 deletion(-)
```

Now, to see the commits history, we can issue:

```bash
git log
```

Output:

```text
commit acd00afdf4c0c0a3fa6f5229752f1807d4398688
Author: Alexey Bochkarev <a@bochkarev.io>
Date:   Fri Feb 5 13:15:56 2021 +0100

    inner loop

commit de41445c3b150488871ef8526b519488eda5ed26
Author: Alexey Bochkarev <a@bochkarev.io>
Date:   Fri Feb 5 13:05:17 2021 +0100

    first commit
```

Or, if we have a lot of these and want a quick overview, we might want them
in a compact form:

```bash
git log --pretty=oneline --abbrev-commit
```

Output:

```text
acd00af inner loop
de41445 first commit
```

Now, getting back to the commit `first commit` is as simple as `git checkout
de41445`. The repo will come back to the state at that moment, so we can look
around. For example, we could save something and get back with `git checkout
master`. Usually what I might want, however, is to fetch a specific file from a
specific commit into the current moment. I could do this with `git show
de41445:new_doc.py > old_version.py`. (After this command I will have another
file, `old_version.py`, with the contents of `new_doc.py` as of the moment of
the first commit). I will not use this file, so I will just remove it for now,
with `rm ./old_version.py`.

Experimenting and working with code is more often done with something
called _branching_.


### Branching {#branching}

So, one possible workflow is to have a "clean", main branch (say, "ready to
show to your supervisor"), and experiment in separate versions, merging back
those that worked out.

Assume we want to try to switch to nice unicode variable names (greek
letters). First, we create a new _branch_ for this feature:

```bash
git checkout -b unicode_vars
```

Now, `git status` gives:

```bash
git status
```

And the bottom left corner of my VSCodium editor also hints of the current
branch, like this:

![Branch name indicator](/images/ts-git/2021-02-05_16-38-40_screenshot.png#full-shadow)

Our previous state of the tracked files (one file in this case) was left in a
`master` branch, and we jumped into a separate code "spin-off". Let me
rename a variable, so `new_doc.py` now would look like:

```python
print("Hello world")

for ɑ in range(5):
    for j in range(5):
        print("ɑ=" + str(ɑ)+", j=" + str(j))

```

After we save the file, VSCode (or `git diff`) will highlight for us, what has
changed:

![Changes highlighted](/images/ts-git/2021-02-05_16-49-00_screenshot.png#full-shadow)

Again, we commit this change:

```bash
git add .
git commit -m"renamed variables"
```

Output:

```text
[unicode_vars 985d560] renamed variables
 1 file changed, 2 insertions(+), 2 deletions(-)
```

Assume we want to make some unrelated change now. (Suddenly! Or maybe because
we've got an email about this) E.g., remember that there is a more compact
syntax for printing strings in Python. So we go back to the main branch to edit
the file:

```bash
git checkout master
```

We are immediately back to the state we left when we made a spin-off, so we
change the file to become:

```python
print("Hello world")

for i in range(5):
    for j in range(5):
        print(f"i={i}, j={j}")

```

That's way more readable, so we "save" it into the master branch:

```bash
git diff # let's see the changes
git add .
git commit -m"improved code readability (printing strings)"
```

Output:

```text
diff --git a/new_doc.py b/new_doc.py
index 105a3b3..f288fa7 100644
--- a/new_doc.py
+++ b/new_doc.py
@@ -2,4 +2,5 @@ print("Hello world")

 for i in range(5):
     for j in range(5):
-        print("i=" + str(i)+", j=" + str(j))
+        print(f"i={i}, j={j}")
+
[master a6c0cc2] improved code readability (printing strings)
 1 file changed, 2 insertions(+), 1 deletion(-)
```

Okay, now we go back to work on our feature with `git checkout unicode_vars`.
Assume we test the feature with `python ./new_doc.py`, make sure it works, so we
want to integrate it back into the "main" branch of our code. To do this, we go
back to the `master` branch and try to merge it with the feature branch
(`unicode_vars`):

```bash
git checkout master
git merge unicode_vars
```

Output:

```text
Auto-merging new_doc.py
CONFLICT (content): Merge conflict in new_doc.py
Automatic merge failed; fix conflicts and then commit the result.
```

We have created a _conflict_: edited the same line in both branches, and there
is no way to resolve it automatically. This is a normal situation, and the
source file now looks as follows:

{{< highlight python "hl_lines=3" >}}
print("Hello world")

for ɑ in range(5):
    for j in range(5):
<<<<<<< HEAD
        print(f"i={i}, j={j}")

=======
        print("ɑ=" + str(ɑ)+", j=" + str(j))
>>>>>>> unicode_vars

{{< /highlight >}}

This is pretty self-explanatory, but notice what has just happened. A change in
the highlighted line was straightforward to make, so git did it for us
automatically. Since `print` instruction was edited in both branches, we'd
need to edit it manually (with any editor) to our taste. Note that VSCodium
allows convenience of "Accept Change"-like buttons (which we wouldn't use in
this case, though):

![Changes highlighted](/images/ts-git/2021-02-05_17-10-50_screenshot.png#full-shadow)

After the edits, the resulting file is:

```python
print("Hello world")

for ɑ in range(5):
    for j in range(5):
        print("ɑ={ɑ}, j={j}")

```

Following the instructions, we add and commit the changes initiated by `merge`
as usual:

```bash
git add .
git commit -m"merged 'unicode variables' feature"
```

Output:

```text
[master 1c7dd06] merged 'unicode variables' feature
```

So, again, what we have just done: we created a spin-off branch, tried to
implement a feature, introduced some changes into the "main" code along the way,
and merged everything back successfully. Many tools, including VSCode, can show
nice figures to illustrate what is going on:

![Changes highlighted](/images/ts-git/2021-02-05_17-21-45_screenshot.png#full-shadow)

Each point here is a commit (a "snapshot" of the state for tracked files). We
created a separate branch, then our branches diverged due to the two conflicting
commits, and then we merged everything back at the very top commit, `1c7dd06a`.

An alternative solution would be to try to _"replay"_ the changes from
`unicode_vars` branch on top of the changes in `master`, as if it were based
on _already updated `master`_ -- see git [rebase](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) for details.

You can check what branches are there with:

```bash
git branch
```

Output:

```text
* master
  unicode_vars
```

To show just branches not merged into the main branch: `git branch
--no-merged master`. Branches that are no longer needed can be deleted with
`git branch -d <branch-name>`.

There are some materials on branching strategies and git workflows (e.g., on
["git-flow"](https://nvie.com/posts/a-successful-git-branching-model/) and [GitHub flow](https://guides.github.com/introduction/flow/), with the latter being focused on simple
collaboration) -- but this discussion looked somewhat too complicated for my
own needs at the moment.


### Dealing with a remote repo {#dealing-with-a-remote-repo}

Even if you work alone on your code, you might still want to use a concept of
remote repos. For example, if you are running separate experiments on the
cluster and would like to (1) keep them under version control, and (2) run
them in parallel. But let us consider another (perhaps, more general) common
use case, when you would like to sync your local repo with a remote version
on Github -- e.g., to keep things backed up online, or to share code.

Creating a remote GitHub repo is simple. Assume we have a _local_ repository
first (the one we discussed above would work). We go ahead and [create a
Github repo](https://docs.github.com/en/github/getting-started-with-github/create-a-repo) (not initializing it with anything). Essentially, Github will
give you both the address and commands to use to connect your local repo with
its remote counterpart. Afterwards, a _remote_ will act mostly as another
_branch(es)_. You could `pull` changes to your local repo from the remote,
`push` your local changes back to the remote, and so on. For example:

-   `git remote add origin <Github-address>` will make git aware of the specific
    remote repo, and will call this remote repo `origin`.
-   alternatively, for an existing _remote_ repo, which you would like to have in
    your local folder, you issue `git clone <repo-address>`.
-   `git push -u origin master` will push your local changes from `master` branch
    to `origin` (on a Github server).
-   `git pull` will try to pull changes from the remote (assigned by the previous
    `push -u` command) and `merge` it into the current branch.[^fn:3]

A repository on the Github can be market as "public", so that anyone would be
able to see the code (see [a note on visibility](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repository-visibility) from Github). For example,
source code for this website is available at
<https://github.com/alex-bochkarev/bochkarev.io>. You can create `README` file,
so it will be shown by default when someone opens your repository (and it is a
good practice to create one, describing what is this repo about, how to
contribute, etc. -- at least very briefly. See [About READMEs](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-readmes)). Perhaps, the
most widespread format is `.md` in [(Github's) Markdown](https://guides.github.com/features/mastering-markdown/), but there is [more](https://github.com/github/markup/blob/master/README.md#markups).


## Some tips, tricks, and notes {#some-tips-tricks-and-notes}


### Adding changes {#adding-changes}

Interestingly, you can not only add _changed files_ to a commit, but pick
specific changes _within_ a file -- if you happened to make two logically
different edits and would like to keep them in different commits. For
example, in VSCode you can pick ("stage") specific changes in the main editor
window by pressing this "plus" sign:

![Changes highlighted](/images/ts-git/indiv_changes.png#full-shadow)

 If you happened to `git add` something wrong, you can always `git reset`. It
will not **not** alter any files, but remove everything from the
"stage area", so you can start staging again.


### Tags {#tags}

Sometimes I want to mark certain commit with a meaningful comment -- to be
able to get back to this version quickly, if needed. See git [tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging): `git tag
  -m"Submitted to the journal" v1.0` followed by `git push --tags` will create a
tag `v1.0` with a comment `Submitted to the journal` and push it to a remote.
Now, you can, e.g.:

-   quickly get back to this version with `git checkout v1.0`.
-   click "Tags" button on Github, choose `v1.0` and download a `.zip` file with
    this version.


### Exploring the past {#exploring-the-past}

Sometimes it is handy to browse through past versions of the code. Apart from
the `git log` and `git checkout` mentioned above, the Github interface might
help. Note that you can click on any commit there and browse the repo (in a
web browser) as it was back then.

An overview for changes in a specific file with contributors can be called
with "History" or "Blame" buttons (see also [git-blame](https://git-scm.com/docs/git-blame) docs). Note that Github
web interface shows `master` / `main` branch by default, but you can choose
any branch/tag/commit to explore. It helps sometimes to answer questions like
"where have this figure come from? Which version of my code?..".

Sometimes it is also handy to have the current commit and branch (automatically
-- e.g., to include into a log file). The following commands might help:

```bash
git rev-parse --abbrev-ref HEAD # current branch
git rev-parse HEAD # current commit
```

Output:

```text
master
1c7dd06adb46c63e2706babd2500c040e934d80e
```


### Ignoring files {#ignoring-files}

Sometimes you want to issue a simple `git add .` command, but do not want
some files to be tracked at all. Maybe some backup files, the ones related to
personal configurations that have nothing to do with the "public" repo, large
problem instances, intermediary results, auxiliary things (`__pycache__` for
python projects, etc.). To do this, just add a special `.gitignore` file with
file names (can include wildcards). See also [ProGit](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#%5Fignoring), [GitHub docs](https://docs.github.com/en/github/using-git/ignoring-files), and
some [examples](https://github.com/github/gitignore).


### Large files {#large-files}

As a special case, there is a problem of large files. GitHub imposes a [strict
limit](https://docs.github.com/en/github/managing-large-files/what-is-my-disk-quota) on file sizes of 100 Mb per file (as of writing this). I do not know a
good solution to this problem, but:

1.  **The key point:** It is questionable if 100 Mb+ files and/or binary files
    really _need_ text-based version control. See `.gitignore` above.
2.  There is something called [git LFS](https://git-lfs.github.com/) (Large file storage.) I tried to use it
    once: seemed convenient, but I had a feeling that I am out of control
    regarding my current quotas, etc. So I decided for myself to avoid it
    whenever possible.
3.  See also [GitHub docs](https://docs.github.com/en/github/managing-large-files/working-with-large-files) on large files.
4.  It seems like there is an attempt to solve this problem specifically for
    ML projects called [Data Version Control (DVC)](https://dvc.org/). See also Dolt and their
    [blogpost on "GitHub for data"](https://www.dolthub.com/blog/2020-03-06-so-you-want-git-for-data/). These caught my eye, but I have no
    first-hand experience.
5.  Please, [let](/contact/) me know if you are aware of any good solution, especially
    relevant to OR / DataScience.


### Jupyter notebooks {#jupyter-notebooks}

  I do not use `.ipynb` actively at the moment, so I can't give any good
recommendations. First, I do not know any good solution to version-control
[Jupyter](https://jupyter.org/) notebooks. Git is still useful, since `.ipynb` are basically text files,
just does not allow to see differences conveniently. ([A note](https://blog.reviewnb.com/jupyter-version-control/) on this.)

 Note that Github is not always best even with _showing_ (rendering) the
notebooks. It might help to use a separate solution to link your notebooks
hosted on Gihtub -- e.g., see <https://nbviewer.jupyter.org/>. Google Colab also
[offers](https://colab.research.google.com/github/googlecolab/colabtools/blob/master/notebooks/colab-github-demo.ipynb) loading public notebooks from Github (as I write this). If you
specifically need _executing_ notebooks online, you might be better off looking
into [Google Colab](https://colab.research.google.com/github/googlecolab/colabtools/blob/master/notebooks/colab-github-demo.ipynb) or [binder](https://mybinder.org/).


### Submodules {#submodules}

If you ever find yourself in need of a "repo-in-a-repo" (e.g., when you use a
library that you'd like to version-control separately) -- see [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).


### Github Pages {#github-pages}

Github offers a simple website hosting integrated with git -- for projects
and/or personal webpages. See [GithubPages](https://pages.github.com/) for up to date details.


### Collaboration and Github {#collaboration-and-github}

This is basically outside of this note's scope, but of course, possible
collaborations and social interactions are strong points of Github.

-   You can ["fork"](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) a repository easily (to work locally and, perhaps, propose
    contributions back); a simple [Hello World](https://guides.github.com/activities/hello-world/) tutorial might help.
-   There is an [issue-tracking](https://guides.github.com/features/issues/) mechanism and per-project [Wiki](https://docs.github.com/en/github/building-a-strong-community/about-wikis).
-   and so on. Again, there is a large, separate topic.


## Further reading {#further-reading}

-   [ProGit](https://git-scm.com/book/en/v2/Git-Basics-Tagging) book.
-   [Github Guides](https://guides.github.com/introduction/flow/).
-   Many other resources to choose from. Some random examples:
    -   some interactive tutorials: <https://try.github.io/>
    -   A [visual](https://marklodato.github.io/visual-git-guide/index-en.html?no-svg) git reference.
    -   A git [primer](https://danielmiessler.com/study/git/).
    -   [r/git](https://www.reddit.com/r/git/) community on Reddit (see the "sidebar"!)

<!--listend-->

-   An extensive built-in help. E.g., see `git help everyday`, `git help
      gittutorial`, `git help git`, and others.

[^fn:1]: Note that you do not need a Github account to work with git. I have several repos completely offline -- just to track versions locally. You do not loose anything this way, except collaboration features and an off-site backup.
[^fn:2]: Note that you can make a repo "private", so no one by default will have access, besides you. (see the [docs](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repository-visibility))
[^fn:3]: Note that you can edit files directly on Github, via a web interface. It will just create commits on the respective branch of the _remote_ repo.
