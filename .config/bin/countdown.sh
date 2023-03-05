# =================================
# Run countdown effect
# =================================
cdown(){
    clear
    N=$1
    while [[ $((--N)) > 0 ]]
      do 
        echo "$N" | figlet -f larry3d -w 60 | lolcat && sleep 1
        clear
    done
    echo "Times Up!" | figlet -f larry3d -w 160 |lolcat
}
