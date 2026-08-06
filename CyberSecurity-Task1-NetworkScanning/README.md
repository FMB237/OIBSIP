# Basic Network Scanning with Nmap 

**The main objective of this task is mainly to perform a simple network scan using the tool call nmap Which mainly starts for Network Mapper**
For performing this task i gonna used some tools and i will set up a checklist of the tools  i will used
1. Setup: Use a VM(For my case i gonna mainly used alpine server which is one of my VMs)
2. I gonna install nmap on it which is mainly done using the command **apk add nmap**
3. Then since i vm will in set up in NAT then i will receive and ip address generally with the format **192.168.122.x on pc**
4. Since we Vm and the host are in the same network the can communicate with each other for that i will just do a simple test that is mainly the ping between the machines
5. **HOST_IP=192.168.122.1** and **ALPINE_SERVER_IP=192.168.122.172**
6. So i gonna do a ping on both server that is **ping 192.168.122.172** from the host machine  and **ping 192.168.122.1**  from alpine server 
7. After the ping succesful we can now  start using nmap and we can used in both directions depending on the firewall configs of each machines
8. So first i gonna do from the host machine to the VM that is mainly  **nmap 192.168.122.172** 
9. 