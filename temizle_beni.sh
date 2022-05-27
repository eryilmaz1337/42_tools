#!/bin/bash
# Colors
blue=$'\033[1;34m'
cyan=$'\033[1;96m'
reset=$'\033[0;39m'

red=$'\033[0;31m'
green=$'\033[0;32m'


clear;
echo "--------------------------------------------------------------------------------"
initial_df=$(df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$")
echo -e "${blue}Geçerli alan:\n${reset}${initial_df}${reset}"
echo -e "${blue}\nAna klasör:${reset}"
du -hd1 . 2>/dev/null | sort -h | grep --color=always "[0-9]*\.*[0-9]*M\t\|[0-9]*\.*[0-9]*G\t\|$"
echo ""
echo "--------------------------------------------------------------------------------"
cd;
read -n1 -p "${blue}Bilgisayarınızda yer açmak istermisiniz ?[${green}y${cyan}/${red}N${blue}]${reset} " input
echo ""

if [ -n "$input" ] && [ "$input" = "y" ]; then
    echo "Temizlik başlıyor.....";
    echo "./.Trash/* Temizleniyor......"
    rm -rf ./.Trash/*;
    echo "./.cache/* Temizleniyor......"
    rm -rf ./.cache/*;
    echo "./Library/Caches/* Temizleniyor......"
    rm -rf ./Library/Caches/*;
    echo "./Library/Containers/com.docker.docker/* Temizleniyor......"
    rm -rf ./Library/Containers/com.docker.docker/*;
    echo "./Library/Containers/* Temizleniyor......"
    rm -rf ./Library/Containers/*;
    echo "./Library/Application Support/Code/User/* Temizleniyor......"
    rm -rf ./Library/Application Support/Code/User/*;
    echo "./Library/Application Support/Code/CachedData/* Temizleniyor......"
    rm -rf ./Library/Application Support/Code/CachedData/*;
    echo "./Library/Developer/CoreSimulator/* Temizleniyor......"
    rm -rf ./Library/Developer/CoreSimulator/*;
    else
    echo "Temizlik yapılmadı.";
    fi
read -n1 -p "${blue}İndirilenler klasörünü de temizlemek ister misiniz ?[${green}y${cyan}/${red}N${blue}]${reset} " input
echo ""
if [ -n "$input" ] && [ "$input" = "y" ]; then
        echo "İndirilenler temizleniyor......";
		rm -rf ./Downloads/*;
    echo "--------------------------------------------------------------------------------"
    echo -e "${blue}\nTemizlikten önceki alan:\n${reset}${initial_df}${blue}\n\nTemizlikten sonraki alan:${reset}"
        df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$"
    echo "--------------------------------------------------------------------------------"
    else
    echo "İndirilenler temizlenmedi.";
    echo "--------------------------------------------------------------------------------"
    echo -e "${blue}\nTemizlikten önceki alan:\n${reset}${initial_df}${blue}\n\nTemizlikten sonraki alan:${reset}"
        df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$"
    echo "--------------------------------------------------------------------------------"
    
	fi

#