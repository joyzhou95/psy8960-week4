#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

#Data Import
import_tbl <- read_delim(file = "../data/week4.dat.txt", delim = "-", col_names = c("casenum","parnum","stimver","datadate","qs"))
glimpse(import_tbl)
wide_tbl <- separate(import_tbl, qs, c("q1", "q2", "q3", "q4", "q5"))
