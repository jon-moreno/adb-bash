#!/bin/bash
#.SH DESCRIPTION
#Lets you run shell scripts from a menu
#pages=$(ls)

#echo $pages

declare -a pages
declare -a menu

function load_menus () {
	let counter=0

	for page in */; do
		pages[$counter]=$page
		let counter+=1
	done
}

function generate_menu () {

	clear
	echo "Make a selection"

	shellscripts=$(ls $1 | grep .sh)
	let counter=0

	for shellscript in $shellscripts; do

		menu[counter]=$shellscript
		echo $counter") "$shellscript
		#echo ${menu[counter]}
		let counter+=1
	done

	#let next_menu=

	echo $counter") More..."

	printf ">>>"
	read choice

	#Accept parameters for script
	if [ "$choice" != "$counter" ]; then
		printf "Param(s): "
		read params
	fi

	echo ""
}

#########################
#######MAIN##############
#########################

#prev_menu=2
#next_menu=2
load_menus
generate_menu ${pages[0]}
let next_menu=1
choosing=true

while [[ "$choosing"==true ]]; do
	#"More" is chosen
	if [ "$choice" == "$counter" ] && [ "$next_menu" -ge "${#pages[@]}" ]; then
		generate_menu ${pages[0]}
		let next_menu=1

	elif [ "$choice" == "$counter" ]; then
		generate_menu ${pages[next_menu]}
		let next_menu+=1

	else
		choosing=false
		let next_menu-=1
		#echo "Your choice was: "${pages[next_menu]}${menu[choice]}
		clear
		#source ${pages[next_menu]}${menu[choice]} $params
		x-terminal-emulator -hold -e ./${pages[next_menu]}${menu[choice]} $params
		exit 0
	fi
done

exit 0
#open choice in own terminal and loop picker program
#bash ${menu[choice]}

# function function(){
# 	$choice
# }
# 
# def doblue (): subprocess.run([test.sh])
# def dogreen (): print("Grass is green")
# def doyellow (): print("Sand is yellow")
# 
# takeaction = {
#     "blue": doblue,
#     "green": dogreen,
#     "yellow": doyellow
#     }
# 
# echo "Choose a script to run"
# read