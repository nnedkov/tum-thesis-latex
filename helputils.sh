#!/bin/bash

BUILD=build
MAIN=main

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

declare -a FLAGS=(
1 # (1) show options
0 # (2) autocompile
0 # (3) delete built files
0 # (4) delete trailing whitespaces from tex, sh and bib files
0 # (5) update bibliography

### WHEN ADDING NEW FUNCTIONALITY TOUCH HERE ###
)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

declare -A colors
colors["red"]="\e[0;31m"
colors["blue"]="\e[00;36m"
colors["dark_green"]="\e[00;32m"
colors["yellow"]="\e[01;33m"

function print() {
	if (( $# == 2 )); then
		echo -e "${colors[$1]}$2\e[00m"
	else
		echo -e $1
	fi
}


if (( $# > 0 )); then
	declare -a FLAGS=(0 0 0 0 0) ### WHEN ADDING NEW FUNCTIONALITY TOUCH HERE ###
	for arg do
   		case $arg in
			1)   ((FLAGS[0]=1));;
			2)   ((FLAGS[1]=1));;
			3)   ((FLAGS[2]=1));;
			4)   ((FLAGS[3]=1));;
			5)   ((FLAGS[4]=1));;

	        ### WHEN ADDING NEW FUNCTIONALITY TOUCH HERE ###
   		esac
	done
fi

######################################################################################################
# show options

function show_options() {
	print "blue" "\n*** Showing options ***"
	print "(1) show options\n"
	print "(2) autocompile"
	print "(3) delete built files"
	print "(4) delete trailing whitespaces from tex, sh and bib files"
	print "(5) update bibliography\n"

	### WHEN ADDING NEW FUNCTIONALITY TOUCH HERE ###
}

######################################################################################################
# autocompile

function run_pdflatex() {
	pdflatex -output-directory $BUILD --enable-write18 -file-line-error -src-specials \
		-interaction=nonstopmode $MAIN.tex > $BUILD/$MAIN.log
}

function autocompile() {
	print "blue" "\n*** Autocompile ***"
	while true; do
		FILES=(`find ./ -mindepth 1 -maxdepth 2 -type f|grep -E "tex$"`)
		inotifywait -e modify ${FILES[@]}
		print "dark_green" "Compiling! `date`"
		run_pdflatex
		run_pdflatex
		print "dark_green" "\nDone...\n"
	done
}

######################################################################################################
# delete built files

function delete_built_files() {
	print "blue" "\n*** Deleting built files ***"
	FILES=(`find ./$BUILD -type f|grep -v $MAIN.pdf`)
	for file in ${FILES[@]}; do
		print "dark_green" "Deleting built files: $file"
		rm $file
	done
	print "dark_green" "\nDone...\n"
}

######################################################################################################
# delete trailing whitespaces from tex, sh and bib files

function delete_trail_whitespaces() {
	print "blue" "\n*** Deleting trailing whitespaces from tex, sh and bib files ***"
	FILES=(`find ./ -mindepth 1 -maxdepth 2 -type f|grep -E "sh$|tex$|bib$"`)
	for file in ${FILES[@]}; do
		print "dark_green" "Deleting trailing whitespaces from file: $file"
		sed -i '' -e's/[ \t]*$//' $file >& /dev/null
	done
	print "dark_green" "\nDone...\n"
}

######################################################################################################
# update bibliography

function update_bibliography() {
	print "blue" "\n*** Updating bibliography ***"
	run_pdflatex
	biber $BUILD/$MAIN > $BUILD/$MAIN.log
	run_pdflatex
	run_pdflatex
	print "dark_green" "\nDone...\n"
}

######################################################################################################

if (( FLAGS[0] == 1 )); then
	show_options
fi

if (( FLAGS[1] == 1 )); then
	autocompile
fi

if (( FLAGS[2] == 1 )); then
	delete_built_files
fi

if (( FLAGS[3] == 1 )); then
	delete_trail_whitespaces
fi

if (( FLAGS[4] == 1 )); then
	update_bibliography
fi

### WHEN ADDING NEW FUNCTIONALITY TOUCH HERE ###
