# Deliverables

(1) Set up a Postgres database.  
- See also sh files for DB creation, which I was using to re-create and populate the database inside the folders db_cluster_creation and db.

(2) Create a Dockerfile for the Python application.  
(2a) You'll submit the Dockerfile
- See analytics/Dockerfile

(3) Write a simple build pipeline with AWS CodeBuild to build and push a Docker image into AWS ECR.
- See analytics/buildspec.yml

(3a) Take a screenshot of AWS CodeBuild pipeline for your project submission.
- See deliverables/3a_AWS_CodeBuild.png

(3b) Take a screenshot of AWS ECR repository for the application's repository.
- See deliverables/3b_AWS_ElasticContainerRegistry.png

(4) Create a service and deployment using Kubernetes configuration files to deploy the application.
- See deployment/configmap.yaml
- See deployment/coworking.yaml

(5) You'll submit all the Kubernetes config files used for deployment (ie YAML files).
- See above.

(5a) Take a screenshot of running the kubectl get svc command.
- See deliverables/5a_kubectl_get_svc.png

(5b) Take a screenshot of kubectl get pods.
- See deliverables/5b_kubectl_get_pods.png

(5c) Take a screenshot of kubectl describe svc <DATABASE_SERVICE_NAME>.
- See deliverables/5c_kubectl_describe_svc_postgresql-service.png

(5d) Take a screenshot of kubectl describe deployment <SERVICE_NAME>.
- See deliverables/5d_kubectl_describe_deployment_coworking.png

(6) Check AWS CloudWatch for application logs.
- I attached the CloudWatchAgentServerPolicy IAM policy to the nodes using the 'aws iam attach-role-policy' command.  
- Then, I used 'aws eks create-addon' to install the Amazon CloudWatch Observability EKS add-on.

(6a) Take a screenshot of AWS CloudWatch Container Insights logs for the application.
- See deliverables\6a_CloudWatch.png

(7) Create a README.md file in your solution that serves as documentation for your user to detail how your deployment process works and how the user can deploy changes. The details should not simply rehash what you have done on a step by step basis. Instead, it should help an experienced software developer understand the technologies and tools in the build and deploy process as well as provide them insight into how they would release new builds.
- See below.


# README

## Cluster
- EKS Cluster is created with the name 'my-cluster'
- The Cluster contains two deployments
  - postgresql: The database for the coworking project
  - coworking: The analytics app

## postgresql
- Deployed via
  - db_cluster_creation/pvc.yaml
  - db_cluster_creation/pv.yaml
  - db_cluster_creation/postgresql-deployment.yaml
  - db_cluster_creation/postgresql-service.yaml
- Initial dataset can be reconstructed by
  - Setting a port-forward on the postgresql-service:
    kubectl port-forward service/postgresql-service 5433:5432
  - Executing the three sql commands from the db folder:
    db/init_db.sh

## coworking
- Runs a dockerized Python Flask service
  - Dockerfile: analytics/Dockerfile
  - AWS CodeBuild via analytics/buildspec.yml
  - Docker images are automatically uploaded to AWS ECR and tagged with the build number on push to the repository.
- Deployment via
  - deployment/configmap.yaml (for config map and secret storing the DB password)
  - deployment/coworking.yaml (load balancer service and coworking app)
  - Note: The build number for the docker image of the coworking analysis app is currently fixed in coworking.yaml. 
    Please update after a new image is build before applying coworking.yaml.
