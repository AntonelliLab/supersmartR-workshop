
`outsider` Introduction
=======================

`outsider` is a package that allows users to install and run external code within the R environment. This is very useful when trying to construct pipelines that make use of a variety of code. `outsider` requires Docker to work.

![](https://raw.githubusercontent.com/AntonelliLab/outsider/master/other/outline.png)

Running alignment software
--------------------------

To demonstrate, let's run an alignment software tool, [mafft](https://mafft.cbrc.jp/alignment/software/), from within R. Let's install an module for mafft, and then run it on some test sequences.

### Install

``` r
library(outsider)
#> ----------------
#> outsider v 0.1.0
#> ----------------
#> - Security notice: be sure of which modules you install
# github repo to where the module is located
repo <- 'dombennett/om..mafft'
# install mafft
module_install(repo)
#> package: om..mafft
#> 
#> -----------------------------------------------------
#> Enter any key to continue or press Esc to quit
# look up available functions
(module_functions(repo = repo))
#> [1] "mafft"
# import mafft function
mafft <- module_import(fname = 'mafft', repo = repo)
# test function
mafft(arglist = '--help')
#> ------------------------------------------------------------------------------
#>   MAFFT v7.407 (2018/Jul/23)
#>   https://mafft.cbrc.jp/alignment/software/
#>   MBE 30:772-780 (2013), NAR 30:3059-3066 (2002)
#> ------------------------------------------------------------------------------
#> High speed:
#>   % mafft in > out
#>   % mafft --retree 1 in > out (fast)
#> 
#> High accuracy (for <~200 sequences x <~2,000 aa/nt):
#>   % mafft --maxiterate 1000 --localpair  in > out (% linsi in > out is also ok)
#>   % mafft --maxiterate 1000 --genafpair  in > out (% einsi in > out)
#>   % mafft --maxiterate 1000 --globalpair in > out (% ginsi in > out)
#> 
#> If unsure which option to use:
#>   % mafft --auto in > out
#> 
#> --op # :         Gap opening penalty, default: 1.53
#> --ep # :         Offset (works like gap extension penalty), default: 0.0
#> --maxiterate # : Maximum number of iterative refinement, default: 0
#> --clustalout :   Output: clustal format, default: fasta
#> --reorder :      Outorder: aligned, default: input order
#> --quiet :        Do not report progress
#> --thread # :     Number of threads (if unsure, --thread -1)
```

### Align

TODO: get a smaller example file

``` r
library(outsider)
# Download example nucleotide data
ex_seqs_file <- file.path(tempdir(), "ex_seqs.fasta")
#download.file(url = "https://mafft.cbrc.jp/alignment/software/ex1.txt",
#              destfile = ex_seqs_file)
# Run
mafft <- module_import(fname = 'mafft', repo = 'dombennett/om..mafft')
ex_al_file <- file.path(tempdir(), "ex_al.fasta")
#mafft(arglist = c('--auto', ex_seqs_file, '>', ex_al_file))

# View alignment
```

Find out more
-------------

Learn more about `outsider` by visiting the [website](https://antonellilab.github.io/outsider/).

------------------------------------------------------------------------

Challenge
=========

-   Install mafft via outsider
-
