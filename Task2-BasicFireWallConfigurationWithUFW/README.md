# This is tasks 2 Readme.md 

1. This task mainly config of making basic firewall configs on a system that has ufw 
2. What is UFW? and  for what is it used. 
3. UFW stand for **Uncomplited Firewall** It is generally a touch intergrate with basic system base on debian like ubuntu or even my current linux mint 
4. For this exercise i gonna used a small  lightweight linux distro that i have set up it with 1GB RAM and that runs smoothly with a Good GUI that is mainly **AntiX**
5. AntiX is a very light linux distro that boots very fast and i think it do not used systemd as main system management brief let continue 
6. Step 1 : Installing ufw  **Command :** `sudo apt install ufw`
7. Step 2 : Enabling ufw **Command :** `sudo ufw enable`  This command is been used to enable ufw on our current system and this will display the state of the ufw
8. Step 3 : Allow SSH using ufw 
**Command**: `sudo ufw allow ssh` 