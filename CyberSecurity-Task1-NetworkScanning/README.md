# Basic Network Scanning with Nmap 

**The main objective of this task is mainly to perform a simple network scan using the tool call nmap Which mainly starts for Network Mapper**
For performing this task i gonna used some tools and i will set up a checklist of the tools  i will used
1. Setup: Use a VM(For my case i gonna mainly used alpine server which is one of my VMs)
2. I gonna install nmap on it which is mainly done using the command **sudo apk add nmap**
3. For we gonna ssh into our Alpine server passing through my host machine. using the command **ssh Bruce192.168.122.172**
4. For facilitaing the connection i gonna used the tool Called Remina in order to save this connection for other uses.
5. Then since i vm will in set up in NAT then i will receive and ip address generally with the format **192.168.122.x on pc**
6. Since we Vm and the host are in the same network the can communicate with each other for that i will just do a simple test that is mainly the ping between the machines
7. **HOST_IP=192.168.122.1** and **ALPINE_SERVER_IP=192.168.122.172**
8. So i gonna do a ping on both server that is **ping 192.168.122.172** from the host machine  and **ping 192.168.122.1**  from alpine server 
9. After the ping succesful we can now  start using nmap and we can used in both directions depending on the firewall configs of each machines
10. So first i gonna do from the host machine to the VM that is mainly  **nmap 192.168.122.172** 
11. The result of the scan 
12. Additinal nmap commands can be listed using the command **nmap -h** which means nmap help 
13. Let do a service version scan using the command **nmap -sv [target IP]**.Here i gonna do this from the VM to the host machine 
14. Facing a small error with the script of nmap for the command since alpine does not have an intergrate nmap-script so i gonna add it using the command **sudo apk add nmap-scripts**
15. **OS Detection scan**  this will done from the VM to the host machine using the command **nmap -O 192.168.122.1** which mainly require root permission  to be done 
16. 