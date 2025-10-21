#!/bin/bash
# /$$   /$$ /$$$$$$$$ /$$     /$$ /$$ /$$
#| $$  | $$| $$_____/|  $$   /$$/| $$| $$
#| $$  | $$| $$       \  $$ /$$/ | $$| $$
#| $$$$$$$$| $$$$$     \  $$$$/  | $$| $$
#| $$__  $$| $$__/      \  $$/   |__/|__/
#| $$  | $$| $$          | $$            
#| $$  | $$| $$$$$$$$    | $$     /$$ /$$
#|__/  |__/|________/    |__/    |__/|__/
 
#You're not supposed to be here!!
#Leave or else >:(
                                        
                                        



export TERM=xterm-256color


green=$(tput setaf 2)
red=$(tput setaf 1)
gray=$(tput setaf 8)
yellow=$(tput setaf 3)
mike=$(tput setaf 87)
porple=$(tput setaf 183)
reset=$(tput sgr0)

TOS_FILE="DoNotModify"
TOS_NOTICE="# By editing this file manually, you still agree to the Terms of Service hosted at https://raspihost.org/tos"

motds=(
    "balls"
    "It's Raspin' time!"
    "Downtime? Never heard of her!"
    "running on duct tape and hope"
    "I'm thinking Miku Miku ooeeoo!"
    "hosted from a potato"
    "im terminally online"
    "Running on 1MB of ram!"
    "Running on efficient ARM cores!"
    "ur bald"
    "Tax_Reports is the baldest person in the world!"
    "News 39!"
    "Mitchie M is the goat"
    "Pi 0's are the best Pis!"
    "I have successfully obtained 15 Miku figurines"
    "I bought 393938.xyz for no reason"
    "Did someone say Bald MC?"
    "4gbps?!? Network goes zooooooooooooooooooom"
    "Show me your Ai Dee!"
    "Free 1MB ram upgrade when using code mikumiku39 at checkout"
    "EU node when?"
    "Free 1% cpu upgrade when using code imthebaldestpersonintheworld at checkout"
    "Viva viva happy chu-lu-chu-chu"
    "I have a 183 day reddit streak"
    "Check out osu!"
    "Check out RDR2!"
    "Inspired by DBH"
    "Free 39MB storage upgrade when using code mitchiemisthegoat39 at checkout"
    "Hard drives? I've never heard of her!"
    "DDR3? I've never heard of her!"
    "Contact me at @raspi_dude on discord!"
    "Wanna go far away..."
    "Inside was a blank letter, blank space and line breaks... That's about it"
    "Did you know that they delisted Never Gonna Give You Up? Check for yourself here https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    "308 Negra Arroyo Lane, Albuquerque, New Mexico 87104"
    "Hard off and Book off are goated"
    "Our next node will run on a Raspberry Pi 0 with a 16gb micro SD card!"
    "nvm I have a 257 day reddit streak"
    "does anyone actually read these?"
    "first person who sends a screenshot of this motd gets a free 314mb storage upgrade (get it? pi? 3.14? hilarious right?)"
    "Running on 75GXP drives!"
    "Let's Ishukan Communication!"
    "|  ||  ||  |_"
    "But maybe someday when my ship comes in, maybe she'll understand what kind of guy I am"
    "Check out Serani Poji!"
    "More More Jump!"
    "Raspihost cup noodle prohibition"
)

art=(
' /#######                                /##       /##   /##                       /##    '
'| ##__  ##                              |__/      | ##  | ##                      | ##    '
'| ##  \ ##  /######   /#######  /######  /##      | ##  | ##  /######   /####### /######  '
'| #######/ |____  ## /##_____/ /##__  ##| ##      | ######## /##__  ## /##_____/|_  ##_/  '
'| ##__  ##  /#######|  ###### | ##  \ ##| ##      | ##__  ##| ##  \ ##|  ######   | ##    '
'| ##  \ ## /##__  ## \____  ##| ##  | ##| ##      | ##  | ##| ##  | ## \____  ##  | ## /##'
'| ##  | ##|  ####### /#######/| #######/| ##      | ##  | ##|  ######/ /#######/  |  ####/'
'|__/  |__/ \_______/|_______/ | ##____/ |__/      |__/  |__/ \______/ |_______/    \___/  '
'                              | ##                                                        '
'                              | ##                                                        '
'                              |__/                                                        '


)

bar=(
'###########################################################################################'
)

clear
echo "${bar:0}" 
for line in "${art[@]}"; do

    part1="${line:0:47}"

    part2="${line:47}"
    

    processed_part1=""
    for (( i=0; i<${#part1}; i++ )); do
        char="${part1:$i:1}"
        if [[ "$char" == "_" || "$char" == "/" || "$char" == "|" || "$char" == "\\" ]]; then
            processed_part1+="${gray}${char}${reset}"
        else
            processed_part1+="${green}${char}${reset}"
        fi
    done
    
    processed_part2=""
    for (( i=0; i<${#part2}; i++ )); do
        char="${part2:$i:1}"
        if [[ "$char" == "_" || "$char" == "/" || "$char" == "|" || "$char" == "\\" ]]; then
            processed_part2+="${gray}${char}${reset}"
        else
            processed_part2+="${red}${char}${reset}"
        fi
    done
    
    printf "%b%b\n" "$processed_part1" "$processed_part2"
done
echo "${bar:0}" 
printf "%b%b\n" "${yellow}                     Welcome to Raspi Host! - No BS hosting since 2024"
printf "%b\n" "${reset} "
random_motd=${motds[$RANDOM % ${#motds[@]}]}
printf "%b%b\n" "${mike}Raspi_dude's MOTD: " "${porple}$random_motd"
printf "%b%b\n" "${yellow}Pro tip: Instead of editing the ServerConfig.toml file, edit the values under the Startup tab"

if [[ ! -f "$TOS_FILE" ]]; then
    echo "$TOS_NOTICE" > "$TOS_FILE"
    echo "tos=false" >> "$TOS_FILE"
    echo -e "\033[1;33mTOS file created. You must accept the TOS to continue.\033[0m"
fi

tos_status=$(grep -i "^tos=" "$TOS_FILE" | cut -d '=' -f2 | tr '[:upper:]' '[:lower:]')
if [[ "$tos_status" != "true" ]]; then
    echo -e "\033[1;31mTOS not accepted.\033[0m"
    echo "Visit https://raspihost.org/tos"
    echo "Do you accept the TOS? (Type in yes/no below): "

    read -r user_input
    user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

    if [[ "$user_input" == "yes" || "$user_input" == "y" ]]; then
        {
            echo "$TOS_NOTICE"
            echo "tos=true"
        } > "$TOS_FILE"
        echo -e "\033[1;32mTOS accepted. Continuing...\033[0m"
    else
        echo -e "\033[1;31mYou must accept the TOS to continue. Exiting.\033[0m"
        exit 1
    fi
fi

cd /home/container || exit 1

rm -f BeamMP-Server

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    MATCH="Server.debian.12.x86_64"
else
    MATCH="Server.debian.12.arm64"
fi

if [ -z "${VERSION}" ] || [ "${VERSION}" = "latest" ]; then
    echo "Using latest BeamMP server version..."
    DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/BeamMP/BeamMP-Server/releases/latest" \
        | grep "browser_download_url" \
        | grep "$MATCH" \
        | head -n 1 \
        | cut -d '"' -f 4)
else
    echo "Using BeamMP version: ${VERSION}..."
    # Fetch the specific release by tag and parse it properly
    DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/BeamMP/BeamMP-Server/releases/tags/${VERSION}" \
        | grep "browser_download_url" \
        | grep "$MATCH" \
        | head -n 1 \
        | cut -d '"' -f 4)
fi

if [ -z "$DOWNLOAD_URL" ]; then
    echo "Error: Could not find download URL. Please note that versions any older than v3.2.2 will not work."
    exit 1
fi

curl -sSL "$DOWNLOAD_URL" -o BeamMP-Server
chmod +x BeamMP-Server
