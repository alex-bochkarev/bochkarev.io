---
title: "📰 Working with the literature: tools and approaches"
author: ["Alexey Bochkarev"]
date: 2021-01-15
lastmod: 2021-01-24T11:47:48+01:00
tags: ["tech-seminar"]
categories: ["tools"]
draft: true
summary: "A collection of notes on literature: discovery, reading, keeping track of references, and using them in writing."
---

## Introduction {#introduction}

I would like to discuss the _problem_, i.e. requirements to an IT system
supporting my basic workflow, and then the _solution_ that worked for me. It
may or may not work for _you_ of course, but hopefully will provide some
inputs to design your own IT "ecosystem". Here is a very general (and
therefore, useless by itself) description of the relevant workflow:

{{< figure src="/ox-hugo/process.svg" >}}

This is a large topic, but roughly speaking the system[^fn:1] has two
key components that manage:

-   references (like, bibliography data, such as `.bib` entries, plain text
    authors-titles-year-etc, perhaps, along with PDF files);
-   notes (that reflect your thinking process related to this paper/piece of information).

It can be organized in **many** ways (including some good old paper-based versions
that were [reported](https://pub.uni-bielefeld.de/download/2942475/2942530/jschmidt%5F2016%5Fniklas%20luhmanns%20card%20index.pdf) to be... very productive, to say the least[^fn:2]; a little
more on this below). I had the following specific **requirements** in mind:

-   The system must be **future-proof**. Research is (hopefully) a long-term
    endeavor, so lock-in with proprietary technologies is not acceptable. I must
    be able to move to an alternative solution, if I'd like to. Key data must be
    stored in some formats that allow for recovery with very basic tools (at least
    in theory): plain text is best, open standards and free software are my
    friends. Oh yes, and I don't want to store my data in cloud all the time, I
    love tools that work offline.
-   It must let me to do the following things:
    -   **capture** a paper from a browser easily (or any other _source_ -- maybe a
        web page, a book, etc.), retrieving bibliographical info automatically when
        possible (including metadata extraction from PDFs).
    -   **manage** references efficiently (edit fields, etc.), categorize things, etc.
    -   play well with **LaTeX** (mostly, looking for and inserting citations).
-   (something that I hope you will ignore:) a large benefit for me had anything
    that worked well within [Emacs](https://xkcd.com/378/).

The core component of such system is, of course, a _bibliography-_,
_citation-_, or _reference-manager_.


## On references and bibliography {#on-references-and-bibliography}

A [reference-management](https://en.wikipedia.org/wiki/Reference%5Fmanagement%5Fsoftware) software is a tool that lets you to (surprise!) manage
references, i.e., bibliographical data: author, title, publisher data, etc.
That is, it captures and stores the bibliographical _data_ in some internal
format (e.g., a `.bib` file, an [SQLite](https://sqlite.org) database, etc.), and then can format it
as you'd like: using the chosen [citation style](https://en.wikipedia.org/wiki/Citation#Styles) and producing outputs in plain
text, word processor document, etc. It also usually helps to generate
bibliographies automatically, so that it updates when you update the text.

There are several key programs/services out there, and an infinite variety of
their comparative analyses:

-   Wikipedia has pretty large [comparison summary tables](https://en.wikipedia.org/wiki/Comparison%5Fof%5Freference%5Fmanagement%5Fsoftware). It might be a good
    place to start, but the number of options is overwhelming.
-   Another detailed comparison was made in [Technische Universität München](https://mediatum.ub.tum.de/doc/1320978/1320978.pdf).
-   University libraries usually have brief overviews of the software they
    recommend: e.g., a nice one from [UCSD](https://ucsd.libguides.com/howtocite/compare), [UC Berkeley](https://guides.lib.berkeley.edu/publichealth/citations), [U. of Pennsylvania](https://guides.library.upenn.edu/citationmgmt).
    Also: [MiT](https://libguides.mit.edu/cite-write) (specifically on [citation management](https://libguides.mit.edu/cite-write/citetools)), [Harvard](https://guides.library.harvard.edu/cite), [Stanford](https://library.stanford.edu/research/bibliography-management), [U. of
    Washington](https://guides.lib.uw.edu/research/citations/citation-tools),
-   There are numerous Reddit discussions (such as: [JabRef vs Zotero vs org-ref](https://www.reddit.com/r/LaTeX/comments/iouswl/jabref%5Fvs%5Fzotero%5Fvs%5Forgref%5Fwhich%5Fone%5Fdo%5Fyou/))
-   Of course, there is a paper[^fn:3] on that: <sup id="75f526c79b18bb5e78cde1133fd1c1f6"><a href="#ivey2018" title="Ivey \&amp; Crum, Choosing the {{Right Citation Management Tool}}: {{Endnote}}, {{Mendeley}}, {{Refworks}}, or {{Zotero}}, {Journal of the Medical Library Association : JMLA}, v(3), 399--403 (2018).">ivey2018</a></sup>.

_Before we start: it might be important what your colleagues are using. Using
the "lab-default" tools might make the choice very simple and efficient._

My personal short list would overlap with the Clemson Library's [one](https://libraries.clemson.edu/research/citation-management/)
(at the time of writing this): [Zotero](https://www.zotero.org/), [JabRef](https://www.jabref.org/); plus [Mendeley](https://mendeley.com/), [Refworks](https://refworks.proquest.com/researcher/)
(Clemson [guide](https://clemson.libguides.com/newrefworks)), [EndNote](https://endnote.com/) if I allow for commercial products (I have also read
some good things about [Papers](https://www.papersapp.com/) for Mac -- but never had a chance to look
myself). This list is not exhaustive (by far), so please refer to more
complete resources (including the ones mentioned above) if you'd need. Despite
the problem seems somewhat standard from the first sight, it seems that
different people demand different things, so there is no "universal" solution.
Instead of trying to discuss pros and cons, let me just try to sketch what
works for me.


## My Zotero-based system. {#my-zotero-based-system-dot}

Here is my system in a nutshell, from a technology perspective:

{{< figure src="/ox-hugo/system.svg" >}}

So, basically, I use the following tools:

-   Zotero desktop app
-   Firefox plugin (["Connector"](https://www.zotero.org/download/connectors)) to fetch info from the web
-   Zotero addons (there is a larger [list](https://www.zotero.org/support/plugins) of these):
    -   BetterBibTex to make the `.bib` related magic happen;
    -   LibreOffice integration (think MS Word);
    -   ZotFile to be able to manipulate PDFs easily, including sending them to the tablet.

Now, the "manuscript" part can be implemented, again in several ways, and the
purpose here is to supercharge your editor to get info from the `.bib` file. My
[Emacs (Spacemacs)](https://www.spacemacs.org/) handles this for me:[^fn:4]

I have a convenient (fuzzy) search / auto-completion when I insert the keys:

{{< figure src="/ox-hugo/org_insert_citation.gif" >}}

And also I can easily pull out a PDF or my notes when I need to:

{{< figure src="/ox-hugo/org_open_pdf_notes.gif" >}}

For these rare cases when I use MS Word-like environments, there are
LibreOffice and Google Docs integration:

{{< figure src="/ox-hugo/gdoc_insert_citation.gif" >}}

(It is also worth noting that you can just find a paper in Zotero and copy a
citation in the necessary citation style, e.g., as a plain text -- to insert it
anywhere.)

If you find it interesting -- there are many demos and tutorials on Zotero on
YouTube and other places (most probably, including a dedicated training in your
university library).


## A word on LaTeX ecosystem. {#a-word-on-latex-ecosystem-dot}

I was somehow confused with the LaTeX-related systems, and found a relevant
[TeX.StackExchange](https://tex.stackexchange.com/questions/25701/bibtex-vs-biber-and-biblatex-vs-natbib) question. In a nutshell:

{{< figure src="/ox-hugo/latex.svg" >}}

As far as I understand, one of the ideas behind `biblatex` was to move away from
a separate style definition language, `BST` (see also a [manual](http://tug.ctan.org/info/bibtex/tamethebeast/ttb%5Fen.pdf) on BibTeX). While
the SE question mentioned above helped my understanding, but I believe this
topic is better suited for another day. Eventually, everything is determined by
the journal -- style description format they provide.


## A note on notes. {#a-note-on-notes-dot}

This is, actually, a separate topic. But if you feel the necessity to take
notes on your research in general (like an extended lab journal), there are
many options.

Basically, we are talking about a collection of interlinked notes. There are
several relevant "keywords" out there that I would like to mention.

-   First, one might take a technological perspective and look for software that
    allows to manage notes. This is, of course, good old Evernote[^fn:5],
    a newer and open source[^fn:6] [Joplin](https://joplinapp.org/). (There are people among my friends
    who keep their research notes there.)
-   There is and a vast variety of [wiki software](https://en.wikipedia.org/wiki/List%5Fof%5Fwiki%5Fsoftware) (such as [DokuWiki](https://www.dokuwiki.org/dokuwiki) or [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki),
    just to name a couple. But the list is huge.) Some of them are specifically
    positioned as a [Personal Wiki](https://en.wikipedia.org/wiki/Personal%5Fwiki) (e.g., such as [TiddlyWiki](https://tiddlywiki.com/) -- see a nice 2.5
    minutes [intro video](https://tiddlywiki.com/#Introduction%20Video)).
-   There are specific solutions for working with an interconnected grid of
    "evergreen" notes (i.e., the ones you might edit every time when you visit
    them.) I would like to mention:
    -   [Roam](https://roamresearch.com/). It looks totally exciting, but web-based (which
        is a big no-go for me);
    -   [Obsidian](https://obsidian.md/). Comparable thing, uses local storage, as far as I can tell.
        Ironically, I am not sure how good is it with citations/references 😀.
        Never used it at all, but to me, it looks **very** promising (especially if
        it indeed keeps your information in [markdown](https://en.wikipedia.org/wiki/Markdown), which is essentially plain
        text, so you can open it in future no matter what).
    -   [Org-roam](https://www.orgroam.com/). This is a part of [Emacs](https://www.gnu.org/software/emacs/) ecosystem over the all-mighty[^fn:7]
        [orgmode](https://orgmode.org/). Free and open source, local solution. This is what I use
        currently.
-   Then, there is a story about [Zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten). A slip-box with notes.
    Essentially, this is a _method_ for keeping a grid of interlinked, small
    notes (and letting them evolve over time). The idea is that after some time
    you actually build such an "external brain" that conversations with it
    becomes surprisingly productive, letting you to create new connections and
    ideas. Again, this is a _method_, not a software tool. In fact, [one](https://en.wikipedia.org/wiki/Niklas%5FLuhmann#Note-taking%5Fsystem%5F(Zettelkasten)) of the
    most famous _Zettelkästen_ was implemented as a wooden box with drawers,
    filled with small (paper) notes. It is worth noting: its author, [Niklas
    Luhmann](https://en.wikipedia.org/wiki/Niklas%5FLuhmann#Note-taking%5Fsystem%5F(Zettelkasten)), was doing Sociology, and this approach might (or might not) be less
    effective for math-heavy fields. Anyways: It seems to be a vast topic, and
    there is a lot of resources out there, if you are interested further, including:
    -   🗎 **Paper:** the original Luhmann's paper <sup id="5980c8f51dda7448763b83fac6dd52a5"><a href="#luhmann1981" title="@incollection{luhmann1981,
          title = {{Kommunikation mit Zettelk\asten}},
          booktitle = {{\Offentliche Meinung und sozialer Wandel / Public Opinion and Social Change}},
          author = {Luhmann, Niklas},
          editor = {Baier, Horst and Kepplinger, Hans Mathias and Reumann, Kurt},
          year = {1981},
          pages = {222--228},
          publisher = {{VS Verlag f\ur Sozialwissenschaften}},
          file = {/home/bochkarev/pkb/Zotero/storage/FPJXGT8J/Luhmann - 1981 - Kommunikation mit Zettelk&#228;sten.pdf},
          keywords = {luhmann,zettelkasten},
          language = {de}
        }">luhmann1981</a></sup> _"Kommunikation mit
        Zettelkästen"_ (in German 🇩🇪);
    -   💬 **Community:** [r/Zettelkasten](https://www.reddit.com/r/Zettelkasten/comments/b566a4/what%5Fis%5Fa%5Fzettelkasten/) on Reddit (the linked note includes couple of
        good links on the subject; and there is a community [wiki](https://zk.zettel.page/), hosted
        separately)
    -   📖 **Book:** ["How to Take Smart Notes..."](https://openlibrary.org/works/OL18635700W/How%5Fto%5FTake%5FSmart%5FNotes) by Sönke Ahrens.
        Despite it has the sort of title I dislike very much, I found the book
        pretty useful and informative[^fn:8]. (It might be still a little
        longer than necessary, to my taste.)
-   On the contrary, someone from my friends just work on a relatively small
    number of notes in `.tex` format (something like "internal papers" in his
    lab).

**Finally:** it seems to me that specific _tools_ are not as important as
  discipline, habits and procedures we set up for ourselves. Of course, a
  labjournal in one form or another is a must. I liked a point that came up in
  one of private conversations recently, that _notes_ is your product when you
  are not working on a specific paper. And when you accumulate enough of them
  -- all this can "graduate" to a paper. (Which is surprisingly along the
  lines Dr. Luhmann as saying, as far as I understand.)


## Discovering the literature {#discovering-the-literature}

I wanted to jot down a couple of words on (and discuss) _discovering_ the
literature. Like, where do papers new can come from.

Before we start: your library might provide a surprising amount of useful
resources! E.g., Clemson University Libraries offer ["Research & Course Guides"](https://libraries.clemson.edu/find/research-course-guides/)
(with specific sections on [Industrial Engineering](https://clemson.libguides.com/IE), [Mathematics](https://clemson.libguides.com/Mathematics), and [Computer
Science](https://clemson.libguides.com/ComputerScience)). I would like to thank our Librarian Jennifer Groff for a very
productive email conversation, which helped me a lot in preparing this
discussion and research in general. There might be more useful sources --
check out the website!


### 🔎 Proactive search {#proactive-search}

Who doesn't know about free search? Right, right... But still:

-   Just Google search is (un)surprisingly good, sometimes.
-   [Google.Scholar](https://scholar.google.com) is handy when you are specifically looking for research
    papers. (It also provides citation data along the way.) What is more
    important: having a paper `X`, it allows to make more complicated requests,
    e.g., find all the papers that cite `X`, find new papers by keywords among
    those citing `X`, and such things.
-   There are specialized (commercial, usually subscription-based)
    resources/databases to search for papers: the most general ones are,
    perhaps, (Elsevier's) [Scopus](https://en.wikipedia.org/wiki/Scopus) and (Clarivate's) [Web of Science](https://en.wikipedia.org/wiki/Web%5Fof%5FScience). Also, there
    is [MathSciNet](https://en.wikipedia.org/wiki/MathSciNet), [EngineeringVillage](https://www.engineeringvillage.com/), etc. Of course, there is [more](https://en.wikipedia.org/wiki/List%5Fof%5Facademic%5Fdatabases%5Fand%5Fsearch%5Fengines) -- these
    are just random examples. For me, this is something that would allow more
    complicated searches than Google Scholar can handle (at least at the moment
    of writing these notes). I never used these for long periods of time
    directly -- it seemed like the simple option was good enough (but I'd love
    to learn your experience, if it is different!).
-   (surprise!) The University Library. For example, Clemson Libraries has
    subscriptions to many databases, and allows to (1) search across these,
    and (2) retrieve paywalled papers. So, I found this ["everything" library
    search](https://libraries.clemson.edu/) pretty useful. Note that there are some other databases (check out
    the "Library databases" button) that might be useful. It seems pointless to
    provide lists (ask your librarian!), but to give a random sample from more
    than **500** (!) databases:
    -   [SAGE Research Methods](https://methods.sagepub.com/)
    -   [CREDO reference](https://credoreference.com) (search across encyclopedias, dictionaries, etc.)
    -   [ProQuest Disserations and Theses Global](https://about.proquest.com/libraries/academic/dissertations-theses/pqdtglobal.html)
-   as a separate note: if you are at CU: note that Clemson Libraries provide
    trainings on what is out there and how to use it: e.g., see _"Introducing
    Library Research Strategies and Navigating the Clemson Libraries"_ from
    [Grad360](https://grad360.sites.clemson.edu/index.php) -- seems to be scheduled for <span class="timestamp-wrapper"><span class="timestamp">[2021-01-29 Fri]</span></span>.

Now, that was _proactive_ search. There are also more or less obvious methods
to receive papers, well, automatically. Apart from the obvious Twitter (or
whatever other social networks are used in your subfield's community) these are:


### 📰 Feeds: RSS, atom {#feeds-rss-atom}

There is a web [standard](https://en.wikipedia.org/wiki/Atom%5F(Web%5Fstandard)) for "feeds", making websites machine readable. The
idea is that instead of checking relevant websites frequently yourself, you
delegate this task to the computer (we're engineers, after all, right?). A
special program, feed _reader_, or a feed _aggregator_ checks out the websites that support such
technology, and lets you know if a new paper / blog post / web page on the
site was published. As simple as that. A couple of notes here:

-   Speaking about software, I would mention Mozilla [Thunderbird](https://www.thunderbird.net) or [Elfeed](https://github.com/skeeto/elfeed) (if
    you are into Emacs ecosystem) -- this is what I tried to use, but I don't
    really have an overview, so can't comment. Chances are, your default
    desktop email client (if you happen to use it), or a browser (Safari?) also
    can do that. Of course, there is a huge [comparison table](https://en.wikipedia.org/wiki/Comparison%5Fof%5Ffeed%5Faggregators) on Wiki. There are
    web solutions (e.g., [Feedly](https://feedly.com/)), which I have no clue about.
-   Now, for this to work it must be supported by the _website_. Yeah, so it
    wouldn't be able to show you ads (for example). So, not everyone is
    supporting this. There are some solutions that try to circumvent this and
    try to build an RSS feed for you (see [Feed43](https://feed43.com/))
-   Some journals provide RSS/Atom feeds: e.g., IJOC, EJOR, OPRE, etc.
-   Preprint servers might have feeds -- e.g., arXiv [mentions](https://arxiv.org/help/rss) subjects feeds,
    updated daily. (unfortunately, to the best of my knowledge [Optimization
    Online](http://www.optimization-online.org/) does not do this.


### 📨 Mailing lists {#mailing-lists}

-   Web of Science, Engineering Village, Google Scholar (and, perhaps, many
    others) allow to set up citation alerts (e.g., weekly/monthly notifications
    on your search results; alerts for new publications from a specific author,
    etc.)
-   Some journals offer email subscriptions instead of feeds, sending out list
    of papers, abstracts, etc. (e.g., Mathematical Programming)
-   There might be other mailing lists worth mentioning (seminars, departmental
    lists, etc. -- please let me know if you think I missed something worth
    mentioning separately).


### 💬 Journal club and other seminars {#journal-club-and-other-seminars}

-   Usually there seem to be efforts to read and share relevant papers in the
    community. I know at least one relatively large lab that systematically
    keeps track of many relevant journals and present "fresh" papers during a
    regular (internal) event.
-   There are also studies-focused reading clubs (aimed to learn how to write
    good papers, rather than to keep track of cutting-edge research).
-   We might want to make one, but this is a topic for another day.


## Concluding remarks and further reading {#concluding-remarks-and-further-reading}

-   We have Clemson Libraries [trainings/events](https://clemson.libcal.com/calendar/training?cid=3593&t=d&d=0000-00-00&cal=3593&inc=0), including ["Zotero for Citation Management"](https://clemson.libcal.com/event/7336551).
-   Now as I think about it: JabRef-based system might be better as it would
    have fewer moving parts, but as of now it seems not worth the hassle of
    setting everything up again...


# Bibliography
<a id="ivey2018"></a>[ivey2018] Ivey & Crum, Choosing the Right Citation Management Tool: Endnote, Mendeley, Refworks, or Zotero, <i>Journal of the Medical Library Association : JMLA</i>, <b>106(3)</b>, 399-403 (2018). [↩](#75f526c79b18bb5e78cde1133fd1c1f6)

<a id="luhmann1981"></a>[luhmann1981] @incollectionluhmann1981,
  title = Kommunikation mit Zettelk\"asten,
  booktitle = \"Offentliche Meinung und sozialer Wandel / Public Opinion and Social Change,
  author = Luhmann, Niklas,
  editor = Baier, Horst and Kepplinger, Hans Mathias and Reumann, Kurt,
  year = 1981,
  pages = 222-228,
  publisher = VS Verlag f\"ur Sozialwissenschaften,
  file = /home/bochkarev/pkb/Zotero/storage/FPJXGT8J/Luhmann - 1981 - Kommunikation mit Zettelkästen.pdf,
  keywords = luhmann,zettelkasten,
  language = de
 [↩](#5980c8f51dda7448763b83fac6dd52a5)

[^fn:1]: Which is by the way a part of something that is usually called Personal Information Management ([PIM](https://en.wikipedia.org/wiki/Personal%5Finformation%5Fmanagement)) or Personal Knowledge Management ([PKM](https://en.wikipedia.org/wiki/Personal%5Fknowledge%5Fmanagement)) systems. These two do not seem well-defined concepts, in my opinion, but do have something to do with very important topics, especially for a researcher.
[^fn:2]: This is in Sociology -- but I believe the benefits should translate well to STEM, at least to some extent.
[^fn:3]: Needless to say, this citation was inserted here using Zotero in under 1 minute (and I have a downloaded PDF as a by-product).
[^fn:4]: I use layers: `bibtex, pdf`, and `org-roam` + `org-roam-bibtex` along with `helm` and such (a mandatory link to my [dotfiles](https://github.com/alex-bochkarev/my-spacemacs-dotfiles)). If you are into Emacs world, you might find it useful to watch this EmacsConf2020 [talk](https://emacsconf.org/2020/talks/17/) by [Noorah Alhasan](https://noorahalhasan.com/), which discusses a very similar approach.
[^fn:5]: which I do not like as it is too much cloud-based and not, um... hacker friendly, to my feelings. For example, I do not quite understand how to export my stuff quickly and without losses, should I happen to need this...
[^fn:6]: From what I understand, it is actually free -- MIT-licensed.
[^fn:7]: Speaking about orgmode: you can check out this great Bernt Hansen's page to see what's possible. But despite I like this technology **a lot**, I must admit it is still a DIY type of thing, to my taste
[^fn:8]: It left me with the same kind of feeling as the brilliant ["Deep work"](https://www.calnewport.com/books/deep-work/) by Cal Newport.
