#!/bin/bash
#KellyShyno
#Faxe
#version: 1.0.0

chmod -R a+rx *;



banner()
{
clear;
sleep 0.16;
echo -e '\e[1;37m _____\e[0m';
echo -e '\e[1;37m|  ___|_ ___  _____\e[0m';
echo -e '\e[1;31m| |_ / _` \ \/ / _ \ \e[0m';
echo -e '\e[1;31m|  _| (_| |>  <  __/\e[0m';
echo -e '\e[1;37m|_|  \__,_/_/\_\___|\e[0m';
echo "";
echo -e "\e[1;31mversion: 1.0.0\e[0m";
echo "";
}



error()
{
clear;
echo -e "\e[1;31mERROR: write the correct sign..\e[0m";
sleep 0.6;
}



input()
{
echo "";
echo -en "\e[1;37m (\e[0m""\e[1;31m#\e[0m""\e[1;37m_\e[0m""\e[1;31m#\e[0m";
echo -en "\e[1;37m)\e[0m" "\e[1;31m> \e[0m";
}




log()
{
#don't echo something
logArray=( $(ls) );
cd $OLDPWD;
echo "" >> data/log/log.md;
echo "" >> data/log/log.md;
echo "" >> data/log/log.md;
cd $OLDPWD;

  for log in ${logArray[@]}
    do
cd $OLDPWD;
echo "$link/$log" >> data/log/log.md;
cd $OLDPWD;
    done;
}


logAmount()
{
echo -e "\e[1;37mRemoved:\e[0m" "\e[1;31m${#logArray[@]}\e[0m" "\e[1;37mfiles\e[0m";
}



logClear()
{
banner;
echo -e "\e[1;31mlogs\e[0m" "\e[1;37mare cleared\e[0m";
cat /dev/null > data/log/log.md;
sleep 1;
shyno;
}



rootDelete()
{
cd $link;
log;
  if [[ -f /data/data/com.termux/files/usr/bin/tsudo ]]; then
tsudo rm -rf *;
  elif [[ -f /data/data/com.termux/files/usr/bin/sudo ]]; then
sudo rm -rf *;
  else
rm -rf *;
  fi;
cd $OLDPWD;
logAmount;
sleep 1;
}



delete()
{
linkArray=( $(./data/link/link.sh) );
  for link in ${linkArray[@]}
do
    if [[ -d $link ]]; then
banner;
echo -e "\e[1;37mDirectory:\e[0m" "\e[1;31m$link\e[0m";
sleep 1;
rootDelete;
    else
banner;
echo -e "\e[1;37mDirectory:\e[0m" "\e[1;31m$link\e[0m" "\e[1;37mdoesn't exist\e[0m";
sleep 1.6;
    fi;
done;
banner;
echo -e "\e[1;37mComplete..";
sleep 1;
shyno;
}



aboutUs()
{
banner;
echo -en "\e[1;31m⊹ \e[0m";
echo -e "\e[1;37mProgram:\e[0m" "\e[1;4;31mFaxe\e[0m";
echo -en "\e[1;31m⊹ \e[0m";
echo -e "\e[1;37mAuthor:\e[0m" "\e[1;4;31mKellyShyno\e[0m";
echo -en "\e[1;31m⊹ \e[0m";
echo -e "\e[1;37mVk:\e[0m" "\e[1;4;31mhttps://vk.com/linuxkelly\e[0m";
echo "";

#inputBlock
echo -e "\e[1;37m================\e[0m";
echo -en '\e[1;37m|  \e[0m'"\e[1;37m[ \e[0m""\e[1;31mx\e[0m""\e[1;37m ] \e[0m";
echo -e "\e[1;31mback\e[0m"'\e[1;37m  |\e[0m';
echo -e "\e[1;37m================\e[0m";
input;
  read backUs
    case $backUs in
"x") shyno; ;;
*) error; aboutUs; ;;
    esac;
}



shyno()
{
banner;
echo -e "\e[1;37m/ \e[0m""\e[1;31m1\e[0m""\e[1;37m / \e[0m""\e[1;31mstart\e[0m";
echo -e "\e[1;37m/ \e[0m""\e[1;31m2\e[0m""\e[1;37m / \e[0m""\e[1;31mclear log\e[0m";
echo -e "\e[1;37m/ \e[0m""\e[1;31m3\e[0m""\e[1;37m / \e[0m""\e[1;31mabout us\e[0m";
echo -e "\e[1;37m/ \e[0m""\e[1;31mu\e[0m""\e[1;37m / \e[0m""\e[1;31mupdate\e[0m";
echo -e "\e[1;37m/ \e[0m""\e[1;31mx\e[0m""\e[1;37m / \e[0m""\e[1;31mexit\e[0m";
input;
 read shy
    case $shy in
1) delete ;;
2) logClear; ;;
3) aboutUs; ;;
"u") ./data/update/update.sh; shyno; ;;
"x") echo ""; exit 0; ;;
*) error; shyno; ;;
    esac;
}
shyno;
