# Kubernetes Docker Demo

https://chatgpt.com/share/68233537-8220-8012-80b1-231562490862

## Project Overview

This project demonstrates a simple Node.js application containerized with Docker and deployed on Kubernetes using Minikube. The application is a basic Express.js web server that returns a welcome message.

## Project Structure

```
devops/k8s-docker-demo/
│
├── app.js               # Node.js Express application
├── Dockerfile           # Docker image configuration
├── package.json         # Node.js project dependencies
│
└── k8s/                 # Kubernetes configuration
    ├── deployment.yaml  # Kubernetes deployment configuration
    └── service.yaml     # Kubernetes service configuration
```

## Prerequisites

Choose your installation method based on your operating system:

### Windows Installation

1. Use `winget` to install Minikube, kubectl, and Node.js (if not already installed). Open a terminal (e.g., PowerShell or Command Prompt) and run:

```bash
winget install -e --id Kubernetes.minikube
winget install -e --id Kubernetes.kubectl
winget install -e --id OpenJS.NodeJS
```

Verify the installations:

```bash
minikube version
kubectl version --client
node --version
npm --version
```


2. **Minikube**
   ```powershell

   # Or manual download
   Invoke-WebRequest -OutFile minikube.exe -Uri https://storage.googleapis.com/minikube/releases/latest/minikube-windows-amd64.exe
   ```

3. **kubectl**
   ```powershell

   # Or manual download
   Invoke-WebRequest -OutFile kubectl.exe -Uri "https://dl.k8s.io/release/$(Invoke-WebRequest -Uri https://dl.k8s.io/release/stable.txt -UseBasicParsing)/bin/windows/amd64/kubectl.exe"
   ```

## Setup and Deployment

### 1. Clone the Repository
```bash
cd devops/k8s-docker-demo
```

### 2. Build Docker Image
```bash
# Build the Docker image
docker build -t vinay1304/k8s-docker-demo .

# Optional: Push to Docker Hub
docker login
docker push vinay1304/k8s-docker-demo
```

### 3. Start Minikube
```bash
# Start Minikube with Docker driver
minikube start --driver=docker
```

### 4. Deploy to Kubernetes
```bash
# Apply Kubernetes configurations
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# Check deployed pods
kubectl get pods
```

### 5. Access the Application
```bash
# Open the application in browser
minikube service k8s-docker-demo
```

## Key Concepts Explained

### Docker
- **Dockerfile**: Defines how to build the Docker image
  - Uses Node.js 14 Alpine image
  - Sets working directory
  - Copies application files
  - Installs dependencies
  - Exposes port 80
  - Defines startup command

### Kubernetes
- **deployment.yaml**: 
  - Defines how the application should be deployed
  - Specifies number of replicas
  - Sets container image and port

- **service.yaml**:
  - Creates a NodePort service
  - Exposes the application internally
  - Allows external access through Minikube's IP

## Troubleshooting

- Ensure Docker Desktop is running
- Check Minikube status: `minikube status`
- View logs: `kubectl logs <pod-name>`
- Check service status: `kubectl get services`
