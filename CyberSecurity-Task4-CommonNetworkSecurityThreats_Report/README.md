# Initialing Task 4
This is mainly the task base on the Commmon Network Security Threats Reports
**To start let begin with the main question**
1. **Why network secutiry matters today**:
Network security matters today because digital connectivity drives daily life,remote work, and global business.With the risk of hybrid cloud environments mobile devices and connected hardware  expainding potential entries points we mainly need robust protections in other to prevent cost waste and data thetf in our networks.
2. **Why is it Critical**
- Expanding Attack Surfaces: With hybrid data architecture and smart devices connectivity that means company data will travel far beyond traditional 
- Remote Work : Today workers log in from many differcent locations making making traditional offices work obseltes.
- Ransomware : Criminal that enter into our system look for very important files and ash cash for giving back this files
3. **For Fighting from the Problems we need to some Essential Proctectins Assets in place**
   - Data safety : Strong network security fundamentals keep private customers details and company secrets out of the wrong hands.
   - Money Saved : Stopping a breach early prevents massive recovery fees and legal penalties.
   - System Uptime : Keeping networks safe prevents sudden  crashes and stops daily business operations.
  
# DOS/DDOS Attacks
1. In other to understand DOS/DDOS attacks we need to understnad one thing first that is the **Resource Limit** that is in the IT world we should mainly know that each server,router or webiste has a limit on of RAM,CPU and Storage which will mainly infleunce the number of requests the server will be able to handle. Like we can take a real case example with a simple web-application been deployed on a **VPS(Virtual Private Services)** with the VPS have 2gb RAM,16gb storage (let it is been hdd or ssd ) and 1vCPU.if on this server we deploy a simple python app let say a blog application using docker on which we will run some containers that is mainly the backend with **Flask**, the Database r **Portgres** and the Frontend part will be build up with inside the app directly using the Flask template engine which is **jinja2**.For this app we mainly have only 2 containers the app container and the db-container but since we are building a simple blog app we will need to set up user accounts which will be store inside the DB. When our app will have 10 users it will really fine smooth due to the small number of requets it hanble but when we will get 100 users our number of request to handle will increase and it will become very difficult to deal with the storage of user data also we will fact problem to with the RAM since the DB will be Fired by request and when the RAM will be fullo our server made crash.All this illustration is simply **Resource limits**.
2. **DOS(Denail of Service)**
**The concept :** This is a One attacker One Target attack
Imagine a small coffee shop with only one cashier. If one person comes in and asks 1,000 complicated questions without ever buying anything, the cashier is stuck. The shop is "open," but no real customers can get their coffee.That is mainly how it works so we need to multiple packers into a single endpoints to make that endpoint to fail.
**Real-World Scenario: The "Ping of Death" (Classic DoS)**
In the early days of internet attacker ude to send a malformed network packet that will not have the same weight as other packet like if we condiser normal packets to be **32kb** then the attacker sends a packet of **128kb** to the server and with the one large packer the server will fail to handle it so the server will either crash or froze.In both cases the server wil be unavaliable for a period of time.
3. **DDoS (Distributed Denial of Service)**
**The Concept:**  Thousands of attackers →→ One target.
Let take the case of a coffee shop with only one cashier with the cashier the single endpoint with DDOS we can consider that about 500 people suddenlt rush to the cashier at ones.The don't even need to asks for a request by just standing by the doorway.The cashier is overhelmed the shop is physical block.**This type of attack is generally done by bots**.
Add images here.

**Now the biggest Question to answer is how we get Thousands of attacker : The Botnet**
Here attacker do not recrue people but recruits **devices**.The bypasses this devices and take the control of tehm using malware into the access to their personal informations like password in other to use  them for the attack.So the infected devices become **zombies** then the main attacker that is the **BotMaster** sends a single command for all the zombies to attack the target. That is mainly how the DDOS attacke works.

# The 3 main Types of DDOS attacks
1. **Volumetric Attack(The Flood)**
**How it works**: Just sending massive amounts of data to clog the "pipe" (bandwidth).As it name is been said the flood which is refree to like water act in the nature in other to submerge thinks.
**Real-World Scenario: The 2016 Dyn Attack**
Attackers used the **Mirai Botnet** (thousands of infected IoT cameras/DVRs) to flood Dyn, a major DNS provider. Because **Dyn** was the "phonebook" for the internet, when it went down, people couldn't access Twitter, Netflix, or Reddit, even though those sites were actually working fine.That 21 October 2016 was a memorable date in the world of cybersecurity. add image here.

2.  **Protocol Attacks (The "Handshake Trick")**
- **How it works**: Exploiting how the internet connects. The most famous is the **SYN Flood.**
- **Normal Handshake**: Client says "Hello" →→ Server says "Hello back, I'm ready" →→ Client says "Great, let's talk.". This normal handshake is sure a simple proceduce and i can be better explained by the principle of button clicking so be like when a user click on a button it make a request to the server or even to with our chatbots which are pending waiting for requests.
- **SYN Flood**: Client says "Hello" →→ Server says "Hello back, I'm ready" →→ **Client stays silent.**
The server keeps a "slot" open waiting for the client. If the attacker does this 10,000 times, the server runs out of slots and can't accept any new real users.So this process is mainly like opening many  sessions and asking the server to wait of the reponse when this is done many times we mainly have a flood in the server.
3. **Application Layer Attacks (The "Heavy Request")**