# Log Output Application

A Ruby application that generates a random UUID on startup and outputs it every 5 seconds.

## Structure
- `app.rb` - Ruby application
- `Dockerfile` - Docker image configuration
- `manifests/deployment.yaml` - Kubernetes deployment

## How to run

```bash
# Build Docker image
docker build -t log-output:1.1 .

# Deploy to Kubernetes (declarative approach)
kubectl apply -f manifests/deployment.yaml

# Check logs
kubectl logs -f deployment/log-output

# Restart the pod
kubectl rollout restart deployment/log-output

# Scale the deployment
kubectl scale deployment/log-output --replicas=3

# Delete everything
kubectl delete -f manifests/deployment.yaml