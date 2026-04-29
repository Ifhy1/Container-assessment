Project: MuchToDo API — End-to-End Containerization & Orchestration

Stack: Golang, MongoDB, Redis, Docker, Kubernetes (Kind)

   Project Summary
This repository documents the full DevOps lifecycle of the MuchToDo API. I have successfully migrated a high-performance Golang backend from a source-code state to a fully orchestrated Kubernetes environment. This project demonstrates my ability to handle containerization, persistent storage, automated deployments, and complex infrastructure troubleshooting.

  Technical Implementation
1. Containerization (Docker)
Multi-Stage Build: Engineered a Dockerfile that separates the build environment from the runtime, resulting in a lightweight, secure production image.

Local Microservices: Used docker-compose to orchestrate the API, MongoDB, and Redis, ensuring seamless connectivity across the stack.

2. Orchestration (Kubernetes & Kind)
Infrastructure as Code (IaC): Modularized manifests into a structured hierarchy for scalability.

Data Persistence: Implemented PersistentVolumeClaims (PVC) for MongoDB, ensuring user data survives pod restarts.

Fault Tolerance: Diagnosed and resolved CrashLoopBackOff events by managing container dependencies.

Traffic Engineering: Exposed the service via NodePort (30001) and configured an Ingress resource.

3. Automation
Developed custom Bash scripts in the scripts/ directory to automate the entire lifecycle from build to deployment.

 Visual Evidence
Note: All evidence screenshots are stored in the /evidence directory.

Kubernetes Resource Status
This view confirms that all deployments, services, and ingress resources are correctly provisioned and healthy.

Healthy Pod Execution
Proof of the 1/1 Running status for both the Backend and MongoDB.

Live Application Access
Verified accessibility via NodePort at localhost:30001.

 How to Run
Deploying to Kubernetes
Ensure you have a Kind cluster named much-to-do running, then execute:

Bash
# Provision the entire stack
./scripts/k8s-deploy.sh

# Verify health
curl http://localhost:30001/health
🧠 Core API Capabilities
The underlying MuchToDo API features:

JWT Security: Secure session management using httpOnly cookies.

Layered Architecture: Clean separation of handlers, services, and repositories.

Interactive Docs: Integrated Swagger support at /swagger/index.html.


