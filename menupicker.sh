echo "Choose script to run:"

shellscripts=$(ls *.sh)
declare -a menu
counter=0

for shellscript in $shellscripts; do

	menu[counter]=$shellscript
	echo $counter") "$shellscript
	#echo ${menu[counter]}
	let counter+=1
done

printf ">>>"
read choice
echo ""

bash ${menu[choice]}

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