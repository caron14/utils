#!/bin/bash

# データセット名を設定
DATASET="your_dataset_name"

# データセット内の全テーブルを取得
tables=$(bq ls $DATASET | awk 'NR>1 {print $1}')

# 各テーブルに対して削除確認
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

