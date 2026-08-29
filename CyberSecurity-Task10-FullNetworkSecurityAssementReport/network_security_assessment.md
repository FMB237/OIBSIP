# Full Network Security Assessment Report

## 1. Executive Summary
**Overall Risk Posture: Medium-High**

This security assessment was conducted on a local test environment consisting of a host machine, an AntiX VM, and a DVWA (Damn Vulnerable Web Application) container. The assessment revealed several critical vulnerabilities, primarily centered around the web application and network service exposure.

**Key Findings:**
- **Web Vulnerabilities:** The DVWA server is highly vulnerable, with directory indexing enabled on sensitive folders (`/config/`, `/docs/`) and missing security headers (X-Frame-Options), making it susceptible to information disclosure and clickjacking.
- **Service Exposure:** SSH is open across all identified hosts. While necessary for management, it represents a primary attack vector if not properly hardened.
- **Traffic Security:** Analysis of network traffic confirms the presence of unencrypted protocols, which could allow an attacker to intercept sensitive data via Man-in-the-Middle (MITM) attacks.

**Recommendation:** Immediate priority should be given to hardening the web server configuration and enforcing encrypted communication (HTTPS) for all web services.

---

## 2. Scope of Assessment
- **Target IP Range:** `192.168.122.0/24` (Local Virtual Network)
- **Assets Assessed:**
  - Host Machine (`192.168.122.1`)
  - AntiX VM / Test Hosts (`192.168.122.135`, `192.168.122.136`)
  - DVWA Web Server (`172.17.0.1`)
- **Time Window:** August 29, 2026
- **Tools Used:** Nmap, Wireshark, Nikto

---

## 3. Technical Report

### Phase 1: Reconnaissance (Nmap)
A service and OS detection scan was performed across the target range.

**Findings:**
- **Host 192.168.122.1 (Host):** Open ports 22 (SSH) and 53 (DNS).
- **Hosts 192.168.122.135 & .136:** Open ports 22 (SSH) and 6566 (tcpwrapped).
- **OS Detection:** All hosts are running Linux kernels.

*Evidence: See `nmap_results.txt` and `screenshots/nmap_scan.png`*

### Phase 2: Traffic Analysis (Wireshark)
Network traffic was captured for 5+ minutes to analyze protocol behavior.

**Analysis:**
- **HTTP:** Captured unencrypted GET/POST requests to the DVWA server. Sensitive data (like session cookies) is visible in plain text.
- **DNS:** Standard DNS queries observed for local hostname resolution.
- **ARP:** ARP broadcasts observed during host discovery.
- **Observation:** The lack of TLS/SSL for the web server allows any observer on the network to read all transmitted data.

*Evidence: See `WireShark_Capture.pcapng` and `screenshots/wireshark_analysis.png`*

### Phase 3: Web Vulnerability Scan (Nikto)
An automated scan was performed against the DVWA web server.

**Findings:**
- **Information Leakage:** Server leaks inodes via ETags.
- **Directory Indexing:** `/config/` and `/docs/` directories are accessible, potentially exposing configuration files.
- **Missing Headers:** `X-Frame-Options` is missing, increasing the risk of Clickjacking.
- **Cookie Security:** `PHPSESSID` and `security` cookies are missing the `httponly` flag, making them accessible to malicious JavaScript (XSS).

*Evidence: See `nikto_scan_results.txt` and `screenshots/nikto_scan.png`*

---

## 4. Findings Register

| Finding ID | Description | Severity | Affected Asset | Recommended Fix |
| :--- | :--- | :--- | :--- | :--- |
| F-001 | Directory Indexing enabled on `/config/` and `/docs/` | High | DVWA Server | Disable `Options Indexes` in Apache config |
| F-002 | Unencrypted HTTP Traffic | High | DVWA Server | Implement SSL/TLS (HTTPS) |
| F-003 | Missing `httponly` flag on session cookies | Medium | DVWA Server | Set `session.cookie_httponly = 1` in php.ini |
| F-004 | Missing `X-Frame-Options` header | Medium | DVWA Server | Add `Header always set X-Frame-Options "SAMEORIGIN"` |
| F-005 | SSH Open on multiple hosts | Low | All Hosts | Implement Key-based auth and change default port |
| F-006 | Server version leakage (Apache 2.4.25) | Low | DVWA Server | Set `ServerTokens Prod` and `ServerSignature Off` |

---

## 5. Remediation Roadmap

| Priority | Finding ID | Action | Effort |
| :--- | :--- | :--- | :--- |
| **1 (Critical)** | F-001, F-002 | Disable directory indexing and install SSL certificate | Medium |
| **2 (High)** | F-003, F-004 | Update PHP configuration and Apache security headers | Easy |
| **3 (Medium)** | F-006 | Harden Apache server banners | Easy |
| **4 (Low)** | F-005 | Harden SSH configuration across the network | Medium |
