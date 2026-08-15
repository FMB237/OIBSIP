# 🐳 Installing Docker on antiX (64-bit)

**Target OS:** antiX Linux (x64)
**Challenge:** antiX is a systemd-free distribution. Standard installation methods (like `apt install docker.io`) fail because they depend on `libsystemd0`. This guide uses official static binaries to bypass those dependencies.

---

## 🚀 Installation Steps

### 1. Download and Install Static Binaries

We use the official static binaries because they are self-contained and do not require a system manager.

```bash
# Create a directory for the installation
mkdir -p ~/docker-bin && cd ~/docker-bin

# Download the latest 64-bit static binary
curl -L https://download.docker.com/linux/static/stable/x86_64/docker-27.3.1.tgz -o docker.tgz

# Extract the files
tar xzvf docker.tgz

# Move the binaries to the system path
sudo cp docker/* /usr/local/bin/
```

### 2. Configure User Permissions

To avoid using `sudo` for every docker command, add your user to the `docker` group.

```bash
# Create the docker group
sudo groupadd docker

# Add your current user to the group
sudo usermod -aG docker $USER

# Apply group changes to the current session
newgrp docker
```

### 3. Create a "Start-Docker" Shortcut

Since antiX does not use `systemctl`, the Docker daemon (`dockerd`) must be started manually. We create an alias to start the engine and fix the socket permissions in one go.

```bash
# Add the alias to your .bashrc file
echo "alias start-docker='sudo dockerd > /tmp/docker.log 2>&1 & sleep 2 && sudo chown root:docker /var/run/docker.sock'" >> ~/.bashrc

# Refresh your terminal configuration
source ~/.bashrc
```

---

## 🛠️ Daily Usage Guide

### Starting Docker

Every time you reboot your VM, you must start the Docker engine manually. Simply type:

```bash
start-docker
```

### Verifying the Installation

Check if the engine is running and accessible without `sudo`:

```bash
docker ps
```

### Troubleshooting

|
 Issue 
|
 Solution 
|

|

:---

|

:---

|

|

**
Permission Denied
**
 on socket 
|

`sudo chown root:docker /var/run/docker.sock`

|

|

**
Daemon not starting
**

|
 Check logs: 
`cat /tmp/docker.log`

|

|

**
Command not found
**

|
 Ensure 
`/usr/local/bin`
 is in your 
`$PATH`

|

---

*Guide created by nanobot 🐈 for Miguel's DevSecOps Knowledge Base.*
