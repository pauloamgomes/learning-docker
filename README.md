# learning-docker
Docker compose for learning locker. Includes latest version learning locker code, MongoDB (configured with default user) and MailHog (for capturing mails).

Usage
-----
### Get the code:
Fork and clone this repository.
```
$ git clone https://github.com/pauloamgomes/learning-docker.git
```
### Running Locally
```
$ cd learning-locker
$ docker-compose build
$ docker-compose up
```
### Open learning locker in the browser
http://localhost:8080
### Access to mailhog for mails
http://localhost:8025

#### Optional
Configure hostnames in your hosts file
```
sudo echo "127.0.0.1  learninglocker.docker" >> /etc/hosts
sudo echo "127.0.0.1  mailhog.docker" >> /etc/hosts
```
And access http://learninglocker.docker:8080/ and http://mailhog.docker:8025/

![Alt text](https://monosnap.com/file/msAegQajdx72HLK1BvlI02ee2NtPR7.png)
