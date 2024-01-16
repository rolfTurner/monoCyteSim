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

To create the github repository, the procedure is:

(1) log in to github, click on "New", type in the repository name,
(in this instance "monoCyteSim"), and choose a licence (GPL?).

(2) Click on the name of the new repository and click on "Code".

(3) Copy the https code. (In this instance):

    https://github.com/rolfTurner/monoCyteSim.git

(4) Type: git clone and then paste in the code/string that you have
just copied, i.e. https://github.com/rolfTurner/monoCyteSim.git.

Or you could dispense with the copying and pasting, as long as you type
the string correctly.

(5) Populate this new directory appropriately (i.e. with all the necessary
bells and whistles of an R package (DESCRIPTION, Changelog, man, ...).

(6) Go to this new directory and do:

    git add .
    git commit -m "First version on github"
    git push origin main

To update the repository (after changes have been made to this
local directory):

(1) Go into this directory and add and commit all the files that may
have been changed:

    git add .
    git commit -m "Fixed a fuck-up."

(2) Push it to GitHub:

    git push origin main

Note:  It takes an unexpectedly long time (half an hour? an
hour?) before the new or updated package becomes available.
Patience, Grasshopper!

