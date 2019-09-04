
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

``` r
library(outsider)
# Use example mafft nucleotide data
ex_seqs_file <- file.path(getwd(), 'ex_seqs.fasta')
(file.exists(ex_seqs_file))
#> [1] TRUE
# Run
mafft <- module_import(fname = 'mafft', repo = 'dombennett/om..mafft')
ex_al_file <- file.path(getwd(), "ex_al.fasta")
mafft(arglist = c('--auto', ex_seqs_file, '>', ex_al_file))
#> nthread = 0
#> nthreadpair = 0
#> nthreadtb = 0
#> ppenalty_ex = 0
#> stacksize: 8192 kb
#> generating a scoring matrix for nucleotide (dist=200) ... done
#> Gap Penalty = -1.53, +0.00, +0.00
#> 
#> 
#> 
#> Making a distance matrix ..
#> 
#> There are 10 ambiguous characters.
#> 
    1 / 10
#> done.
#> 
#> Constructing a UPGMA tree (efffree=0) ... 
#> 
    0 / 10
#> done.
#> 
#> Progressive alignment 1/2... 
#> 
STEP     1 / 9  f
STEP     2 / 9  f
STEP     3 / 9  f
STEP     4 / 9  f
#> Reallocating..done. *alloclen = 7064
#> 
STEP     5 / 9  f
STEP     6 / 9  d
STEP     7 / 9  f
STEP     8 / 9  d
STEP     9 / 9  d
#> done.
#> 
#> Making a distance matrix from msa.. 
#> 
    0 / 10
#> done.
#> 
#> Constructing a UPGMA tree (efffree=1) ... 
#> 
    0 / 10
#> done.
#> 
#> Progressive alignment 2/2... 
#> 
STEP     1 / 9  f
STEP     2 / 9  f
STEP     3 / 9  f
STEP     4 / 9  f
STEP     5 / 9  f
#> Reallocating..done. *alloclen = 7088
#> 
STEP     6 / 9  f
STEP     7 / 9  f
STEP     8 / 9  f
STEP     9 / 9  d
#> done.
#> 
#> disttbfast (nuc) Version 7.407
#> alg=A, model=DNA200 (2), 1.53 (4.59), -0.00 (-0.00), noshift, amax=0.0
#> 0 thread(s)
#> 
#> generating a scoring matrix for nucleotide (dist=200) ... done
#>    1/  10
   2/  10
   3/  10
   4/  10
   5/  10
   6/  10
   7/  10
   8/  10
   9/  10
dndpre (nuc) Version 7.407
#> alg=X, model=DNA200 (2), 1.53 (4.59), 0.37 (1.11), noshift, amax=0.0
#> 0 thread(s)
#> 
#> minimumweight = 0.000010
#> autosubalignment = 0.000000
#> nthread = 0
#> randomseed = 0
#> blosum 62 / kimura 200
#> poffset = 0
#> niter = 2
#> sueff_global = 0.100000
#> nadd = 2
#> generating a scoring matrix for nucleotide (dist=200) ... done
#> 
#> 
    0 / 10
#> Segment   1/ 75    1-  57
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  rejected.
STEP 001-004-1  identical.   
STEP 001-005-0  rejected.
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment   2/ 75   57- 119
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  accepted.
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
#> Converged.
#> 
#> Segment   3/ 75  119- 204
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  rejected.
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  rejected.
STEP 001-005-1  accepted.
STEP 001-006-0  identical.   
STEP 001-006-1  accepted.
STEP 001-007-0  accepted.
STEP 001-007-1  rejected.
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  rejected.
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  rejected.
STEP 002-005-1  rejected.
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  rejected.
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
#> Converged.
#> 
#> Segment   4/ 75  204- 236
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  accepted.
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  accepted.
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  accepted.
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
Segment   5/ 75  236- 248
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment   6/ 75  248- 268
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment   7/ 75  268- 322
#> STEP 001-001-0  identical.   
STEP 001-001-1  rejected.
STEP 001-002-0  rejected.
STEP 001-002-1  accepted.
STEP 001-003-0  rejected.
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  rejected.
STEP 001-005-1  rejected.
STEP 001-006-0  identical.   
STEP 001-006-1  accepted.
STEP 001-007-0  rejected.
STEP 001-007-1  accepted.
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  accepted.
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  rejected.
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  accepted.
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  accepted.
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  rejected.
Segment   8/ 75  311- 389
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  rejected.
STEP 001-005-0  accepted.
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  rejected.
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  accepted.
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  rejected.
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  rejected.
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
Segment   9/ 75  389- 441
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  rejected.
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  accepted.
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
#> Converged.
#> 
#> Segment  10/ 75  441- 445
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  11/ 75  445- 454
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  12/ 75  454- 471
#> STEP 001-001-0  accepted.
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
#> Converged.
#> 
#> Segment  13/ 75  471- 477
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  14/ 75  477- 485
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  15/ 75  485- 522
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  16/ 75  522- 557
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  17/ 75  557- 571
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  accepted.
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
#> Converged.
#> 
#> Segment  18/ 75  571- 582
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  19/ 75  582- 680
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  accepted.
STEP 001-005-0  rejected.
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  rejected.
STEP 001-007-1  rejected.
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  accepted.
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  rejected.
STEP 002-007-0  accepted.
STEP 002-007-1  accepted.
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  accepted.
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
Segment  20/ 75  679- 694
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  21/ 75  694- 763
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  rejected.
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  accepted.
STEP 001-007-0  rejected.
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  rejected.
STEP 002-009-1  rejected.
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  rejected.
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  accepted.
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
Segment  22/ 75  763- 845
#> STEP 001-001-0  identical.   
STEP 001-001-1  rejected.
STEP 001-002-0  identical.   
STEP 001-002-1  accepted.
STEP 001-003-0  identical.   
STEP 001-003-1  rejected.
STEP 001-004-0  rejected.
STEP 001-004-1  accepted.
STEP 001-005-0  rejected.
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  accepted.
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  rejected.
STEP 002-009-1  rejected.
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  rejected.
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  rejected.
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
#> Converged.
#> 
#> Segment  23/ 75  845- 859
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  24/ 75  859- 898
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  25/ 75  898- 962
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  26/ 75  962-1030
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  27/ 75 1030-1087
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  accepted.
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
#> Converged.
#> 
#> Segment  28/ 75 1088-1174
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  accepted.
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
#> Converged.
#> 
#> Segment  29/ 75 1174-1262
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  accepted.
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
#> Converged.
#> 
#> Segment  30/ 75 1262-1303
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  31/ 75 1303-1317
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  32/ 75 1317-1331
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  33/ 75 1331-1450
#> STEP 001-001-0  identical.   
STEP 001-001-1  rejected.
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  rejected.
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  accepted.
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  rejected.
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
#> Converged.
#> 
#> Segment  34/ 75 1450-1457
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  35/ 75 1457-1462
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  36/ 75 1462-1481
#> STEP 001-001-0  identical.   
STEP 001-001-1  accepted.
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
#> Converged.
#> 
#> Segment  37/ 75 1481-1483
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  38/ 75 1483-1518
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  39/ 75 1518-1586
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  accepted.
STEP 001-005-0  accepted.
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  accepted.
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  accepted.
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
Segment  40/ 75 1587-1723
#> STEP 001-001-0  identical.   
STEP 001-001-1  accepted.
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  accepted.
STEP 001-004-0  accepted.
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  rejected.
STEP 001-007-0  accepted.
STEP 001-007-1  rejected.
STEP 001-008-0  rejected.
STEP 001-008-1  accepted.
STEP 001-009-1  rejected.
STEP 002-009-1  rejected.
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  accepted.
STEP 002-007-1  rejected.
STEP 002-006-0  identical.   
STEP 002-006-1  rejected.
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  rejected.
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
Segment  41/ 75 1717-1781
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  accepted.
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
#> Converged.
#> 
#> Segment  42/ 75 1781-1833
#> STEP 001-001-0  identical.   
STEP 001-001-1  rejected.
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  accepted.
STEP 001-004-1  accepted.
STEP 001-005-0  accepted.
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  rejected.
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  rejected.
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  accepted.
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  rejected.
Segment  43/ 75 1833-1861
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  accepted.
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
#> Converged.
#> 
#> Segment  44/ 75 1861-1867
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  45/ 75 1867-1906
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  46/ 75 1906-1978
#> STEP 001-001-0  rejected.
STEP 001-001-1  identical.   
STEP 001-002-0  rejected.
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  rejected.
STEP 001-006-1  accepted.
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  accepted.
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  rejected.
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  rejected.
STEP 002-003-1  rejected.
STEP 002-002-0  rejected.
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
Segment  47/ 75 1978-2005
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  48/ 75 2005-2021
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  49/ 75 2021-2051
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  50/ 75 2051-2065
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  51/ 75 2065-2070
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  52/ 75 2070-2076
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  53/ 75 2076-2125
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  54/ 75 2125-2181
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  55/ 75 2181-2265
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  accepted.
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
#> Converged.
#> 
#> Segment  56/ 75 2265-2317
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  57/ 75 2317-2442
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  accepted.
STEP 001-004-1  accepted.
STEP 001-005-0  accepted.
STEP 001-005-1  rejected.
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  rejected.
STEP 002-004-0  accepted.
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
Segment  58/ 75 2442-2472
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  59/ 75 2472-2492
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  60/ 75 2492-2507
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  61/ 75 2507-2525
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  62/ 75 2525-2583
#> STEP 001-001-0  identical.   
STEP 001-001-1  accepted.
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  accepted.
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
#> Converged.
#> 
#> Segment  63/ 75 2582-2591
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  64/ 75 2591-2676
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  65/ 75 2676-2777
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  66/ 75 2777-2860
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  accepted.
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
#> Converged.
#> 
#> Segment  67/ 75 2860-2906
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  68/ 75 2906-2931
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  accepted.
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
#> Converged.
#> 
#> Segment  69/ 75 2931-2954
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  70/ 75 2954-3057
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  accepted.
STEP 001-005-0  accepted.
STEP 001-005-1  accepted.
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  accepted.
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  identical.   
STEP 002-005-0  rejected.
STEP 002-005-1  rejected.
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
#> Converged.
#> 
#> Segment  71/ 75 3056-3066
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  72/ 75 3066-3076
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  73/ 75 3076-3107
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  rejected.
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  accepted.
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  identical.   
STEP 002-007-1  identical.   
STEP 002-006-0  rejected.
STEP 002-006-1  identical.   
STEP 002-005-0  rejected.
STEP 002-005-1  identical.   
STEP 002-004-0  identical.   
STEP 002-004-1  identical.   
STEP 002-003-0  identical.   
STEP 002-003-1  identical.   
STEP 002-002-0  identical.   
STEP 002-002-1  identical.   
STEP 002-001-0  identical.   
STEP 002-001-1  identical.   
Segment  74/ 75 3107-3113
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  identical.   
STEP 001-003-0  identical.   
STEP 001-003-1  identical.   
STEP 001-004-0  identical.   
STEP 001-004-1  identical.   
STEP 001-005-0  identical.   
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  identical.   
STEP 001-007-0  identical.   
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
#> Converged.
#> 
#> Segment  75/ 75 3113-3151
#> STEP 001-001-0  identical.   
STEP 001-001-1  identical.   
STEP 001-002-0  identical.   
STEP 001-002-1  rejected.
STEP 001-003-0  identical.   
STEP 001-003-1  rejected.
STEP 001-004-0  identical.   
STEP 001-004-1  rejected.
STEP 001-005-0  accepted.
STEP 001-005-1  identical.   
STEP 001-006-0  identical.   
STEP 001-006-1  rejected.
STEP 001-007-0  rejected.
STEP 001-007-1  identical.   
STEP 001-008-0  identical.   
STEP 001-008-1  identical.   
STEP 001-009-1  identical.   
STEP 002-009-1  identical.   
STEP 002-008-0  identical.   
STEP 002-008-1  identical.   
STEP 002-007-0  rejected.
STEP 002-007-1  identical.   
STEP 002-006-0  identical.   
STEP 002-006-1  rejected.
STEP 002-005-0  identical.   
STEP 002-005-1  identical.   
STEP 002-004-0  rejected.
STEP 002-004-1  rejected.
STEP 002-003-0  identical.   
#> Converged.
#> 
#> done
#> dvtditr (nuc) Version 7.407
#> alg=A, model=DNA200 (2), 1.53 (4.59), -0.00 (-0.00), noshift, amax=0.0
#> 0 thread(s)
#> 
#> 
#> Strategy:
#>  FFT-NS-i (Standard)
#>  Iterative refinement method (max. 2 iterations)
#> 
#> If unsure which option to use, try 'mafft --auto input > output'.
#> For more information, see 'mafft --help', 'mafft --man' and the mafft page.
#> 
#> The default gap scoring scheme has been changed in version 7.110 (2013 Oct).
#> It tends to insert more gaps into gap-rich regions than previous versions.
#> To disable this change, add the --leavegappyregion option.
#> Warning in file.copy(from = file.path(tempwd, returned_file), to =
#> output_file, : 'recursive' will be ignored as 'to' is not a single existing
#> directory
(file.exists(ex_al_file))
#> [1] TRUE

# View alignment
cat(readLines(con = ex_al_file, n = 50), sep = '\n')
#> >X02729 Methanococcus vannielli. #
#> ----tatctattaccctacc----ctggggaatggcttggcttgaaacgccgatgaagga
#> cgtggtaagctgcgataagcctaggcgaggcgcaa-cagcctttgaacctaggatttccg
#> aatgggacttcctacttttgtaa--------------------tccgtaaggattggtaa
#> cgcgggggattgaagcatcttagtacccgcaggaaaagaaatca-actgaga-ttccgtt
#> agtagaggcgattgaacacggatcagggcaaactgaatcccttcg-------------gg
#> gagatgtggtgttatagggccttct------tttcgcctgttgagaaaagctgaagtt-g
#> actggaacg-tcacactatagagggtgaaagtcccgtaagcgcaatcgattcaggtt---
#> tgaagtgt-ccctgagtaccgtgcgttggatatcgcgcgggaatt-tgggaggcatcaac
#> ttccaactctaaatacgtttcaagaccgatagcgtac-tagtaccgcgagggaaagctga
#> aaagcacccttaacagggtggtgaaa-agagcctgaaacccaggtaggtatggaatggcg
#> tggccccaaagg-----caactgttctgaaggaaaccgtcgcaaggcggctgtacgaaga
#> acag---agccagggttgcgtcctccgtttcgaaaaacgggccggggagtgta-ttgttg
#> tggcgagcttaagatcttcac--gatcgaaggcgtagggaaaccaacaagtccgcagaat
#> ct---------ttagggacggggtctt--aagggcccggagtcacagcaatacgacccga
#> aaccgggcgatctaggccggggcaaggtgaagtccctcaattgagggatggaggcctg-c
#> agagttgttgccgttcgaagcactcttctgacctcggtctaggggtgaaaggccaatcga
#> gcccggagatagctggttcccctcgaagtgactctcaggtcagccagagttcaggtagtc
#> ggcagggtagagc-actgataagatggttag-----gggaagaaattcctcgctgttttg
#> tcaaactccgaacctgtcgtcgccg-taggctctgagtga-gggcatacggggtaagctg
#> tatgtccgagacgggaatagccgagacttgggttaaggcccctaaatgccgattaagtgt
#> gaac---acgaagggcgtccttggtctaagacagcagggaggttggcttagaagcagcca
#> ccctttaaagagtgcgtaacagctcacctgtcgagatcaagggccccgaaaatggacggg
#> gct-aaatcggctgccgagacccaaagggcaccgcaag--------gtgatccccgtagg
#> ggggcgttctgcgagggcagaagttcggctgtgaagtcgagtggacctcgtagaaatgaa
#> gatcccggtagtagtaacagcataagtggggtgagaa-tccccaccgccgaaggggcaag
#> ggttccacagcaatgtttgtcagctgtgggtaagccggtcctaactctcgaggtaa--ct
#> cctttgagaggaa-agggaaacaggttaatattcctgtgc------catctagatacgcg
#> tggcaacacaaggttagt-ttccaacgcttctgggtaggctgagtgtt-cttgtctggac
#> attcaagcttataag-tccggggagagttgtaataacgagaaccg-gatgaaagagtgat
#> gagct-ctccgttaggagagttcggccgatctctggagcccgtgaaaagggaactagca-
#> -aggattctagatgtccgtacccagaaccgacactggtgcccctaggtgagtatcctaag
#> gcgtagcgggatgaatctagtcgagggaagtcggcaaattggttccgtaacttcgggaga
#> aggagtgccagtgatcttgtttaaatatgggatcgctggtcgcagtgaccagggaggtcc
#> gactgtttaatacaaacataggtcttagcgagcctgaaaaggtgtgtactaaggccgacg
#> cctgcccagtgctggtacgtgaaccccggttccaaccgggcgaagcgccagtaaacggcg
#> ggggtaactataaccctcttaaggtagcgaaattccttgtcgggcaagttccgacctgca
#> tgaatggcgtaacgagacctccactgtccccgactagaatccggtgaacctaccattccg
#> gcgcaaag-gccggagacttccagtgggaagcgaagaccccgtggagctttactgcagcc
#> tgtcgttggggcatggttgtgagtgtacagtgtaggtgggagccatcgaaaccttttcgc
#> c----aggaaaggtggaggcgatcctgggacaccaccctctcatgaccatgttcctcacc
#> ctt-----ttaggggacaccggtaggtgggcagtttggctggggcggtaccctcctaaaa
#> atgcatcaggagggccccaaaggttggctcaagcgggtcaggactccgctgttgagtg-t
#> aagggcaaaagccagcctgactttgttgccaacaaaacg-caacgaagaggcgaaagccg
#> ggcctaacgaacccctgtg--cctcactgatgggggccagggatgacaaaaaagctaccc
#> cggggataacagagttgtcgcgggcaagagcccatatcgaccccgcggcttgctacctcg
#> atgtcggtttttcccatcctgggtctgcagcaggacccaagggtggggctgttcgcccat
#> taaaggggatcatgagctgggtttagaccgtcgtgagacaggttggttgctatctgctgg
#> atgtgttaggctgtctgagggaaaggtggctctagtacgagaggaacgggccgtcggcgc
#> ctctagtcgatcggttgtctgacaaggcac-tgccgagcagccacgcgccaagaga-taa
```

Find out more
-------------

Learn more about `outsider` by visiting the [website](https://antonellilab.github.io/outsider/).

------------------------------------------------------------------------

Exercise
========

-   Install mafft via outsider
-   Align the sequences written to file from the `phylotaR` challenge.
