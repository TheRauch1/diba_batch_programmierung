#!/bin/bash

echo "Hello, this is a file renamer. Please tell us what you'd like to do:"
echo "1: Rename all files in your style"
echo "2: Add a Prefix"
echo "3: Add a Suffix"

echo "Select your prefered action as a number:"
read action

echo "Please tell us in which directory your files are located: (full directory name):"
read directory

if cd $directory; then
    echo "Changed directory to $directory"
else
    echo "Changing directory failed, please check directory path"
    exit 0
fi

renameFilesWithPersonalStyle() {
    style=$1
    if [[ $style == *"counter"* ]]; then
        echo ""
    else
        echo "Please add 'counter' in your style."
        exit 0  
    fi

    counter=1

    for file in *
    do
        newName=$(echo $style | sed "s/counter/${counter}/g")
        mv "$(pwd)/$file" "$(pwd)/$newName"
        let counter++
    done

}

renameFilesWithPrefix() {
    prefix=$1

    for file in *
    do
        mv "$(pwd)/$file" "$(pwd)/$prefix$file"
    done

}

renameFilesWithSuffix() {
    suffix=$1

    for file in *
    do
        mv "$(pwd)/$file" "$(pwd)/$file$suffix"
    done

}

case $action in
    1)  echo "Now enter your file name, the word 'counter' will be replaced with a number."
        read style
        renameFilesWithPersonalStyle $style
        ;;
    2)  echo "Now enter your Prefix."
        read prefix
        renameFilesWithPrefix $prefix
        ;;
    3)  echo "Now enter your Suffix."
        read suffix
        renameFilesWithSuffix $suffix
        ;;
esac

