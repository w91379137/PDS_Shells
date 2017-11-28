#!/bin/bash

# 測試起動 另外一個 shell 並 取回參數
result=$(sh findNewestApp.sh ~/Library/Developer/Xcode/DerivedData)
# echo $result
# echo ${#result}

if [ ${#result} -ge 1 ]
then
    echo $result
else
    echo 'Nothing to find'
fi

