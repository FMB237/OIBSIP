# Task3 SQL Injection on DVWA

This will be a new task for me since i have never done something like this 
What is SQL Injection ??  and what is the meaning of DVWA
DVWA mainly means (Damn Vulnerable Web Application).This is mainly define as a low level secutiry test where sql in been injected into a webserver inother to check the vulnerability of the server like unvalidated user input alterted user backend database logic

Let tall more about low level security. 
**LOW LEVEL SECURITY**
At low level secutity the application performs no input validation and santization,directly concatening user inputs into db query.
- **Test Payload :**  Like typing ` OR '1'='1` or `1' OR '1'='1` into the user ID box and submit.
- **Behaviour :** The backend query evaluate to true for all rows,forcing  the application dump all user records from the db instead of a single users.


**For this Task we have mainly many possible setups.**
1. Installing a full web sever like **XAMP or LAMP** for testing.
2. The fast method using **Docker** for making this test

**Why using docker ??** 
1. To avoid system mess up since we mainly used and isolated environment which is a docker for our test
2. Since with docker we can destroy and recreate the container as we have  since i will pull the docker images for this task
3. Docker is fast and will take less space and memory for this task

So This will the infrastructure of the lab


**Moving to LAB**
1. Since i already have docker install and running on my linux mint host will only need to pull the container but for those who will like to install and set up docker then the will move the script i created that  
2. **NB:** This was a script i created to install docker on multiple ubuntu VM 
3. The script is inside this folder with name  install_docker.sh 
4. user will only need to make it execuatable using the command `chmod +x install_docker.sh` and if you don't want to logout before using docker then run the command `newgrp docker`.

**Launching the Lab**
1. For launching this lab we needed to pull and detach a docker conatainer for this lab.
2. We pull to pull the DVWA container and run on port 80 
3. **Command:** `docker run --rm -it -p 80:80 vulnerables/web-dvwa` 
4. Whats is Command does : 
   - **-p 80:80:** Maps port 80 of the container to port 80 of your machine.
   - **--rm**: Automatically deletes the container when you stop it (keeps your system clean).
   - **vulnerables/web-dvwa**: The official "Damn Vulnerable Web App" image.
5. Let me do that a take captures of that work.
6. let also set up the  simple docker command to run the DVWA container as a simple script in other to avoid human errors
7. So the script `dvwa.sh` i created for that also put it into a folder call the script folder and will contains  to scripts inside it.
8. To check our running docker locally we used the command `docker ps `
9. Since the container is running and healthy we can thebn move to our `localhost`
10. login with the following credential **Username: `admin`** and **Password : `password`**
11. Then we will be redirected to a setup.php page where at the bottom of the page we created a database by clicking on a button call create db since we have not yet initiaze a database 
12. Then we will logout and then login again with the same credentails
13. 