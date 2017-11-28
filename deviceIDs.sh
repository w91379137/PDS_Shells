#!/bin/sh

xcrunReturn=$(xcrun simctl list)

declare -a saveText=()
declare -a excludeText=('==' '(Shutdown)' '(unavailable)')

status=0

for e in $xcrunReturn
do
    if [ "$status" == 1 ] ; then

        if [ "$e" == 'tvOS' ]; then
            break
        fi
        
        isSave=true
        for exclude in "${excludeText[@]}"
        do
            if [ "$e" == "$exclude" ]; then
                isSave=false
                break
            fi
        done

        if [ "$isSave" == true ]; then
            saveText+=($e)
        fi
        
    else
        if [ "$e" == 'Devices' ]; then
            status=1
        fi
    fi
done

declare -a array_ID=()

for e in "${saveText[@]}"
do
    if [ ${#e} == 38 ]; then
        array_ID+=(${e:1:36})
    fi
done

for e in "${array_ID[@]}"
do
    echo $e
done
