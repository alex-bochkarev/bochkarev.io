---
title: "🌩 Intro to the Command Line (2/2): the cluster."
author: ["Alexey Bochkarev"]
date: 2021-02-15
lastmod: 2021-09-26T23:58:26-04:00
tags: ["tech-seminar", "talk"]
categories: ["notes"]
draft: true
summary: Tips on working with the computation infrastructure.

aliases:
  - /tools/ts-cluster/
---

## Recap from the previous seminar: {#recap-from-the-previous-seminar}

-   pipelines with shell (`process_all.sh`);
-   quick note: pipeline with a `Makefile`


## Intro {#intro}

-   login vs. node shell. `qsub -I`.
-   getting started docs: <https://www.palmetto.clemson.edu/palmetto/basic/started/>
-   [JupyterHub](https://www.palmetto.clemson.edu/jhub/hub/home) ([docs](https://www.palmetto.clemson.edu/palmetto/basic/jupyter/)).
-   installing software: <https://github.com/clemsonciti/palmetto-examples/tree/master/Installation>
-   (add `tgs`)
-   note: sample programs at <https://github.com/clemsonciti/palmetto-examples>


## Accessing the infrastructure (sshfs) {#accessing-the-infrastructure--sshfs}

-   mounting the file system.
-   via `ssh` (+script). Note that you could login to a specific _node_, if
    needed:

    ```bash
    qsub -I -l select=1:ncpus=1:host=node1564+1:host=node1564
    ```
-   `rsync` (there's also `scp`)

    ```bash
      pass -c Clemson/student && rsync -vP abochka@xfer01-ext.palmetto.clemson.edu:/home/abochka/ab-clustertools/stc ./
    ```
-   of course, there is Github.
-   `fzf` and `cdg` script.
-   "globus" thing


## Running things and managing jobs. {#running-things-and-managing-jobs-dot}

-   `qsub -I`;
-   `qsub`: PBS scripts
-   summoning demons: `module add`.
-   PBS templates

    ```bash
    !/bin/env bash

    cat <<EOF > $1
    #PBS -N <jobname>
    #PBS -l select=1:ncpus=1:mem=8gb,walltime=05:00:00
    #PBS -j oe
    #PBS -o ./run.log
    #PBS -M abochka@clemson.edu
    #PBS -m abe

    # boilerplate things
    STARTMSG="START: msg"
    ENDMSG="END: msg"

    module add anaconda3/5.1.0-gcc/8.3.1
    source activate ab-local
    module add r/4.0.2-gcc/8.3.1

    cd $(pwd)

    echo \$STARTMSG
    # run-command
    echo \$ENDMSG

    # deactivate the env
    source deactivate ab-local
    EOF
    nano $1
    ```
-   `chainrun.sh`
-   trap (save your data)

    ```bash
    trap "cp ${TMPDIR}/* ~/<whatever>/;exit" TERM # save the TMP folder if killed
    ```
-   `fdel`, `fpeek`


## Concluding comments / discussion {#concluding-comments-discussion}

-   inconsistent runtimes on Palmetto?..
    (black magic happens :))
-   don't order too much resources (might wait too long).
