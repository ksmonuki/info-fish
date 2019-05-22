# Fish Stuff
# Keira Monuki
eDNA is a unique tool to accurately and rapidly assess marine biodiversity. However, there are still several challenges that prevent widespread eDNA use, such as species assignment and correlating eDNA results with relevant ecological information. [To address the first problem, Curd et al. created a bioinformatics pipeline to parse amplicon sequence variants (ASVs) and assign taxonomy to sequences](https://github.com/limey-bean/Anacapa). The outputs of Anacapa are species tables based on a range of bootstrapped confidence scores. The goal of this project is to take the Anacapa output and match the recovered species to their respective trait data. Trait data is obtained from [FishBase](https://www.fishbase.se/search.php), an online database of information of fish and elasmobranchs ecology such as habitat, diet, fecundity, and distribution. This program is constructed in R and uses the package [rfishbase](https://cran.r-project.org/web/packages/rfishbase/rfishbase.pdf) to match species to trait data. Installation instructions for rfishbase are described below.

# Workflow

The flow of the program is as follows:
Reads an input file of the Anacapa output -> Extracts the unique species from the amplicon sequence variants (ASVs) -> Use rfishbase to create tables of user-specified relevant ecological information for each unique species -> concatenate all tables into one output table

# Dependencies
*Program dependencies*
This program requires R, which can be downloaded [here](https://www.r-project.org/).  

*File dependencies*
This program requires two additional scripts:
1. vars.sh
A variable file that specifies the fields to extract from fishbase functions
2. R_Script_Final_Project.R
Contains the bulk of the code to format the data and extract information from fishbase

# Install rfishbase

``` {r}
install.packages("rfishbase")
```
# Install dplyr, devtools, tidyverse, and plyr

```{r}
install.packages("plyr")
```
