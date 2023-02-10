#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

#Data Import
import_tbl <- read_delim(file = "../data/week4.dat.txt", delim = "-", col_names = c("casenum","parnum","stimver","datadate","qs"))