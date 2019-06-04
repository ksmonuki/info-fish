#R Script
#load libraries required to run the script
library(devtools)
library(tidyverse)
library(rfishbase)
library(dplyr)
library(plyr)
#call arguments from bash script (both the command line flag variables and vars file variables)
args <- commandArgs(trailingOnly = TRUE)
print(args) #
print(length(args))
if (length(args) != 5) {
  stop("please make sure there are 5 arguments")
}
#assign variables for use in R script
wkdir = args[1]
ana = args[2]
EST = unlist(strsplit(args[3], ","))
PRE = unlist(strsplit(args[4], ","))
STO = unlist(strsplit(args[5], ","))
#sets the working directory
setwd(wkdir)
#input Anacapa dataset
input_biom_path <- ana
#read the .txt file as a tab-delimited table
ASV.table <- read.table(input_biom_path, header = 1, sep = "\t", fill=TRUE, stringsAsFactors = F)
#converts the data to a wide format (compatible format for tidyverse)
ASV.table$X12S_seq_number <- factor(ASV.table$X12S_seq_number)
gathercols <-colnames(ASV.table)[2:(length(ASV.table)-1)]
ASV.table <- gather(ASV.table, sample, reads, gathercols, factor_key=TRUE)
#
#remove ASVs with only one read, as you cannot make any conclusions about ASVs with only one read
ASV.table %>%
  dplyr::group_by(X12S_seq_number) %>%
  mutate (TotalReadsperSample = sum(reads)) %>%
  filter(., TotalReadsperSample > 1) %>%
  select(-TotalReadsperSample) -> ASV.table
#
#make ASV table a tibble to ensure table is in a tidyverse-compatible format
ASV.table <- as_tibble(ASV.table)
#
#remove zero reads to improve speed of code
ASV.table %>%
  filter(reads != 0)  -> ASV.table
#
#Select only unique ASVs
ASV.table %>%
  select(sum.taxonomy) %>%
  unique() -> ASV.table
#
#Separate the ASVs in taxonomic groups and select the species column for use with rfishbase
ASV.table %>%
  separate(sum.taxonomy, into = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species"), sep=";", remove=F) %>%
  select(Species) -> ASV.table
#
#convert the species table into a character string
species_list <- ASV.table$Species
#
#create a table using the estimate data from rfishbase
species_list %>%
  estimate(fields = c(EST)) -> estimate_table
#
#create a table using the predators data from rfishbase
species_list %>%
  predators(fields = c(PRE)) -> predator_table
#
#create a table using the stocks data from rfishbase
species_list %>%
  stocks(fields = c(STO)) -> stocks_table
#
#combine the tables together by species
joined_table <- join_all(list(estimate_table, predator_table, stocks_table), type = "left")
#
#remove NAs from species column
final_table<- joined_table[!is.na(joined_table$Species), ]
#
#save output ASV
write_csv(final_table, "fishbase_output")
#
#print end of script
print("The program has finished running! Your fishbase_output CSV file is now in your working directory")
