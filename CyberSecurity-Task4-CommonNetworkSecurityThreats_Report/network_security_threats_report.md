# Report: Common Network Security Threats
**Internship:** Oasis Infobyte | **Track:** Cyber Security
**Author:** Miguel Bruce

---

## 1. Introduction: Why Network Security Matters Today

In an era where digital connectivity drives almost every aspect of daily life—from remote work and global business to personal communication—network security has transitioned from a "luxury" to a critical necessity. 

### Why is it Critical?
*   **Expanding Attack Surfaces:** With the rise of hybrid cloud environments, mobile devices, and the Internet of Things (IoT), the number of potential entry points for attackers has grown exponentially. Data no longer stays within a physical office; it travels across various networks and devices.
*   **The Shift to Remote Work:** The modern workforce logs in from diverse locations worldwide, making traditional "perimeter-based" security (like a single office firewall) obsolete.
*   **The Rise of Ransomware:** Cybercriminals now target critical files and encrypt them, demanding cash for their release. This doesn't just steal data; it halts entire business operations.

### Essential Protection Assets
To combat these threats, organizations must prioritize:
*   **Data Integrity & Safety:** Ensuring private customer details and company secrets remain confidential.
*   **Financial Stability:** Stopping a breach early prevents massive recovery fees, legal penalties, and loss of revenue.
*   **System Uptime:** Robust security prevents sudden crashes and ensures that daily business operations continue without interruption.

![Network Security Overview](images/what-is-network-security.jpg)

---

## 2. Understanding DoS and DDoS Attacks

To understand these attacks, we must first understand the concept of **Resource Limits**. Every piece of IT infrastructure—whether it's a router, a server, or a website—has a finite amount of RAM, CPU, and Bandwidth.

### The Resource Limit Illustration
Imagine a simple blog application deployed on a **VPS (Virtual Private Server)** with:
*   **CPU:** 1 vCPU
*   **RAM:** 2GB
*   **Storage:** 16GB

The app uses **Docker** to run a **Flask** backend and a **PostgreSQL** database. When the app has 10 users, it runs smoothly. However, as the user base grows to 100 or 1,000, the number of requests increases. The database must fire more queries, and the RAM fills up. Once the resource limit is hit, the server crashes. **Attackers exploit this limit intentionally.**

### A. DoS (Denial of Service)
**The Concept:** One Attacker $\rightarrow$ One Target.

**Analogy:** Imagine a small coffee shop with only one cashier. If one person comes in and asks 1,000 complicated questions without ever buying anything, the cashier is stuck. The shop is "open," but no real customers can get their coffee.

**Real-World Scenario: The "Ping of Death"**
In the early days of the internet, attackers sent "malformed" network packets. While a normal packet might be **32KB**, an attacker would send a packet of **128KB**. The server, unable to handle a packet of that size, would either freeze or crash, becoming unavailable to all users.

### B. DDoS (Distributed Denial of Service)
**The Concept:** Thousands of Attackers $\rightarrow$ One Target.

**Analogy:** Instead of one annoying customer, imagine 500 people suddenly rushing the coffee shop at once. They don't even need to ask questions; they just block the doorway. The cashier is overwhelmed, and the shop is physically inaccessible.

![DoS vs DDoS](images/Difference-between-DoS-and-DDoS-Attack.jpeg)

#### How it works: The Botnet
Attackers don't recruit people; they recruit **devices**. By using malware, they take control of insecure IoT devices (cameras, DVRs, smart fridges) and turn them into **"Zombies."** The main attacker, known as the **BotMaster**, sends a single command, and the entire army of zombies attacks the target simultaneously.

![DDoS Mechanism](images/demystifying-dos-and-ddos-attacks.png)

---

## 3. The Three Main Types of DDoS Attacks

### 1. Volumetric Attacks (The Flood)
**How it works:** This is the most common type of attack. It involves sending massive amounts of data to clog the network "pipe" (bandwidth), effectively submerging the target in traffic.

**Real-World Scenario: The 2016 Dyn Attack**
On October 21, 2016, attackers used the **Mirai Botnet** (thousands of infected IoT devices) to flood **Dyn**, a major DNS provider. Since Dyn acted as the "phonebook" for the internet, when it went down, users couldn't access sites like Twitter, Netflix, or Reddit, even though those websites themselves were functioning perfectly.

![Dyn Attack](images/DDOS_attack_on_Dyn.png)

### 2. Protocol Attacks (The "Handshake Trick")
**How it works:** These attacks exploit the way network protocols establish connections. The most famous is the **SYN Flood**.

*   **Normal TCP Handshake:** 
    Client: "Hello" $\rightarrow$ Server: "Hello back, I'm ready" $\rightarrow$ Client: "Great, let's talk."
*   **SYN Flood:** 
    Client: "Hello" $\rightarrow$ Server: "Hello back, I'm ready" $\rightarrow$ **Client stays silent.**

The server keeps a "slot" open waiting for the response. If an attacker does this 10,000 times, the server runs out of available slots and cannot accept any new legitimate users.

### 3. Application Layer Attacks (The "Heavy Request")
**How it works:** These are "low and slow" attacks. They don't require much bandwidth, but they force the server to perform computationally expensive tasks.

**Real-World Scenario: The "Search" Attack**
Imagine a website with a search bar. A normal user searches for "Shoes," and the server finds them in 0.1 seconds. An attacker sends a request for a search that is incredibly complex (e.g., *"Find every product containing the letter 'e' and sort them by date and price"*). 

If the attacker sends 100 of these "heavy" requests, the server's CPU hits 100%, and the site freezes. This is similar to the input-based attacks seen in tools like **DVWA**, where specific inputs can crash or compromise a server.
