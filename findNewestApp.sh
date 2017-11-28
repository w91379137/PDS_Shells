#!/bin/bash

# findNewestApp:
#   give a dirPath ($1) give a appName ($2) 
# Example:
#   sh ./findNewestApp.sh ~/Library/Developer/Xcode/DerivedData 
#	sh ./findNewestApp.sh ~/Library/Developer/Xcode/DerivedData abc
# Output:
#   ../../abc.app

dirPath=$1
appName=$2

if [ -z "$2" ] 
then
	findFiles=$(find $dirPath -name "*.app")
else
	findFiles=$(find $dirPath -name "$appName.app")
fi

unset -v latestFile
for file in $findFiles; do
    [[ $file -nt $latestFile ]] && latestFile=$file
done

echo $latestFile