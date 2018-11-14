# Display some info
echo -e "${white}boredbutton ${warn}$version${white} | do ${menuname}'bored setup'${white} for utilities | you used the button ${warn}$counter${white} times"
# Generate id count.
idcount=$(grep -c 'ID' $list)
boreddebug "idcount: $idcount"
# Pick a random ID.
randomid=$(awk -v min=1 -v max=$idcount 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
boreddebug "random id: $randomid"
# Get the entry.
grep -A2 ID$randomid $list > ~/.bored/tmp
source ~/.bored/tmp &> /dev/null
boreddebug "$(cat ~/.bored/tmp)"
# Output everything.
echo -e "${randomcolor}###${white}"
echo -e "${white}So you're bored, right? How about you:"
echo -e "${randomcolor}${name}${white}"
echo "${desc}"
# Increase counter by 1.
let counter++
echo "$counter" > $counterfile
boreddebug "$counter saved to $counterfile"