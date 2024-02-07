#!/bin/bash

# $B%G!<%?%;%C%HL>$r@_Dj(B
DATASET="your_dataset_name"

# $B%G!<%?%;%C%HFb$NA4%F!<%V%k$r<hF@(B
tables=$(bq ls $DATASET | awk 'NR>1 {print $1}')

# $B3F%F!<%V%k$KBP$7$F:o=|3NG'(B
for table in $tables
do
    read -p "Do you want to delete the table $table? (y/n): " answer
    if [ "$answer" = "y" ]; then
        bq rm -t -f $DATASET.$table
        echo "Deleted table $table."
    else
        echo "Skipped table $table."
    fi
done

