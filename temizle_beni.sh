#!/bin/bash
# Colors
purple=$'\033[1;34m'
reset=$'\033[0;39m'
red=$'\033[0;31m'
green=$'\033[0;32m'

# Commands
git pull;
clear;
echo "--------------------------------------------------------------------------------"
initial_df=$(df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$")
echo -e "${purple}Geçerli alan:\n${reset}${initial_df}${reset}"
echo ""
echo "--------------------------------------------------------------------------------"
cd;
read -n1 -p "${purple}Bilgisayarınızda yer açmak istermisiniz ?[${green}y${purple}/${red}N${purple}]${reset} " input
echo ""

if [ -n "$input" ] && [ "$input" = "y" ]; then
    echo "Temizlik başlıyor lütfen bekleyin...";
    echo "./.Trash/* Temizleniyor lütfen bekleyin..."
    rm -rf ./.Trash/*;
    echo "./.cache/* Temizleniyor lütfen bekleyin..."
    rm -rf ./.cache/*;
    echo "./Library/Caches/* Temizleniyor lütfen bekleyin..."
    rm -rf ./Library/Caches/*;
    echo "./Library/Containers/com.docker.docker/* Temizleniyor lütfen bekleyin..."
    rm -rf ./Library/Containers/com.docker.docker/*;
    echo "./Library/Containers/* Temizleniyor lütfen bekleyin..."
    rm -rf ./Library/Containers/*;
    echo "./Library/Application Support/Code/User/* Temizleniyor lütfen bekleyin..."
    rm -rf ./Library/Application Support/Code/User/*;
    echo "./Library/Application Support/Code/CachedData/* Temizleniyor lütfen bekleyin..."
    rm -rf ./Library/Application Support/Code/CachedData/*;
    echo "./Library/Developer/CoreSimulator/* Temizleniyor lütfen bekleyin..."
    rm -rf ./Library/Developer/CoreSimulator/*;
    echo "${green}Temizlik yapıldı."
    else
    echo "Temizlik yapılmadı.";
    fi
read -n1 -p "${purple}İndirilenler klasörünü de temizlemek ister misiniz ?[${green}y${purple}/${red}N${purple}]${reset} " input
echo ""
if [ -n "$input" ] && [ "$input" = "y" ]; then
        echo "İndirilenler temizleniyor lütfen bekleyin...";
		rm -rf ./Downloads/*;
        echo "${green}Temizlik yapıldı."
    echo "${reset}--------------------------------------------------------------------------------"
    echo -e "${purple}\nTemizlikten önceki alan:\n${reset}${initial_df}${purple}\n\nTemizlikten sonraki alan:${reset}"
        df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$"
    echo "--------------------------------------------------------------------------------"
    else
    echo "İndirilenler temizlenmedi.";
    echo "--------------------------------------------------------------------------------"
    echo -e "${purple}\nTemizlikten önceki alan:\n${reset}${initial_df}${purple}\n\nTemizlikten sonraki alan:${reset}"
        df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$"
    echo "--------------------------------------------------------------------------------"
    
	fi
# powered by erdem149, yeaktas
