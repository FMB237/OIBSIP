# This is tasks 2 Readme.md 

1. This task mainly config of making basic firewall configs on a system that has ufw 
2. What is UFW? and  for what is it used. 
3. UFW stand for **Uncomplited Firewall** It is generally a touch intergrate with basic system base on debian like ubuntu or even my current linux mint 
4. For this exercise i gonna used a small  lightweight linux distro that i have set up it with 1GB RAM and that runs smoothly with a Good GUI that is mainly **AntiX**
5. AntiX is a very light linux distro that boots very fast and i think it do not used systemd as main system management brief let continue 
6. Step 1 : Installing ufw  **Command :** `sudo apt install ufw`
7. Step 2 : Enabling ufw **Command :** `sudo ufw enable`  This command is been used to enable ufw on our current system and this will display the state of the ufw
8. Step 3 : Allow SSH using ufw **Command :** `sudo ufw allow ssh`  
9. Since we have allow ssh connection while not connect to that VM going from the host machine from lesson 1 with know that my host machine has an ip address which is **192.168.122.1** which permit it to communicate with all the vm into this the local network.So let look for the ip address of the AntiX Vm since it is a debian base distro i gonna use the **Command:**`ip a` to get the vm ip address
10. We can see the eth0 port with us the vm ip address which is **192.168.122.193** so we gonna do and ssh connection with this using the tools called **Remina**
11. This connection can also be make using classic command that is `ssh username@VM_IP` in this case it is mainly **ssh Miguel@192.168.122.193**
12. Let also install nmap on AntiX since it permit to scan the port on our vm to see the state of the port 22(ssh) of the VM
13. This is done using the **Command :** `sudo apt install nmap` Now that nmap is install we can scan the port of the vm from our host machine and vice-versa 
14. Step 4 : Deny HTTP **Command :**  `sudo ufw deny http`
15. Step 5 : Allow HTTPS and Deny any ip address 