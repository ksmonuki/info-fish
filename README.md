#Info-Fish: Matching eDNA Recovered Species to Ecological Information from Fishbase
### Keira Monuki
eDNA is a unique tool to accurately and rapidly assess marine biodiversity (Taberlet et al. 2012). However, there are still several challenges that prevent widespread eDNA use. For example, accurate species assignment and assigning species recovered from eDNA to  relevant ecological information present two challenges to implementing eDNA monitoring assessments. [To address the first problem, Curd et al. created a bioinformatics pipeline to parse amplicon sequence variants (ASVs) and assign taxonomy to sequences](https://github.com/limey-bean/Anacapa) (Curd et al. 2019). The outputs of Anacapa are species tables with bootstrapped confidence scores. The goal of this project is to take the Anacapa output .txt file and match the recovered species to their respective trait data. Trait data is obtained from [FishBase](https://www.fishbase.se/search.php), an online database of information of fish and elasmobranchs ecology such as habitat, diet, fecundity, and distribution. This program is constructed in R and uses the package [rfishbase](https://cran.r-project.org/web/packages/rfishbase/rfishbase.pdf) to match species to trait data (R Core Team 2018; Boettiger et al. 2012).

## Workflow

The flow of the program is as follows:
Reads an input file of the Anacapa output -> Extracts the unique species from the amplicon sequence variants (ASVs) -> Use rfishbase to create tables of user-specified relevant ecological information for each unique species -> concatenate all tables into one output table

## Dependencies

*Program dependencies*    <br />
This program requires R, which can be downloaded [here](https://www.r-project.org/).  

*File dependencies*    <br />
This program requires two additional scripts:   <br />
1. vars.sh    <br />
A variable file that specifies the directory with the R script and the fields to extract from fishbase functions   <br />
2. R_Script_Final_Project.R   <br />
Contains the bulk of the code to format the data and extract information from fishbase

## Install rfishbase

``` {r}
install.packages("rfishbase")
```
## Install dplyr, devtools, tidyverse, and plyr

```{r}
install.packages("dplyr")
install.packages("plyr")
install.packages("devtools")
install.packages("tidyverse")
```
*Note*: If running the program on a computing cluster, you must have R loaded in your cluster and download the correct packages. Below are some links that may help:

[The Coatless Professor](https://thecoatlessprofessor.com/programming/working-with-r-on-a-cluster/)

[CECI](https://support.ceci-hpc.be/doc/_contents/Software/R/r_packages.html)

[Anacapa Github link for specifically UCLA Hoffman2 Cluster](https://github.com/limey-bean/Anacapa)

## Project Outline

The file final_project_bash_script.sh is a bash script that acts as a wrapper and calls several other scripts to run the program. In the bash command line, the user specifies the working directory and the Anacapa output file to use. The bash script then calls the vars.sh file (to specify the desired trait information from fishbase) and the R script to match the Anacapa species to the desired trait information.

BASH SCRIPT -working directory argument -input file argument   <br />
---> assigns flag arguments to variables    <br />
---> calls vars.sh file    <br />
<ol>
  |     <br />
  ---> assigns vars.sh file arguments to variables    <br />
</ol>  
---> calls R script    <br />
<ol>
  |    <br />
  ---> calls arguments set from flags and vars.sh file   <br />
  <ol>
  |    <br />
  ---> runs R script (output file saved within R script)    <br />

## Specifying Variables in Vars File

The program allows the user to specify desired trait data to call from FishBase.

The format of the vars file is as follows:   <br />
Function 1 fields:    <br />
FONE="species,field_1,field_2,field_3"   <br />
Function 2 fields:    <br />
FTWO="species,field_1,field_2,field_3"   <br />

The default fields are already set in the vars.sh file. If the user would like to change the fields, manually delete unwanted fields and add desired fields. The species column MUST be kept in order to concatenate the tables into the final table.

Example:   <br />
Function 1 fields:    <br />
FONE="species,new_field,new_field2,field_3"    <br />
Function 2 fields:    <br />
FTWO="species,field_1,field_2,new_field"   <br />

## Running the program

The command line should look as follows (*note*: The user needs to be in the directory with the bash script):
sh final_project_bash_script.sh -w ~/working_directory -a ~/anacapa_output_file_.txt  <br />

The expected output is a csv table with rows of unique species and columns of ecological data. The csv file is in the directory set from the -w flag in the command line.

## References

Boettiger, C., Lang, D.T., Wainwright, P.C. (2012). *rfishbase: exploring, manipulating, and visualizing FishBase data from R*. Journal of Fish Biology. **81**, 2030-2039. doi:10.1111/j.1095-8649.2012.03464.x, available online at wileyonlinelibrary.com.

Curd, E. E., Gold, Z., Kandlikar, G. S., Gomer, J., Ogden, M., O'Connell, T., Pipes, L., Schweizer, T. M., Rabichow, L., Lin, M., Shi, B., Barber, P. H., Kraft, N., Wayne, R. and Meyer, R. S. (2019). *Anacapa Toolkit: an environmental DNA toolkit for processing multilocus metabarcode datasets*. Methods Ecol Evol. Accepted Author Manuscript. doi:10.1111/2041-210X.13214

R Core Team. 2014. R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL http://www.R-project.org/.

Taberlet, P., Coissac, E., Hajibabaei, M., Rieseberg, L.H. 2012. *Environmental DNA*. Molecular Ecology. **21**, 1789–1793.
