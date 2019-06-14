#!/bin/bash
#sets the command line flag arguments
wkdir=""
ana=""
#
while getopts "w:a:h?:" opt; do
    case $opt in
        w) wkdir="$OPTARG" # path to output directory
        ;;
        a) ana="$OPTARG"  # path to Anacapa output file (in .txt format)
        ;;
        h) HELP="TRUE"  # calls help screen explain the flag commands
        ;;
    esac
done
#
# if the user specifies the -h flag the help screen prints, if not an empty new line is returned
if [ "${HELP}" = "TRUE" ]
then
  printf "\nThis is the help screen.\n\t-w is the first variable to set the working directory\n\t-a is the second variable of the path to the Anacapa file\n\t-h prints help \n \n"
  exit
else
  echo ""
fi
#prints the variables stored in each flag to verify correct variable assignment
echo "The variable stored in -w is ${wkdir}"

echo "The variable stored in -a is ${ana}"
#
#calls the vars file and sets the variables from the file
#
source vars.sh

echo "\n"
#prints the variables stored in each variable from the vars file to verify correct variable assignment
echo "The first variable \$DB is ${DB}"
echo "The second variable \$EST is ${EST}"
echo "The third variable \$PRE is ${PRE}"
echo "The fourth variable \$STO is ${STO}"

#calls the R script and specifies the variables to bring into the R script 
Rscript --vanilla ${DB}R_Script_Fishbase.R ${wkdir} ${ana} ${EST} ${PRE} ${STO}
