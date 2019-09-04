
`restez` Introduction
=====================

`restez` is a package that allows users to download whole chunks of NCBI's [GenBank](https://www.ncbi.nlm.nih.gov/genbank/). The package works by:

-   Downloading compressed files of sections of GenBank
-   Unpacking these files and building a local GenBank copy
-   Providing generic functions for interacting with the local copy

![](https://raw.githubusercontent.com/ropensci/restez/master/paper/outline.png)

Installation
------------

Currently unavailable from CRAN. Install via GitHub.

``` r
# install key dependency
remotes::install_github("hannesmuehleisen/MonetDBLite-R")
# install restez
remotes::install_github("ropensci/restez")
```

Set-up your first `restez` database
-----------------------------------

Here, we will do the following:

1.  Specify a location for our database (`restez_path`)
2.  Download the smallest section of GenBank (unannotated)
3.  Build a local database

``` r
library(restez)
#> -------------
#> restez v1.0.1
#> -------------
#> Remember to restez_path_set() and, then, restez_connect()

# 1. Set the filepath for where the database will be stored
rstz_pth <- file.path(tempdir(), 'unannotated_database')
if (!dir.exists(rstz_pth)) {
  dir.create(rstz_pth)
}
restez_path_set(filepath = rstz_pth)
#> ... Creating '/tmp/RtmpaNr2Gl/unannotated_database/restez'
#> ... Creating '/tmp/RtmpaNr2Gl/unannotated_database/restez/downloads'

# 2. Download
# select number 20, for unannoated (the smallest section)
db_download(preselection = '20')
#> ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#> Looking up latest GenBank release ...
#> ... release number 233
#> ... found 2463 sequence files
#> ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#> Which sequence file types would you like to download?
#> Choose from those listed below:
#> ● 1  - 'EST (expressed sequence tag)'
#>         574 files and 243 GB
#> ● 2  - 'Bacterial'
#>         365 files and 159 GB
#> ● 3  - 'GSS (genome survey sequence)'
#>         268 files and 117 GB
#> ● 4  - 'Constructed'
#>         208 files and 87.6 GB
#> ● 5  - 'Patent'
#>         198 files and 83.2 GB
#> ● 6  - 'Plant sequence entries (including fungi and algae)'
#>         181 files and 90.9 GB
#> ● 7  - 'Other vertebrate'
#>         157 files and 65 GB
#> ● 8  - 'TSA (transcriptome shotgun assembly)'
#>         127 files and 53.9 GB
#> ● 9  - 'HTGS (high throughput genomic sequencing)'
#>         82 files and 36.7 GB
#> ● 10 - 'Invertebrate'
#>         77 files and 30.9 GB
#> ● 11 - 'Environmental sampling'
#>         58 files and 24.8 GB
#> ● 12 - 'Primate'
#>         34 files and 14.1 GB
#> ● 13 - 'Viral'
#>         34 files and 14.8 GB
#> ● 14 - 'Other mammalian'
#>         33 files and 9.55 GB
#> ● 15 - 'Synthetic and chimeric'
#>         27 files and 10.7 GB
#> ● 16 - 'Rodent'
#>         17 files and 7.4 GB
#> ● 17 - 'STS (sequence tagged site)'
#>         11 files and 4.45 GB
#> ● 18 - 'HTC (high throughput cDNA sequencing)'
#>         8 files and 3.45 GB
#> ● 19 - 'Phage'
#>         3 files and 1.47 GB
#> ● 20 - 'Unannotated'
#>         1 files and 0.00175 GB
#> Provide one or more numbers separated by spaces.
#> e.g. to download all Mammalian sequences, type: "12 14 16" followed by Enter
#> 
#> Which files would you like to download?
#> ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#> You've selected a total of 1 file(s) and 0.00175 GB of uncompressed data.
#> These represent: 
#> ● 'Unannotated'
#> 
#> Based on stated GenBank files sizes, we estimate ... 
#> ... 0.00035 GB for  compressed, downloaded files
#> ... 0.00214 GB for the SQL database
#> Leading to a total of 0.00249 GB
#> 
#> Please note, the real sizes of the database and its downloads cannot be
#> accurately predicted beforehand.
#> These are just estimates, actual sizes may differ by up to a factor of two.
#> 
#> Is this OK?
#> ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#> Downloading ...
#> ... 'gbuna1.seq' (1/1)
#> Done. Enjoy your day.

# 3. Create database
# connect to empty database
restez_connect()
#> Remember to run `restez_disconnect()`
db_create()
#> Adding 1 file(s) to the database ...
#> ... [32m'gbuna1.seq.gz'[39m ([34m1/1[39m)
#> Done.
# always disconnect from a database when not in use.
restez_disconnect()
```

Query the database
------------------

We can send queries to the database using two different methods: `restez` functions or [`rentrez`](https://ropensci.org/tutorials/rentrez_tutorial/) wrappers.

> **What is `rentrez`?** The `rentrez` package allows users to interact with NCBI Entrez. `restez` wraps around some of its functions so that instead of sending queries across the internet, the local database is checked first.

``` r
# import library, point to database and connect
library(restez)
rstz_pth <- file.path(tempdir(), 'unannotated_database')
restez_path_set(filepath = rstz_pth)
restez_connect()
#> Remember to run `restez_disconnect()`

# Check the status
restez_status()
#> Checking setup status at  ...
#> ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#> Restez path ...
#> ... Path '/tmp/RtmpaNr2Gl/unannotated_database/restez'
#> ... Does path exist? 'Yes'
#> ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#> Download ...
#> ... Path '/tmp/RtmpaNr2Gl/unannotated_database/restez/downloads'
#> ... Does path exist? 'Yes'
#> ... N. files 2
#> ... N. GBs 0
#> ... GenBank division selections 'Unannotated'
#> ... GenBank Release 233
#> ... Last updated '2019-08-27 17:19:19'
#> ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#> Database ...
#> ... Path '/tmp/RtmpaNr2Gl/unannotated_database/restez/sql_db'
#> ... Does path exist? 'Yes'
#> ... N. GBs 0
#> ... Is database connected? 'Yes'
#> ... Does the database have data? 'Yes'
#> ... Number of sequences 543
#> ... Min. sequence length 0
#> ... Max. sequence length Inf
#> ... Last_updated '2019-08-27 17:19:22'

# Get a random ID from the database
id <- sample(x = list_db_ids(n = 100), size = 1)
#> Warning in list_db_ids(n = 100): Number of ids returned was limited to [100].
#> Set `n=NULL` to return all ids.
# print record information
record <- gb_record_get(id)
cat(record)
#> LOCUS       AF298113                 633 bp    DNA     linear   UNA 23-NOV-2000
#> DEFINITION  Unidentified clone E16S17 SSU ribosomal RNA gene, partial sequence.
#> ACCESSION   AF298113
#> VERSION     AF298113.1
#> KEYWORDS    .
#> SOURCE      unidentified
#>   ORGANISM  unidentified
#>             unclassified sequences.
#> REFERENCE   1  (bases 1 to 633)
#>   AUTHORS   Naviaux,R.K.
#>   TITLE     Sand DNA: a multigenomic library on the beach
#>   JOURNAL   Unpublished
#> REFERENCE   2  (bases 1 to 633)
#>   AUTHORS   Naviaux,R.K.
#>   TITLE     Direct Submission
#>   JOURNAL   Submitted (21-AUG-2000) Medicine, University of California, San
#>             Diego School of Medicine, 200 West Arbor Drive, San Diego, CA
#>             92103-8467, USA
#> FEATURES             Location/Qualifiers
#>      source          1..633
#>                      /organism="unidentified"
#>                      /mol_type="genomic DNA"
#>                      /db_xref="taxon:32644"
#>                      /clone="E16S17"
#>                      /note="anonymous environmental sample sequence from ocean
#>                      beach sand"
#>      rRNA            <1..>633
#>                      /product="SSU ribosomal RNA"
#> ORIGIN      
#>         1 aattcggctt ggttaccttg ttacgacttc accccagtca tgaaccacaa agtggtgagc
#>        61 gacctcccga aggttagtct acccacttct tttgcaaccc actcccatgg tgtgacgggc
#>       121 ggtgtgtaca aggcccggga acgtattcac cgtagcaatg ctgatctacg attactagcg
#>       181 attccaactt catgcagtcg agttgcagac tgcaatccgg actaagaact gctttgtggg
#>       241 attggctccc cctcgcgggt tagcgaccct ctgtacagcc cattgtagca cgtgtgtagc
#>       301 ccagcccata agggccatga tgacttgacg tcatccccac cttcctccgg tttgtcaccg
#>       361 gcagtctcct tagagttccc accattacgt gctggcaact aaggacaang gttgcgctcg
#>       421 ttgcgggact taacccaaca tctcacgaca cgagctgacg acagccatgc agcacctgtg
#>       481 taacggcccg aangcggcac catctctggt aaccttccat tacatgtcaa atccaggtaa
#>       541 ggttctgcgc gttgcatcga attaaaccac atgctccact gcttgtgcgg gccccccgtc
#>       601 aatttctttg agtttaatct tgcgaccgta ctt
#> //
# see ?gb_record_get for more query functions

# always disconnect
restez_disconnect()
```

Find out more
-------------

For more information, visit the [`restez` website](https://ropensci.github.io/restez/).

------------------------------------------------------------------------

Exercise
=========

-   Build a database of all phage sequences
-   Write out all "Escherichia" sequences to a fasta file

(It may take a few minutes for the phage database to build.)
