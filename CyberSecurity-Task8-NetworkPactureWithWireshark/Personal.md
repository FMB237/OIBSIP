# Task 8: Capture Network Traffic with Wireshark
1. **The main aim of this taks is to capture the traffic of we network with wireshark**
2. **What is Wireshark??**
3. Wireshark is a free, open-source network packet analyzer used to capture and inspect data traffic moving across a computer network in real time. It translates raw binary data into a human-readable format, allowing network administrators and security professionals to troubleshoot connectivity issues and analyze security vulnerabilities.
4. For this lab we gonna make a classic packet analysis with Wireshark  i mainly gonna use my Linux Mint host machine and also my AntiX Vm 
5. Or we even used our dvwa container for this lab ti ensure that all our data will bne encrypted.Thats is mainly capturing the data for other web server
6. To start let set up our lab to do that we need to install wireshark on our pc using the follwoing set of **Commands:**
 - `sudo apt udapte `
 - `sudo apt install wireshark -y `  
 - `sudo dkpg-reconfigure wireshark-common`
 - `sudo usermod -aG wireshark $USER`

7. Then logout or restart the pc before    
8. We can used the command **wireshark --version**  to check the version of wireshark we have install 
9. The launch wireshark by typing `wireshark` into our terminal.
9.  On the dashboard we can actaully see all the network interfacts of my pc from the WI-FI connection that is **wlo1** to all my docker  containers that can be observer using the bridge for networks.The Whole work will be done mainly on my Host machine where i will scan that dvwa server or even my Wi-Fi
10. Bro i have working on GNS3 and i mainly want to do this using  a lab like in GNS3 or simpling scaninng a VM 
11. So i will just launch the DVWA container and track the http method packets on wiresqhark then give back the results.
12. Start the capture and just filter the http packets 