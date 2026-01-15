# Todo App - Step 3

Web application with HTML interface accessible via HTTP.

## Features
- HTML response for GET requests to `/`
- Environment variables for configuration
- Health check endpoint `/health`
- JSON API endpoint `/api/status`
- Accessible via kubectl port-forward

## Environment Variables
- `PORT`: Server port (default: 8080)
- `APP_NAME`: Application name
- `APP_VERSION`: Application version

## Testing with Port-Forward

```bash
# Deploy
kubectl apply -f manifests/deployment.yaml

# Port forward
kubectl port-forward deployment/todo-app 8081:8080

# Access in browser: http://localhost:8081

# Or with curl
curl http://localhost:8081/
curl http://localhost:8081/health