# Big Data Devops Training Application


A simple Big Data application which stores tweets in a graph and visualises top tags as a word cloud. Contains multiple components on which DevOps principles can be applied.

## Usage

You will need to authenticate with Twitter to use this application. To do
so, sign up for developer credentials and create a Twitter app here:

	https://dev.twitter.com/apps/

You can then create a bearer token by running:
`curl -XPOST -u consumer_key:consumer_secret 'https://api.twitter.com/oauth2/token?grant_type=client_credentials'`

e.g
```
Nabils-MacBook-Pro:advanced-db-assignment nabilh$ curl -XPOST -u wQH9WICPLqMWNcVpo3i0puGEk:wpS92B91bdhyernKxMjIdnghJxj85WTD8Tnn7UoDhIYoPRjVHX 'https://api.twitter.com/oauth2/token?grant_type=client_credentials'
{"token_type":"bearer","access_token":"AAAAAAAAAAAAAAAAAAAAAE9r4QAAAAAAqXzal2RIN5nDM8prohawgll7jjU%3DvZlyLZ8tBOQzXU1GuTq9AfOmIIwL7zPI0KUpYKt2QhM3y6WClA"}Nabils-MacBook-Pro:advanced-db-assignment nabilh$
```

update the config file with the above details



### Install git
* `sudo yum install git`
* `git clone https://github.com/CapgeminiDataScience/devops-training-sample-project.git`

### Install Docker
* Update installed packages: `sudo yum update -y`
* Install docker: `sudo yum install -y docker`
* Start the docker service: `sudo service docker start`
* Check you can run docker commands without sudo e.g. `docker images`
* If you get th following error, `Cannot connect to the Docker daemon. Is the docker daemon running on this host?` then you need
to add your user to the docker group by running the following:
`sudo usermod -a -G docker ec2-user`(note you will have to log out then back in for this to take effect)

### Run `make` in `db`
* `cd devops-training-sample-project\db`
* `make`
* go to http://localhost:7474 and set default password (username:neo4j,password:neo4j is the default which you change after logging in)

### Run `make` in `analytics`
* `cd devops-training-sample-project\analytics`
* install py2neo python package: `sudo pip install py2neo`
* `make`



#### Visit http://localhost:3000

------------------------------------------------------------------------

## Using CentOS VM

The VM is configured for easy ssh with port forwarding
### Setup
1. Download VirtualBox from http://download.virtualbox.org/virtualbox/5.1.10/VirtualBox-5.1.10-112026-Win.exe
2. Install
3. Download the centos.ova file ( https://drive.google.com/file/d/0B6DGkdfZ1u20WW5HaENNVFRFaUE/view?usp=sharing )
4. Start VirtualBox
  -> Go to File -> Import Appliance -> select centos.ova
  -> check "Reinitialize the Mac address" option and click import
5. Start the VM - once loaded on the login screen select "not listed"
6. Use username "root" with password "root"
7. Open a terminal and type
'cd .ssh/'
8. You will need to get your private keys in the VM. Assuming you have 1 private
key for the bastion box and another for your private instance you will need
to get both on the VM. The easiest way is to copy-paste them.
9. In the terminal type `gedit` -> paste your key and save
   For name write `/.ssh/whatever_key_name` choose whatever name you like for the key

   Do the procedure above for both the bastion key and your key for your private instances
   (you might have the same key for both so no need to do this twice)

10. on the terminal type `chmod 600 whatever_key_name` where you need to replace
    whatever_key_name with the name you saved the key as. Repeat the command for your other key as well

11. Use vim to edit the env file `vim env` -> press "I" to enable insert mode
12. Replace each field with the correct values.
    PRIVATE_INSTANCE_IP is the IP of the machine you have created on AWS
    PRIVATE_KEY_BASTION is the name you saved your bastion key as
    USER_KEY_NAME is the name of your aws keypair - most likely you capgemini username
    PRIVATE_KEY_AWS is the name you saved your private aws key as
    (if you have 1 key for both bastion and private aws instances use the same name on both places)

13. Once the changes are made pres ESC and type `:wq` and hit enter
14. run `make`
15. type `ssh aws`
16. Now you should be able to ssh to your private instance just by typing 'ssh aws'; Ports are also forwarded
    so once your services are running you can go to localhost:7474 and localhost:3000 to view the UI

17. If your create a new private instance you will need to change the env file accordingly and run again make
18. To get the service running follow the guide above or type the following command one after another (this is the exact history I have ran)
* `yum update -y`
* `yum install -y docker`
* `yum install -y git`
* `git clone https://github.com/CapgeminiDataScience/devops-training-sample-project.git`
* `cd devops-training-sample-project/`
* `service docker start`
* `mv env.template env`

vim env -> press "I" -> TWITTER_BEARER= paste your twitter token; and change NEO4J_PASSWORD=password
-> Press ESC -> type `:wq` -> Press Enter

* `cd db/`
* `make`

go to localhost:7474 login using neo4j:neo4j and change the password to "password"

* `cd ../analytics/`
* `pip install -y py2neo`
* `make`

Press CTR+Z

* `bg`

* `cd devops-training-sample-project/web`
* `curl --silent --location https://rpm.nodesource.com/setup_7.x | bash -`
* `yum -y install nodejs`
* `git clone https://github.com/isaacs/npm.git`
* `cd npm`
* `make install`
* `cd ..`
* `npm install`

go to localhost:3000
