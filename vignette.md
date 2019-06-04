# Vignette

## Running the program

To test the program, use the Fish_taxonomy_file.txt in the Github. The file should be a table of rows of amplicon sequence variants (ASVs) with the header label **12S_seq_number**. The columns should be the sample names. The observations in each cell are the number of times a particular ASV appeared in the sample. The last column is the assigned taxonomy given to each ASV with the header **sum taxonomy**.   <br />

Then find the vars.sh file and change the database variable (DB) to the directory that contains the R script.    <br />

To run the program, make sure you are in the directory that contains the bash script.    <br />

The command line is as follows:    <br />
bash final_project_bash_script.sh -w /output_directory -a /directory_with_file/Fish_taxonomy_file.txt   <br />

## Variable verification

As the program runs, you can determine the variables were loaded correctly at various steps. The program will print what is stored in each variable to help the user verify the variables are correctly assigned:   <br />
Flag commands:   <br />
"The variable stored in -w is output_directory"  <br />
"The variable stored in -a is anacapa_taxonomy_file.txt"   <br />

Variable file commands:   <br />
"The first variable \$DB is directory_with_R_script"   <br />
"The second variable \$EST is fields_for_estimate_function"   <br />
"The third variable \$PRE is fields_for_predator_function"   <br />
"The fourth variable \$STO is fields_for_stock_function "  <br />

*Note* If using the default settings for the fields, the variables should look as follows:   <br />
"The first variable \$DB is directory_with_R_script"   <br />
"The second variable \$EST is Species,MaxLengthTL,Troph,seTroph,TrophObserved"   <br />
"The third variable \$PRE is Species,PredatorGroup,PredatorName"   <br />
"The fourth variable \$STO is Species,StockDefsGeneral,IUCN_Code,EnvTemp,Resilience,GenBankID,IUCN_ID"   <br />

## Program output

When the program finishes running, the output file is a csv file called fishbase_output of unique fish species and their respective trait data. The output file when using the Fish_taxonomy_file.txt should be the same as the fishbase_example_output file in the Github.
