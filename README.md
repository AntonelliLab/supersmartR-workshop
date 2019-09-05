# supersmartR Workshop <img src="https://raw.githubusercontent.com/AntonelliLab/supersmartR/master/logo.png" height="300" align="right"/>
> 17 Sept. 2019, Gothenburg Global Biodiversity Centre, Gothenburg, Sweden.

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
    * 50 - 100 GB spare capacity
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
# install latest phylotaR
install_github("ropensci/phylotaR")
# install latest restez
install_github("hannesmuehleisen/MonetDBLite-R")
install_github("ropensci/restez")
# install latest outsider
install_github("antonellilab/outsider.base")
install_github("antonellilab/outsider")
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

> Note: work in progress.

<embed src="https://drive.google.com/viewerng/
viewer?embedded=true&url=https://github.com/AntonelliLab/supersmartR-workshop/raw/master/assets/slides.pdf" width="750" height="800">

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
