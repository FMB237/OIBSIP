# CyberSecurity-Task10-FullNetworkSecurityAssementReport

## Project Overview
This project is the final task for the OASIS INFOBYTE Cyber Security Internship. It is a full end-to-end network security assessment of a local test environment, demonstrating the use of reconnaissance, traffic analysis, and web vulnerability scanning tools.

**Intern:** Miguel Bruce  
**Track:** Cyber Security  
**Task:** Task 10 - Full Network Security Assessment Report

## Scope
- **Target Network:** `192.168.122.0/24`
- **Assets:** Host Machine `192.168.122.1`, AntiX VM `192.168.122.135/.136`, DVWA Web Server `172.17.0.1`
- **Tools Used:** Nmap, Wireshark, Nikto

## Assessment Phases

### Phase 1: Reconnaissance with Nmap
Performed service and OS detection scan across the local virtual network.
- Command used: `nmap -sV -O 192.168.122.0/24 -oN nmap_results.txt`
- Findings: SSH open on all hosts, DNS service on host, tcpwrapped service on VMs.
- Video: `nmap_Scan_Phase.mp4`
- Screenshots: `screenshots/nmap_scan.png`

### Phase 2: Traffic Analysis with Wireshark
Captured 5+ minutes of live network traffic and analyzed HTTP, DNS, ARP and TCP protocols.
- Capture file: `WireShark_Capture.pcap`
- Filters applied: `http`, `dns`, `arp`, `tcp`
- Observation: Unencrypted HTTP traffic and session cookies visible in plain text.
- Video: `Wireshark_Captures.mp4`
- Screenshots: `screenshots/http_Wireshark.png`, `screenshots/dns_Wireshark.png`, `screenshots/arp_wireshark.png`, `screenshots/tcp_wireshark.png`

### Phase 3: Web Vulnerability Scan with Nikto
Automated vulnerability scan against DVWA web server.
- Command used: `nikto -h 172.17.0.1 -o nikto_scan_results.txt`
- Findings: Directory indexing, missing security headers, cookie flags missing, server version leakage.
- Video: `nikto_scan.mp4`
- Screenshots: `screenshots/nikto_scan.png`

## Deliverables
- `network_security_assessment.md` - Full professional security report with Executive Summary, Findings Register, and Remediation Roadmap
- `nmap_results.txt` - Raw Nmap scan output
- `nikto_scan_results.txt` - Raw Nikto scan output
- `WireShark_Capture.pcap` - Wireshark capture file
- `screenshots/` - Evidence screenshots for report
- Demo videos for each phase

## Findings Summary
See `network_security_assessment.md` for full Findings Register and Remediation Roadmap.

Key issues identified:
- Directory indexing enabled on DVWA `/config/` and `/docs/`
- Unencrypted HTTP traffic
- Missing `httponly` and `X-Frame-Options` headers
- SSH exposed on multiple hosts

## Ethical Note
All scans were performed only on systems owned and controlled by the author in a local lab environment. No external or production systems were scanned.

## Repository Structure
```
CyberSecurity-Task10-FullNetworkSecurityAssementReport/
├── network_security_assessment.md
├── nmap_results.txt
├── nikto_scan_results.txt
├── WireShark_Capture.pcap
├── nmap_Scan_Phase.mp4
├── Wireshark_Captures.mp4
├── nikto_scan.mp4
├── screenshots/
│   ├── nmap_scan.png
│   ├── nikto_scan.png
│   ├── http_Wireshark.png
│   ├── dns_Wireshark.png
│   ├── arp_wireshark.png
│   └── tcp_wireshark.png
└── README.md
```
