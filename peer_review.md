### The Readme

#### 1. Is the Readme file the first document displayed upon lading the Github?  Does this Readme page include a title, and the name and contact information for all project members?
Yes! Looks great

#### 2. Is the purpose of this program clear from the Introduction?  What -in your own words- is the motivation behind the program.
Yes! I love how you get into the purpose of the program by the 3rd sentence. 
The motivation is to make it easier to assign trait information to an eDNA file that has been processed by Anacapa. 

#### 3. Is there a program workflow and is it easy to understand?  What -in your own words- is the program workflow?
Yes, theres a workflow but maybe it could be a bit more detailed (like explain how it does things? and what an ASV is)
It takes the input file, extracts the unique species, searches them through fishbase (by matching the ASVs to the ASVs in fishbase?), and then makes an output table.
- the Project Outline later on has things in more detail! maybe move this bit to your workflow section?

#### 4. Are the dependencies indicated in the workflow?  If there are Hoffman2 specific requirements are they indicated?
Yes! Hoffman2 requirements are listed further on. 

#### 5. Are there instructions for running the program?  Do the instructions make sense?  What would you do to improve the instructions?
Yes they do! maybe you could add that they need to install everyting before running? 

#### 6. Is there a section that indicates the files and directories produced by the program?
Yup

#### 7. Are the research programs / motivations for the program cited?  Are the dependencies cited?
Yes
---

### The Scripts

#### 8. Is there a directory that contains all of the program scripts?
No, theyre all in the main directory

#### 9. Do these programs generate a run log?
N/a ? I think Emily said we didnt need them
---

### The Vignette

#### 10. Is there a directory called Vignette and does it include a test set, the commands used to run the program and the expected output databases?

Yes

#### 11. Where you able to run the Vignette using the small test dataset? If not what errors did you get?  If so was it easy to run the dataset?  Where the instructions clear.
When i type "bash final_project_bash_script.sh -w /output_directory -a /directory_with_file/Fish_taxonomy_file.txt" into the command line I get the error message "bash: final_project_bash_script.sh: No such file or directory"

I changed the script name to the one in the directory, (fishbase_bash_script.sh). I then tried the command "bash fishbase_bash_script.sh -w /output_directory -a /directory_with_file/Fish_taxonomy_file.txt"
I got the message:
The variable stored in -w is /output_directory
The variable stored in -a is /directory_with_file/Fish_taxonomy_file.txt
\n
The first variable $DB is /Users//Documents/C177/Project/
The second variable $EST is Species,MaxLengthTL,Troph,seTroph,TrophObserved
The third variable $PRE is Species,PredatorGroup,PredatorName
The fourth variable $STO is Species,StockDefsGeneral,IUCN_Code,EnvTemp,Resilience,GenBankID,IUCN_ID
fishbase_bash_script.sh: line 42: Rscript: command not found

#### 12. Where you able to reproduce the expected output?  If not what was different.
No I couldnt.
---

### General

#### 13. Give __at least two__ suggestions for ways to improve the GitHub page or the operation of the program.
Check the bit of the code (line 42?) that makes an error message. 
Reorganize the readme to include some of the later details in the workflow + instructions sections. 
