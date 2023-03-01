how to make this work:

run jenkins docker:
docker run --name=jenkins-master --restart=unless-stopped -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock myjenkins:latest

install docker inside jenkins docker :
apt-get install docker.io -y

add user jenkins to  docker group:
usermod -aG docker jenkins

make sure the user added:
grep docker /etc/group


Provide read write permission to docker.sock file:
chmod 666 /var/run/docker.sock

restest PID :
ps aux
kill -9 <PID Number>
  
