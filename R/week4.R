#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

#Data Import
import_tbl <- read_delim(file = "../data/week4.dat.txt", delim = "-", col_names = c("casenum","parnum","stimver","datadate","qs"))
glimpse(import_tbl)
wide_tbl <- separate(import_tbl, qs, into = c("q1", "q2", "q3", "q4", "q5"))
wide_tbl[,5:9] <- sapply(wide_tbl[,5:9], as.integer)
wide_tbl$datadate <- as.POSIXct(wide_tbl$datadate, format = "%b %d %Y, %H:%M:%S")
wide_tbl[,5:9] <- lapply(wide_tbl[,5:9], gsub, pattern = 0, replacement = "NA")
wide_tbl <- wide_tbl[wide_tbl$q2 != "NA",]
long_tbl <- pivot_longer(wide_tbl, cols = starts_with("q"), names_to = "question", values_to = "response")
