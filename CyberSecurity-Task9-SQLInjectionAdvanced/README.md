# Task 9: Advanced SQL Injection Exploitation (DVWA Medium)

## 📌 Executive Summary
This project is a continuation of Task 3, moving from a **Low** security environment to a **Medium** security level within the Damn Vulnerable Web Application (DVWA). The primary objective was to bypass input restrictions (dropdown menus) and exploit SQL Injection vulnerabilities using a combination of **Burp Suite** for request interception and **sqlmap** for automated database enumeration.

## 🛠️ Lab Environment & Tools
- **Target**: DVWA (Damn Vulnerable Web Application) running in Docker.
- **OS**: Linux Mint / AntiX VM.
- **Tools Used**:
  - **Burp Suite**: Used as an intercepting proxy to modify requests that the frontend (dropdown menu) otherwise restricted.
  - **sqlmap**: Used for automated database dumping and enumeration.
  - **Chromium**: Browser configured to proxy traffic through Burp Suite.
  - **Docker**: To host the vulnerable environment.

## 🚀 Implementation Process

### 1. Environment Setup
The lab was initialized by launching the DVWA container:
```bash
docker run --rm -it -p 80:80 vulnerables/web-dvwa:latest
```
The security level was manually set to **Medium** via the DVWA security settings page.

### 2. Bypassing Frontend Restrictions (Burp Suite)
At the Medium security level, the application replaces the text input field with a **dropdown menu**, preventing the direct entry of SQL payloads. 

**The Solution**: 
I used Burp Suite to intercept the HTTP request sent when selecting an ID from the dropdown. By modifying the `id` parameter in the intercepted request, I was able to inject payloads directly into the backend.

**Key Payloads Used**:
- **Bypass/Dump All**: `id=1 OR 1=1` (Returns all users in the table).
- **Database Discovery**: `id=1 UNION SELECT null, database() -- -` (Reveals the current database name).
- **Credential Extraction**: `id=1 UNION SELECT null, username, password FROM users -- -` (Dumps user credentials).

### 3. Automated Exploitation (sqlmap)
To automate the data extraction, I integrated sqlmap. A critical discovery during this phase was that sqlmap defaults to the "Low" security level unless the session cookie is provided.

**The Solution**:
I captured the `PHPSESSID` and `security=medium` cookie from Burp Suite and passed it to sqlmap using the `--cookie` flag.

**Command Syntax**:
```bash
sqlmap -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" \
  --cookie="PHPSESSID=[YOUR_SESSION_ID]; security=medium" \
  --level=3 --risk=2 --batch --dbs
```

## 🖼️ Evidence & Artifacts
The following screenshots document the process:
- `Installing_Sqlmap.png`: Installation of the automation tool.
- `Medium_Security_DropDown_Menu.png`: The frontend restriction encountered.
- `Burp_Suite_Cookie_Observation.png`: Capturing the session token for sqlmap.
- `Database_Name_Scan.png`: Successful extraction of the DB name.
- `Table_Dump_Scan.png`: Final dump of the users table.
- `Burp_suite_Dashboard.png`: Burp Suite dashboard overview.
- `Burp_Suite_Scan_on_LoginPage.png`: Scan on login page.
- `Burp_Suite_Scan_on_Localhost.png`: Scan on localhost target.

## 🛡️ Remediation & Prevention
To prevent these types of attacks, the following security measures should be implemented:
1. **Prepared Statements (Parameterized Queries)**: Instead of concatenating user input into SQL strings, use prepared statements to ensure the database treats input as data, not executable code.
2. **Input Validation**: Implement strict allow-lists for input. Even if the frontend uses a dropdown, the backend must validate that the received `id` is actually an integer.
3. **Principle of Least Privilege**: Ensure the database user account used by the application has the minimum permissions necessary (e.g., no access to `information_schema` or administrative tables).
4. **Web Application Firewall (WAF)**: Deploy a WAF to detect and block common SQL injection patterns (like `UNION SELECT` or `OR 1=1`).

---
**Author**: Miguel Bruce  
**Track**: OASIS INFOBYTE Security Analysis
