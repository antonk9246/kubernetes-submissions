# Todo App - Step 2

Simple web server with declarative Kubernetes deployment.

## Features
- Uses environment variable `PORT` (default: 8080)
- Health checks at `/health` endpoint
- Declarative Kubernetes configuration

## Deployment

```bash
# Build Docker image
docker build -t todo-app:1.2 .

# Deploy to Kubernetes
kubectl apply -f manifests/deployment.yaml

# Check status
kubectl get pods -l app=todo-app
kubectl logs -f deployment/todo-app

# Test health endpoint
kubectl exec deployment/todo-app -- curl -s http://localhost:8080/health

# Delete deployment
kubectl delete -f manifests/deployment.yaml