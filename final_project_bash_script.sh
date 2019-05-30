#!/bin/bash
#last edited 5/29/19
#sh final_project_bash_script.sh -w /Users/keiramonuki/Documents/C177/Project -a /Users/keiramonuki/Documents/Barber_Lab/Taxonomy_Tables/12S_ASV_raw_taxonomy_60_edited_new.txt
#flags
wkdir=""
ana=""
#
while getopts "w:a:" opt; do
    case $opt in
        w) wkdir="$OPTARG" # path to desired Anacapa output
        ;;
        a) ana="$OPTARG"  # path to Anacapa_db
        ;;
    esac
done
#
#
echo "The variable stored in -w is ${wkdir}"

echo "The variable stored in -a is ${ana}"
#
#vars
#
source vars.sh

echo "\n"

echo "The first variable \$DB is ${DB}"
echo "The second variable \$EST is ${EST}"
echo "The third variable \$PRE is ${PRE}"
echo "The fourth variable \$STO is ${STO}"


Rscript --vanilla ${DB}R_Script_Final_Project.R ${wkdir} ${ana} ${EST} ${PRE} ${STO}
