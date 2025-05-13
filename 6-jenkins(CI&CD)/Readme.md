# push code to github 
```bash
git init
git add .
git commit -m "CI/CD through jenkins"
git push origin main
```

# Install Jenkins locally on Windows:
Option 1: Using the WAR file:

```bash
mkdir ~/jenkins
cd ~/jenkins
curl -L -O https://get.jenkins.io/war-stable/2.504.1/jenkins.war
java -jar jenkins.war
```
Option 2: Using the Windows installer:

1.Download the Windows installer from Jenkins.io
2.Run the installer and follow the prompts
3.Access Jenkins at http://localhost:8080

```
    _pat_11A3LIPNY0RprslWVaml6F_LfsBJ6vKuiV97EAPjZBH8qnwalS88KeSOt1DEcUkRLBIXO6OXDWGCOO4Uwe
``` 
# Jenkins Job Configuration

```bash
# Build Docker image
docker build . -t flask-app

# Stop any running container with the same name
docker stop flask-app || true
docker rm flask-app || true

# Run Docker container
docker run -p 8000:5000 -d --name flask-app flask-app
```


