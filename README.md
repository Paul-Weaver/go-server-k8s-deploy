# PlutoPilot Go Web Server Kubernetes Deployment

This repository demonstrates how to create a simple Go web server, containerize it using Docker, and deploy it in Kubernetes locally using Minikube. It includes the following files:

- `main.go`: Contains the Go code for the web server.
- `Dockerfile`: Specifies the Docker image for the web server.
- `deployment.yaml`: Defines the Kubernetes deployment.
- `go.mod`: Lists project dependencies.

## Prerequisites

Before getting started, ensure you have the following tools installed:

- Docker: [Installation Guide](link-to-docker-installation)
- Minikube: [Installation Guide](link-to-minikube-installation)
- Go: [Installation Guide](link-to-go-installation)
- kubectl: [Installation Guide](link-to-kubectl-installation)

## How to Run

1. Clone this repository.
2. Build the Docker image: `docker build -t plutopilot-webserver .`
3. Start Minikube: `minikube start`
4. Deploy the application: `kubectl apply -f deployment.yaml`
5. Access the web server using port forwarding: `kubectl port-forward deployments/plutopilot-deployment 8080:8080`
6. Open a web browser and go to [http://localhost:8080](http://localhost:8080) to see the "Welcome" message.

For more details and commands, please refer to the repository files and comments.
