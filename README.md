# supersmartR Workshop <img src="https://raw.githubusercontent.com/AntonelliLab/supersmartR/master/logo.png" height="300" align="right"/>

> These resources were originally put together for a one-day workshop for the Gothenburg Global Biodiversity Centre, Gothenburg, Sweden on the 17th Sept. 2019.

> To learn the `supersmartR` approach yourself, you can follow the instructions layed out in the [slides](https://github.com/AntonelliLab/supersmartR-workshop/blob/master/assets/slides.pdf).

[`supersmartR`](https://github.com/AntonelliLab/supersmartR) is a series of
R packages that form a phylogenetic pipeline.

## <img src="https://raw.githubusercontent.com/AntonelliLab/supersmartR/master/supersmart%20vs%20supersmartr.png" height="450" align="middle"/>

In this workshop we will introduce you to the packages, outline the steps of
a simple phylogenetic pipeline and demonstrate the next steps for advancing
and scaling up the method.

#### Base pipeline

![](/assets/base_pipeline.gif)

### Learning outcomes

* Gain experience in the four existing `supersmartR` packages:
[phylotaR](https://github.com/ropensci/phylotaR),
[restez](https://github.com/ropensci/restez),
[outsider](https://github.com/antonellilab/outsider),
[gaius](https://github.com/antonellilab/gaius).
* Run simple phylogenetic pipeline
* Develop own more complex pipeline
* Develop R programming skills
* Become aware of the different phylogenetic and computing options

* * *

# Prerequisites

* Computer
    * Operating system: Windows 10, Linux, OSX
    * 20 - 50 GB spare capacity
* Software
    * [R](https://cran.r-project.org/) (> 3.5)
    * [RStudio](https://www.rstudio.com/)
    * [Desktop Docker](https://docs.docker.com/install/) (Linux containers)
* Basic knowledge
    * R
    * Phylogenetics

(If you have a Windows computer, consider setting up [dual-boot](https://help.ubuntu.com/community/WindowsDualBoot#Install_Ubuntu_after_Windows).)

### R packages

Install dependant packages.

```r
# remotes allows installation via GitHub
# install.packages(“remotes”)

library(remotes)
# install latest outsider
install_github("antonellilab/outsider.base")
install_github("antonellilab/outsider")
# install latest restez
install_github("hannesmuehleisen/MonetDBLite-R")
install_github("ropensci/restez")
# install latest phylotaR
install_github("ropensci/phylotaR")
# install latest gaius
install_github("antonellilab/gaius")
```

If you're computer is set-up correctly with the R packages and Docker, you
should be able to run the below script without errors.

```r
library(outsider)
repo <- "dombennett/om..hello.world"
module_install(repo = repo, force = TRUE)
hello_world <- module_import(fname = "hello_world", repo = repo)
hello_world()
```

* * *

# Slides

![](/assets/slides_glimpse.gif)

Available online via [`assets/slides.pdf`](/assets/slides.pdf) or
[Download](https://github.com/AntonelliLab/supersmartR-workshop/raw/master/assets/slides.pdf)

### Data

Pre-compiled `restez` databases for the "2_large" and "3_supertree" pipelines.
(These files will only be available on the day of the workshop.)

|GenBank section     |Size (Gb)|Link                  |
|--------------------|---------|----------------------|
|Invertebrates       |1.6      |[Download][invert_url]|
|Other mammals       |0.1      |[Download][om_url]    |
|Other vertebrates   |0.5      |[Download][ov_url]    |
|Plants, fungi, algae|1.2      |[Download][pga_url]   |
|Primates            |0.3      |[Download][pri_url]   |
|Rodents             |0.1      |[Download][rod_url]   |

[invert_url]: https://drive.google.com/uc?export=download&confirm=Btit&id=1Rk2eOplviyxh-QJLm4y-AC6mIf-BCT9i
[om_url]: https://drive.google.com/uc?export=download&confirm=Sz0D&id=1Kpfys8695KcUuysIvsQYYtbjRT4YSP9F
[ov_url]: https://drive.google.com/uc?export=download&confirm=JVVa&id=1jp92W6kxB114DjTkAGSxFozucgIWselt
[pga_url]: https://drive.google.com/uc?export=download&confirm=u-7Q&id=1TyKVcz9dC2vBmCMH1U7dMj4V6KM3KlaG
[pri_url]: https://drive.google.com/uc?export=download&confirm=AOCz&id=1Qc_84Apfewu8CJ9zhHJEJQSnZcRMoh9A
[rod_url]: https://drive.google.com/uc?export=download&confirm=bCFU&id=1TqfZWwwi8R7TyAX9IjrYZHkYGFWrz5-z

*Also ...*

Completed first step of "3_supertree" pipeline for [**Hystricomorpha**](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=10015): [Download](https://drive.google.com/uc?export=download&id=1kUCKsLflUistf7ZnBKCsWZeh269u5ec1)

**Note: All files are ZIP compressed folders.**

* * *

# Details

### Workshop teachers

* [Dom Bennett](https://github.com/dombennett)
* [Tobi Andermann](https://github.com/tobiashofmann88)
* [Matthias Obst](https://github.com/biomobst)

### Workshop sponsors

|   |   |
|---|---|
|[Gothenburg Global Biodiversity Centre](https://ggbc.gu.se/)|<img src="https://ggbc.gu.se/digitalAssets/1623/1623292_illustration-ggbc-webb.jpg" height="200" align="middle"/>|

|   |   |
|---|---|
|[Nordic E-Infrastructure Collaboration](https://neic.no/)|<img src="https://www.nordforsk.org/en/programmes-and-projects/programmes/the-nordic-e-infrastructure-collaboration/header-image_header" width="350" align="middle"/>|

|   |   |
|---|---|
|[Swedish Life Watch](https://www.slu.se/en/subweb/swedish-lifewatch/)|<img src="assets/swedish_life_watch_logo.png" height="200" align="middle"/>|
