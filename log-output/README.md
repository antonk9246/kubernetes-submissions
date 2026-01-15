# Log Output Application

A Ruby application that generates a random UUID on startup and outputs it every 5 seconds.

## How to run

```bash
# Build Docker image
docker build -t log-output:1.1 .

# Run locally
docker run --rm log-output:1.1

# Deploy to Kubernetes
kubectl apply -f deployment.yaml

# Check logs
kubectl logs -f deployment/log-output