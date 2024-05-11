# DevOps Challenge

This repository contains a simple Django application; a voting application.
It uses PostgreSQL as the database of choice.

## Notes

* docker-compose.yml is present so that you can see how to extrapolate the services towards kubernetes.
* Dockerfile is missing on purpose as part of the challenge. We want to see docker knowledge from the DevOps.
* Take into consideration on the Dockerfile creation the requirements.txt.


# Explanations

## Exercise 1

### Deploy sample application to the Kubernetes cluster
Build and deploy an application from this repository: https://github.com/agilentia/devops-challenge
Use whatever service or platform you want (AWS, Azure, GCP, bare metal, and so on). Most of them have a free tier option.
Feel free to use whatever tools you want, in the end, we want to see this application started somewhere.
Requirements: 
1. Application must run as a Docker container.
2. Create some basic CI/CD pipeline to build and deploy using GitHub Actions
3. Push your code to the Github repository
Minimum requirements
1. deployed application publicly available--
2.  deployment to some kind of Kubernetes cluster
3.  Infrastructure as a Code
 Nice to have
1. Encryption of sensitive data

