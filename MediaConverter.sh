#!/bin/bash

FILE=""
EXT=""
Menu=("Convert file..." "Convert" "" "Resize file..." "Resize" "" "Donate" "Quit")

BUTTON=`zenity --list --column='Main Menu' "${Menu[@]}" --width 100 --height 300`

while [[ $BUTTON != 'Quit' ]]
do

MenuConvert=("Choose file" "Target extension" "" "Target extension selected: $EXT" "File to convert: $FILENAME" "" "Done" "Cancel")
MenuResize=("Choose file" "Target size" "Done" "Cancel")

$BUTTON

case $BUTTON in
	"Convert file..."*) BUTTON=`zenity --list --column='File options' "${MenuConvert[@]}" --width 100 --height 300` ;;
	"Convert"*) ;;
	"Resize file..."*) BUTTON=`zenity --list --column='File options' "${MenuResize[@]}" --width 100 --height 300` ;;
	"Resize"*) ;;
	"Choose file"*) FILE=$(zenity --file-selection) BUTTON=`zenity --list --column='File options' "${MenuConvert[@]}" --width 100 --height 300` ;;
	"Target extension"*) EXT=$(zenity --list --radiolist --text="Select file extension" --column='Select' --column='File extension' FALSE "*.jpg" TRUE "*.png" FALSE "*.gif" FALSE "*.tiff") BUTTON=`zenity --list --column='File options' "${MenuConvert[@]}" --width 300 --height 300`;;
	"Done"*) BUTTON=`zenity --list --column='Main Menu' "${Menu[@]}" --width 100 --height 300`;;
	"Cancel"*) BUTTON=`zenity --list --column='Main Menu' "${Menu[@]}" --width 100 --height 300` FILE="" EXT="";;
esac


done
