#!/usr/bin/env Rscript
options(scipen=10000)

#### Install
paquetes <- c('ggplot2','tidyverse','plyr','scales','knitr', 
		      'kableExtra', 'ggmap', 'googledrive',
		      'httpuv', 'httr','googlesheets', 'glue')

no_instalados <- paquetes[!(paquetes %in% installed.packages()[,'Package'])]
if(length(no_instalados)) install.packages(no_instalados)
res <- lapply(paquetes, require, character.only = TRUE)
if(Reduce(res, f = sum)/length(paquetes) < 1) stop('Some packages could not be loaded.')

#### devtools

#devtools::install_github('gaborcsardi/dotenv')
library(dotenv)
#### Functions

