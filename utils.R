#!/usr/bin/env Rscript
options(scipen=10000)

#### Install
paquetes <- c('ggplot2','tidyverse','plyr','scales','knitr', 
		      'kableExtra', 'ggmap', 'googledrive',
		      'httpuv', 'httr','googlesheets', 'glue','zoo', 'DataExplorer', 'openxlsx')

no_instalados <- paquetes[!(paquetes %in% installed.packages()[,'Package'])]
if(length(no_instalados)) install.packages(no_instalados)
res <- lapply(paquetes, require, character.only = TRUE)
if(Reduce(res, f = sum)/length(paquetes) < 1) stop('Some packages could not be loaded.')

#### devtools

#devtools::install_github('gaborcsardi/dotenv')
library(dotenv)
#### Functions

read_excel_url <- function(url, skip=0, sheet=''){
  GET(url, write_disk(tf <- tempfile(fileext = ".xlsx")))
  if (sheet=='') {
    readxl::read_excel(tf,skip = skip)  
  } else  {
    readxl::read_excel(tf,skip = skip, sheet = sheet)
  }
}

clean_names <- function(names, prefix=''){
  names %>%
    map_chr(str_to_lower) %>%
    map(~ str_replace_all(string = .x,' |\\.','_') )  %>%
    map(~ str_replace_all(string = .x,'__','_') )  %>%
    map(~ str_c(prefix,.x))
}

