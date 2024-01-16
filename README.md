# monoCyteSim
Data sets, simulated from models fitted to real data which cannot
be made public due to ethical considerations.  Hidden Markov models
may be fitted to these data.

The data sets made available here are examples of data to which
one may attempt to fit hidden Markov models with emissions having a
Multinom distribution.  They are intended for use with the package
eglhmm.  The data sets are somewhat too large to be conveniently
included in the aforementioned package.  Hence they are being made
available in a separate package that can be installed from github.

To make this directory into a git repository:

    go to this directory, and type
    git init

To create the repository on github, or to update that github
repository (after changes have been made to this local directory):

(1) Go into this directory and add and commit all the files that may
have been changed:

    git add .
    git commit -m "First version on GitHub."
or
    git commit -m "Fixed a fuck-up."

(2) Push it to GitHub:

    git push origin main

Note:  It takes an unexpectedly long time (half an hour? an
hour?) before the updated package becomes available.  Patience,
Grasshopper!

