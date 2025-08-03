**Bookstore API Config**


| Variable          | Default                                  | Description                                                      |
|-------------------|------------------------------------------|------------------------------------------------------------------|
| `DATABASE_URL`    | `sqlite:///./books.db`                   | SQLAlchemy database connection string.                           |
| `LOG_LEVEL`       | `INFO`                                   | Root logger level (e.g. DEBUG, INFO, WARNING).                  |
| `LOG_FORMAT`      | `%(levelname)s:%(name)s:%(message)s`     | Python `logging` format string.                                  |
| `PAGE_SIZE`       | `10`                                     | Number of items per page on the `/books/` endpoint.             |
| `APP_ENV`         | `dev`                                    | App environment label (e.g. dev / staging / prod).              |
| `HOST`            | `0.0.0.0`                                | Uvicorn host binding.                                           |
| `PORT`            | `8080`                                   | Uvicorn port.                                                   |
| `RELOAD`          | `False`                                  | Whether Uvicorn runs in reload mode (`True`/`False`).           |
| `ALLOWED_ORIGINS` | `*`                                      | Comma-separated list for CORS allowed origins (`*` = all).      |
| `DB_POOL_SIZE`    | `5`                                      | SQLAlchemy connection-pool size.                                |
| `DB_MAX_OVERFLOW` | `10`                                     | SQLAlchemy max overflow connections beyond the pool size.       |


1. Overview
This solution implements a Bookstore API.
The project demonstrates:

Containerization with Docker
Kubernetes deployment using Helm
CI/CD automation using GitHub Actions
Automated API testing (CRUD validation)

2. Solution Design
Application
Framework: FastAPI
Database: SQLite
ORM: SQLAlchemy for database interaction

Endpoints:
POST /books/ → Create
GET /books/ → Read (list)
GET /books/{id} → Read (single)
PUT /books/{id} → Update
DELETE /books/{id} → Delete

3. Containerization
Dockerfile:
Uses Python base image
Installs dependencies from requirements.txt
Copies application code
Runs FastAPI app via Uvicorn

4. Kubernetes Deployment (Helm)
Created a Helm chart with:
Deployment - Runs API containers
Service - Exposes the application inside the cluster
Ingress - external routing
ConfigMap - Configuration
Chart supports environment-specific values (e.g., dev, prod).

5. CI/CD Pipeline (GitHub Actions)
Pipeline stages:
Build & Push Docker Image
Uses docker/login-action and docker/build-push-action
Deploy with Helm (Kind cluster)
Uses helm/kind-action to create a temporary Kubernetes cluster
Run CRUD API Tests

6. Repository Secrets
To enable DockerHub push:
DOCKERHUB_USERNAME – your DockerHub username
DOCKERHUB_TOKEN – DockerHub personal access token
