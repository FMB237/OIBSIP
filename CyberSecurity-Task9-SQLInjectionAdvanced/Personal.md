# Task9: Exploit Advanced SQLInjection Vulnerabilty 

**This task is mainly build to be a continoution of the task3** 

1. Task3 was an sqlinjection with low security set up for this  i use the docker container for **dvwa** vulnerabilities  and that was a great experience but breaking the password was not a fansi thing that is mainly simple with the used of the correct set and pairs and characters.
2. Since we have already have our DVWA setup we just need to launch again the container for this lab i found out that can grep the container image form our docker images using the **Command**: `docker images | grep dvwa` Since the container mainly has that name.
3. We will start the container by typing into our terminal the commands `docker run --rm -it -p 80:80 vulnerables/web-dvwa:latest` then move to our localhost in our browser or the address 172.0.0.1.
4. We will Signin as admin using the password admin then reset the db and move to the secuirity issues to then change the level og security from **low to medium or even advance**
5. Then move on to the **SQLInjecttion tap** and some notes into the input field then  hit the submit button.
6. I mainly forgot for this lab setup we will need to install some tools like **sqlmap and Burp Suite**
7. I main intsall both of then my linux mint system and also my AntiX Vm. Using the set of **Commands:`sudo apt install sqlmap`** This is mainly valable for sqlmap but Burp Suite is a more heavy tool can be install using a script on directly be passing through **flatpaks** But here i will mainly write a Burp Suite installtion script that will just combien all the commands inside a single script or even just download the script and excute it like with classic usage.
8. Now that the script is been download i need to make it excuteable using the command **chmod +x <Script name>**
9. I have added a simple quick installation video that will be used for this repo set up  and also add the screenshoy of the installation of sqlmap to the project.
10. As can see by exploring the Burp suite tool i can mainly see it is a very powerful tool with much options and filters it is really a fully complet network tool.
 
