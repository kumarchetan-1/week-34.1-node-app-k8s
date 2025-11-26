# Node.js Kubernetes Application

A simple Node.js/Express TypeScript application containerized with Docker and deployed on Kubernetes.

## 📋 Prerequisites

- **Node.js** (v18 or higher)
- **Docker** (for building container images)
- **Kubernetes cluster** (Minikube, Docker Desktop, or cloud provider)
- **kubectl** (Kubernetes command-line tool)

## 🚀 Local Development

### Install Dependencies

```bash
npm install
```

### Build TypeScript

```bash
npm run build
```

### Run Locally

```bash
npm start
# or
npm run dev
```

The application will be available at `http://localhost:3000`

## 🐳 Docker

### Build Docker Image

```bash
docker build -t chetankumar01/node-app-for-k8s:latest .
```

### Run Docker Container

```bash
docker run -p 3000:3000 chetankumar01/node-app-for-k8s:latest
```

### Push to Docker Hub

```bash
docker login
docker push chetankumar01/node-app-for-k8s:latest
```

## ☸️ Kubernetes Deployment

### Deploy Application

```bash
kubectl apply -f deployment.yml
```

### Verify Deployment

```bash
kubectl get deployments
kubectl get pods
kubectl get replicasets
```

## 📚 Important Kubectl Commands

### Check Deployment Status

```bash
# List all deployments
kubectl get deployments
kubectl get deploy

# Get detailed information about a deployment
kubectl describe deployment todo-app-deployment

# Check deployment status
kubectl get deployment todo-app-deployment -o wide
```

### Check Pods

```bash
# List all pods
kubectl get pods
kubectl get pods -o wide

# Get detailed pod information
kubectl describe pod <pod-name>

# Get pods with labels
kubectl get pods --show-labels

# Get pods by label selector
kubectl get pods -l app=todo-app

# View pod logs
kubectl logs <pod-name>

# Follow pod logs (stream)
kubectl logs -f <pod-name>

# View logs from all pods with a label
kubectl logs -l app=todo-app

# Get logs from previous container instance (if crashed)
kubectl logs <pod-name> --previous

# Execute command in a pod
kubectl exec -it <pod-name> -- /bin/sh
```

### Check ReplicaSets

```bash
# List all replica sets
kubectl get replicasets
kubectl get rs

# Get detailed replica set information
kubectl describe replicaset <replicaset-name>

# Check replica set status
kubectl get rs -o wide
```

### Check Services

```bash
# List all services
kubectl get services
kubectl get svc

# Get detailed service information
kubectl describe service <service-name>

# Check service endpoints
kubectl get endpoints
kubectl get endpoints <service-name>
```

### Scale Deployment

```bash
# Scale deployment to specific number of replicas
kubectl scale deployment todo-app-deployment --replicas=5

# Scale using kubectl scale command
kubectl scale --replicas=3 deployment/todo-app-deployment
```

### Update and Rollout

```bash
# Check rollout status
kubectl rollout status deployment/todo-app-deployment

# View rollout history
kubectl rollout history deployment/todo-app-deployment

# Rollback to previous version
kubectl rollout undo deployment/todo-app-deployment

# Rollback to specific revision
kubectl rollout undo deployment/todo-app-deployment --to-revision=2
```

### Update Deployment

```bash
# Update image in deployment
kubectl set image deployment/todo-app-deployment todo-app=chetankumar01/node-app-for-k8s:v2

# Edit deployment directly
kubectl edit deployment todo-app-deployment
```

### Delete Resources

```bash
# Delete deployment
kubectl delete deployment todo-app-deployment

# Delete using YAML file
kubectl delete -f deployment.yml

# Delete pod
kubectl delete pod <pod-name>

# Force delete pod
kubectl delete pod <pod-name> --force --grace-period=0
```

### General Commands

```bash
# Get all resources
kubectl get all

# Get all resources in a namespace
kubectl get all -n <namespace>

# Get resources with custom output format
kubectl get pods -o json
kubectl get pods -o yaml

# Get resource YAML
kubectl get deployment todo-app-deployment -o yaml

# Watch resources (auto-refresh)
kubectl get pods -w
kubectl get deployment -w

# Get cluster information
kubectl cluster-info

# Get nodes
kubectl get nodes
kubectl get nodes -o wide

# Get namespaces
kubectl get namespaces
kubectl get ns
```

### Port Forwarding (Access Application)

```bash
# Forward local port to pod
kubectl port-forward <pod-name> 3000:3000

# Forward to deployment (picks a pod automatically)
kubectl port-forward deployment/todo-app-deployment 3000:3000

# Forward to service
kubectl port-forward service/<service-name> 3000:3000
```

### Debugging Commands

```bash
# Get events
kubectl get events
kubectl get events --sort-by='.lastTimestamp'

# Get events for specific resource
kubectl get events --field-selector involvedObject.name=<pod-name>

# Check resource usage
kubectl top pods
kubectl top nodes

# Get API resources
kubectl api-resources

# Check if resource exists
kubectl get deployment todo-app-deployment
```

## 🔍 Troubleshooting

### Pod Not Starting

```bash
# Check pod status
kubectl get pods

# Check pod events
kubectl describe pod <pod-name>

# Check pod logs
kubectl logs <pod-name>
```

### Image Pull Errors

```bash
# Verify image exists
docker images | grep node-app-for-k8s

# Check if image is accessible
kubectl describe pod <pod-name> | grep -i image
```

### Deployment Not Updating

```bash
# Check rollout status
kubectl rollout status deployment/todo-app-deployment

# Check replica set
kubectl get rs

# Check pod status
kubectl get pods -l app=todo-app
```

### Access Application

If no service is configured, use port forwarding:

```bash
kubectl port-forward deployment/todo-app-deployment 3000:3000
```

Then access at `http://localhost:3000`

## 📝 Project Structure

```plaintext
.
├── src/
│   └── index.ts          # Main application file
├── deployment.yml        # Kubernetes deployment configuration
├── Dockerfile           # Docker image configuration
├── package.json         # Node.js dependencies
├── tsconfig.json        # TypeScript configuration
└── README.md           # This file
```

## 🔐 Security Notes

- The Dockerfile includes `apk update && apk upgrade` to patch Alpine Linux vulnerabilities
- Always use specific image tags in production (avoid `:latest`)
- Regularly update base images and dependencies

## 📖 Additional Resources

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Docker Documentation](https://docs.docker.com/)

