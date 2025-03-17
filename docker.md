# Docker Interview Q&A Documentation

This documentation contains a comprehensive list of Docker interview questions along with their answers. The questions cover a range of topics—from the differences between Docker containers and virtual machines to strategies for securing and troubleshooting Docker deployments.

---

## Table of Contents

1. [Difference between a Docker container and a virtual machine](#1-difference-between-a-docker-container-and-a-virtual-machine)
2. [Ensuring a Docker container starts automatically on host restart](#2-consider-a-real-time-scenario-um-how-would-you-ensure-that-a-docker-container-starts-automatically-when-the-docker-host-restarts)
3. [Purpose of a Docker Compose file and an example scenario](#3-have-you-ever-worked-on-docker-compose-file-or-anything-also-okay-so-can-you-describe-me-the-purpose-of-docker-compose-file-and-any-example-scenario-where-you-have-used-it)
4. [What is a Docker image and how is it different from a Docker container?](#4-what-is-a-docker-image-and-how-is-it-different-from-docker-container)
5. [Can you make changes to an existing Docker image?](#5-consider-there-is-a-docker-image-can-you-make-changes-to-existing-docker-image)
6. [Creating a new image from an existing image](#6-if-i-want-to-create-a-new-image-so-what-what-can-i-do-for-that-from-the-existing-image)
7. [Docker networking modes and when to use them](#7-do-you-know-what-are-networking-modes-that-docker-has-and-also-when-to-use-a-one)
8. [Jenkins container data loss scenario](#8-lets-say-uh-theres-a-docker-container-and-you-have-installed-jenkins-on-it-okay-everything-is-running-fine-perfectly-all-right-and-after-a-few-days-there-is-a-new-joining-in-your-team-your-junior-and-he-or-she-restarts-that-container-okay-and-now-you-are-not-able-to-see-anything-inside-jenkins-what-went-wrong-over-here-)
9. [Docker volumes and data persistence](#9-what-do-you-understand-by-docker-volumes-and-why-are-they-important-in-data-persistence)
10. [Troubleshooting a Docker container that does not start correctly](#10-so-many-times-what-happens-when-we-start-a-docker-container-and-it-does-not-start-correctly-so-how-would-you-troubleshoot-it-what-would-be-the-steps-that-you-would-take)
11. [Docker Swarm experience](#11-have-you-ever-worked-on-docker-swarm)
12. [Securing Docker containers and best practices](#12-how-do-you-secure-your-docker-containers-any-best-practice)
13. [Checking the health of containerized applications](#13-how-you-used-to-do-that-check-the-health-of-these-containerized-applications)
14. [Docker multi-stage build scenario](#14-have-you-ever-created-or-worked-on-any-docker-multi-stage-build-and-if-yes-then-you-can-can-you-provide-a-scenario)
15. [Canary deployment strategy using Docker](#15-scenario-if-you-have-faced-uh-can-you-describe-a-canary-deployment-strategy-using-docker)
16. [Troubleshooting Docker containers not starting due to port conflicts](#16-your-team-has-encountered-a-situation-where-docker-containers-are-not-starting-up-due-to-port-conflicts-how-would-you-troubleshoot-and-resolve-this-issue)
17. [Optimizing Docker images for faster deployment](#17-scenario-you-are-tasked-with-ensuring-that-your-docker-images-are-lightweight-and-optimized-for-faster-deployment-what-strategies-would-you-employ)
18. [Handling a critical security vulnerability in a base image](#18-scenario-a-critical-security-vulnerability-has-been-discovered-in-one-of-your-base-images-how-would-you-handle-this-situation)
19. [Managing environment-specific configurations in Docker](#19-scenario-your-development-team-uses-different-environments-development-testing-production-with-different-configurations-how-would-you-manage-these-environment-specific-configurations-in-docker)
20. [Ensuring Dockerized application portability across cloud providers](#20-your-application-needs-to-be-deployed-on-multiple-cloud-providers-how-would-you-ensure-that-your-dockerized-application-is-portable-and-can-be-deployed-across-different-cloud-environments)
21. [Sharing persistent data between Docker containers](#21-your-docker-containers-need-to-share-data-with-each-other-how-would-you-manage-persistent-data-and-ensure-its-available-across-container-restarts)
22. [Updating application code in a production container with minimal downtime](#22-you-have-a-docker-container-running-in-production-that-needs-an-urgent-update-to-its-application-code-how-would-you-apply-this-update-with-minimal-downtime)
23. [Ensuring secure communication between Docker containers](#23-you-have-multiple-microservices-running-as-docker-containers-and-one-service-needs-to-communicate-securely-with-another-over-the-network-how-would-you-ensure-secure-communication-between-docker-containers)
24. [Implementing service discovery and load balancing in a microservices architecture](#24-scenario-your-team-is-adopting-a-microservices-architecture-with-docker-containers-and-you-need-to-implement-service-discovery-and-load-balancing-how-would-you-achieve-this)
25. [Setting up a CI/CD pipeline for automated testing of a Dockerized application](#25-you-need-to-implement-automated-testing-for-your-dockerized-application-how-would-you-set-up-a-cicd-pipeline-to-achieve-this)
26. [Scenario: Application Not Accessible from Host](#26-scenario-application-not-accessible-from-host)
27. [Scenario: One Container Can’t Communicate with Another](#27-scenario-one-container-cant-communicate-with-another)
28. [Difference between RUN and CMD](#28-what-is-the-difference-between-run-and-cmd)
29. [Difference between COPY vs ADD](#29-diff-b-w-copy-vs-add)
30. [Difference between CMD and ENTRYPOINT](#30-diff-b-w-cmd-and-entrypoint)
31. [What is ARG?](#31-what-is-arg)
31. [Difference between ENV vs ARG](#31-diff-b-w-env-vs-arg)
32. [How can I access ARG inside container?](#32-how-can-i-access-arg-inside-container)
33. [What is Dockerfile and Docker image?](#33-what-is-docker-file-and-docker-image)
34. [Some useful Docker commands](#34-tell-me-some-docker-commands)
35. [Explain the Docker architecture](#35-explain-the-docker-architecture)

---

## 1. Difference between a Docker container and a virtual machine?

- **Answer:**  
  A virtual machine includes its own full operating system running on a hypervisor, which offers stronger isolation but uses more resources and takes longer to boot. Whereas a Docker container is lightweight—it won't use a full operating system and heavy resources like a VM. It can reboot within minimal time and faster. Since we can define what resources or application packages or runtime is required, we can limit the resources.

---

## 2. Consider a real-time scenario um how would you ensure that a Docker container starts automatically when the docker host restarts?

- **Answer:**  
  We can ensure a Docker container starts automatically on host restart by using the restart policy flag. For example, running:

  ```bash
  docker run --restart=always <image_name>
  ```

  This tells Docker to always restart the container if it stops, including when the host reboots.

---

## 3. Have you ever worked on Docker compose file or anything also okay so can you describe me the purpose of Docker compose file and any example scenario where you have used it

- **Answer:**  
  - Docker Compose simplifies multi-container deployments.
  - With Docker Compose, we can configure everything in a YAML file like services, networks, ports, volumes; with that we can create or run containers using Docker Compose.
  - Imagine you're developing a web application that consists of three components:
    - You can add the images once the Dockerfile is built and add it in the compose file along with container name and command instructions as below:

      ```yaml
      backend:
        #image: backend:v1.0
        image: joindevops/backend:v1.0
        container_name: backend
        command: sh -c "sleep 20 && node /opt/server/index.js"
        depends_on: 
          - mysql
      ```

  - Use the commands:
    - `docker compose up -d` — it will create and run all the containers.
    - `docker compose down` — it will stop all the containers mentioned in the file.

---

## 4. What is a Docker image and how is it different from Docker container?

- **Answer:**  
  A Docker image is a blueprint that contains all the necessary code, libraries, and dependencies required to run an application whereas a Docker container is a live, running instance of that image. Essentially, the image is the "recipe," and the container is the "dish" made from that recipe.

---

## 5. Consider there is a Docker image can you make changes to existing Docker image?

- **Answer:**  
  Docker images are immutable, meaning you can't modify them directly. However, we can create a new image by building the Dockerfile again with the required changes.

---

## 6. If I want to create a new image so what what can I do for that from the existing image?

- **Answer:**  
  1. Using Docker Commit  
  2. Using a Dockerfile

---

## 7. Do you know what are networking modes that Docker has? and also when to use a one?

- **Answer:**  
  Three modes:
  1. **Bridge mode (by default):** Ideal for standalone containers on a single host that need to communicate with each other.
  2. **Host mode:** Useful for performance-sensitive applications, scenarios where low network latency is crucial.
  3. **Overlay mode:** Ideal for orchestrated, multi-host deployments where containers need to interact across hosts such as in a Docker Swarm/k8s cluster.

---

## 8. Let's say uh there's a Docker container and you have installed Jenkins on it okay everything is running fine perfectly all right and after a few days there is a new joining in your team your Junior and he or she restarts that container okay and now you are not able to see anything inside Jenkins what went wrong over here?

- **Answer:**  
  - This issue usually happens because the Jenkins data was stored inside the container's ephemeral filesystem rather than in a persistent volume.
  - When the container was restarted, all of the data (like job configurations, build history, and plugins) was lost.
  - To prevent this, you should mount a host directory or use a Docker volume for Jenkins' home directory so that your data persists even if the container restarts.

---

## 9. What do you understand by Docker volumes and why are they important in data persistence?

- **Answer:**  
  Docker volumes are essential for data persistence in Dockerized applications, especially when dealing with stateful applications like databases or services like Jenkins, where retaining data is crucial.

---

## 10. So many times what happens when we start a Docker container and it does not start correctly so how would you troubleshoot it what would be the steps that you would take?

- **Answer:**  
  1. **Check Container Status and Logs:**  
     Use `docker logs` and `docker ps -a` to see if the container exited and check its exit code.
  2. **Inspect Container Configuration:**  
     Use `docker inspect <container_id>` to verify environment variables, volume mounts, port mappings, and command/entrypoint configurations.
  3. **Docker Events:**  
     Monitor container events.
  4. **Run Interactively:**  
     Use `docker run -it <image> bash` to manually inspect the container environment and test commands.
  5. **Resource Constraints and Dependencies:**  
     Check resource limits (CPU/memory) or if it’s hitting an out-of-memory (OOM) error.
  6. **Review Recent Changes.**
  7. **Recreate or Rebuild the container.**

---

## 11. Have you ever worked on Docker swarm?

- **Answer:**  
  Docker Swarm is an orchestration tool similar to Kubernetes. We can opt for it for small-scale organizations where security is not major. Nowadays, everyone has scaled up to Kubernetes because of its rich features and for complex applications. I have learnt Docker at my initial stage but I never got any chance to work on Docker Swarm in any company so far.

---

## 12. How do you secure your Docker containers any best practice?

- **Answer:**  
  1. **Use Official and Verified Images:**  
     - Use minimal base images (like Alpine) to reduce the attack surface and image size.
  2. **Keep Images Small:**  
     - Use multi-stage builds to minimize the final image size by only including necessary components.  
       *Example:*  
       ```dockerfile
       # Multi-stage build example
       FROM builder-image AS builder
       RUN build-command

       FROM alpine:latest
       COPY --from=builder /app /app
       ```
     - Remove unnecessary files to keep the image clean.
  3. **Tag Images Properly:**  
     Tag images with version numbers (e.g., `myapp:1.0`) instead of just using `latest` to avoid ambiguity and ensure consistency.
  4. **Run as Non-Root User:**  
     Create and run containers with a non-root user.  
     *Example:*  
     ```dockerfile
     RUN useradd -m myuser
     USER myuser
     ```
  5. **Volumes:**  
     Use both unnamed and named volumes as a best practice.
  6. **Upgrade Regularly:**  
     Upgrade to the latest images regularly to avoid vulnerability issues using image scanning tools like Grype or Trivy.
  7. **Optimize Dockerfile Layers:**  
     Frequently changed instructions should be kept at the end to reduce build time and avoid breaking the layering chain.

---

## 13. How you used to do that check the health of these containerized applications?

- **Answer:**  
  1. **Docker Health Checks:**  
     Add a `HEALTHCHECK` instruction in the Dockerfile that periodically runs a command (like pinging an application endpoint) to determine the container's health. If the check fails repeatedly, Docker can mark the container as unhealthy.
  2. **Kubernetes Probes:**  
     Configure liveness and readiness probes in the pod specification.
  3. **Monitoring and Logging Tools:**  
     Integrate monitoring tools like Prometheus and Grafana to analyze container logs in real time, proactively detect issues, and ensure that unhealthy containers are restarted automatically.

---

## 14. Have you ever created or worked on any Docker multi-stage build and if yes then you can can you provide a scenario?

- **Answer:**  
  Keep Images Small:  
  - Use multi-stage builds to minimize the final image size by only including necessary components.
  - Multi-stage build: We can run a multi-stage build in the Dockerfile so that we can decrease our image size to very small compared to the base image.
    - First, build our code from one image and then, using that build output, build another image using another `FROM` command.
  - Remove unnecessary files: Clean up package lists, cache files, and other unnecessary files to keep the image clean.

  *Example multi-stage build Dockerfile:*

  ```dockerfile
  # Stage 1: Build the Go binary
  FROM golang:1.16 as builder
  WORKDIR /app
  COPY go.mod go.sum ./
  RUN go mod download
  COPY . .
  RUN go build -o myapp .

  # Stage 2: Create the production image
  FROM alpine:latest
  RUN apk --no-cache add ca-certificates
  WORKDIR /root/
  COPY --from=builder /app/myapp .
  CMD ["./myapp"]
  ```

---

## 15. Scenario if you have faced uh can you describe a canary deployment strategy using docker?

- **Answer:**  
  Canary deployment is rolling out a new version to a small subset of users. For example, initially release the new version to 10% of the traffic while keeping 90% on the old version. Later, gradually increase to 20% new version and 80% old version, until eventually 100% of the traffic is routed to the new version and 0% to the old version. Finally, delete the old version.

---

## 16. Your team has encountered a situation where Docker containers are not starting up due to port conflicts. How would you troubleshoot and resolve this issue?

- **Answer:**  
  - Start by checking the Docker container logs and system logs to identify the port conflict.
  - Use `docker ps` and `docker inspect` to determine which containers are attempting to use the same ports.
  - To resolve the conflict, either change the exposed ports in the Dockerfile or Docker Compose file or map the container ports to different host ports using the `-p` option in the `docker run` command.
  - Ensure proper port mapping and avoid hardcoding ports in the application configuration.

---

## 17. Scenario: You are tasked with ensuring that your Docker images are lightweight and optimized for faster deployment. What strategies would you employ?

- **Answer:**  
  - Choose a minimal base image, such as Alpine or Scratch.
  - Optimize the Dockerfile by minimizing the number of layers and combining multiple commands into single `RUN` instructions where appropriate.
  - Use multi-stage builds to separate the build environment from the runtime environment, copying only the necessary artifacts to the final image.
  - Regularly clean up unnecessary files and dependencies and use a `.dockerignore` file to exclude files and directories that are not needed in the image.

---

## 18. Scenario: A critical security vulnerability has been discovered in one of your base images. How would you handle this situation?

- **Answer:**  
  - Identify all the Docker images and containers that use the vulnerable base image.
  - Check if an updated version of the base image is available and incorporate it into your Dockerfiles.
  - Rebuild the Docker images using the updated base image and redeploy the containers to ensure the vulnerability is patched.
  - Implement a continuous security scanning process using tools like Clair, Trivy, or Docker Security Scanning to detect and address vulnerabilities promptly in the future.

---

## 19. Scenario: Your development team uses different environments (development, testing, production) with different configurations. How would you manage these environment-specific configurations in Docker?

- **Answer:**  
  - Use environment variables and Docker Compose’s multiple file feature to manage environment-specific configurations. Each environment (development, testing, production) would have its own `.env` file containing environment-specific variables.
  - In the Docker Compose file, reference these variables using the `env_file` option.
  - Create separate Docker Compose override files (e.g., `docker-compose.override.yml`, `docker-compose.dev.yml`, `docker-compose.prod.yml`) that extend the base Compose file with environment-specific settings.
  - This approach ensures that the correct configurations are applied for each environment.

  *Example snippet:*

  ```yaml
  services:
    my-service:
      image: my-application:latest
      env_file:
        - .env.development   # For development; switch to .env.production for production
  ```

---

## 20. Your application needs to be deployed on multiple cloud providers. How would you ensure that your Dockerized application is portable and can be deployed across different cloud environments?

- **Answer:**  
  To ensure portability across different cloud providers, I would:
  - Follow best practices for building Docker images, such as using multi-stage builds to keep images lean and avoiding platform-specific dependencies.
  - Use a cloud-agnostic orchestration tool like Kubernetes, which can run on various cloud providers including AWS, Google Cloud, and Azure. Kubernetes abstracts the underlying infrastructure, allowing the same deployment configuration to work across different environments.
  - Store Docker images in a cloud-agnostic container registry like Docker Hub or a private registry that can be accessed from any cloud provider.
  - Use infrastructure-as-code tools like Terraform to manage cloud resources in a provider-agnostic manner, ensuring consistent deployment configurations across different cloud platforms.

---

## 21. Your Docker containers need to share data with each other. How would you manage persistent data and ensure it’s available across container restarts?

- **Answer:**  
  - Use Docker volumes to manage persistent data.
  - Docker volumes provide a way to store data outside of the container’s file system, making it persistent across container restarts and re-creations.
  - Create a volume using `docker volume create` and mount it to the container using the `-v` or `--mount` option in the `docker run` command or in a Docker Compose file.
  - This setup allows multiple containers to share the same data, ensuring that data persists even if the containers are stopped or removed.

---

## 22. You have a Docker container running in production that needs an urgent update to its application code. How would you apply this update with minimal downtime?

- **Answer:**  
  - Use a rolling update strategy to update the container with minimal downtime.
  - First, build a new Docker image with the updated application code and push it to the Docker registry.
  - Using a deployment tool like Kubernetes (or a Docker Compose setup), update the running containers to the new image version incrementally.
  - This involves gradually replacing the old containers with new ones, ensuring that there is always a portion of the application running to handle requests.

---

## 23. You have multiple microservices running as Docker containers, and one service needs to communicate securely with another over the network. How would you ensure secure communication between Docker containers?

- **Answer:**  
  - Use Docker networking features to create a custom bridge network for the containers that need to communicate securely.
  - Docker provides built-in networking options like bridge networks and overlay networks.
  - Configure the services to use HTTPS with TLS certificates for encryption.
  - Additionally, restrict network access using Docker’s firewall rules (iptables) or a container-aware firewall solution to limit communication only to necessary ports and IP addresses.

---

## 24. Scenario: Your team is adopting a microservices architecture with Docker containers, and you need to implement service discovery and load balancing. How would you achieve this?

- **Answer:**  
  - Use a service discovery tool like Consul, etcd, or Zookeeper to register and discover services dynamically.
  - These tools can be integrated with Docker containers using environment variables or service registries.
  - For load balancing, configure a load balancer (e.g., Nginx, HAProxy) or use Docker’s built-in load balancing capabilities within Kubernetes.
  - Alternatively, leverage a service mesh solution like Istio for advanced traffic management and observability.

---

## 25. You need to implement automated testing for your Dockerized application. How would you set up a CI/CD pipeline to achieve this?

- **Answer:**  
  I would set up a CI/CD pipeline using tools like Jenkins, GitLab CI/CD, or CircleCI. Here’s how I would approach it:
  - Configure the pipeline to trigger on code commits to the repository.
  - Use Docker to build the application into a container image based on a Dockerfile.
  - Run automated tests (unit tests, integration tests, etc.) inside Docker containers.
  - Push the tested Docker image to a registry (e.g., Docker Hub, private registry).
  - Deploy the Docker image to staging or production environments using Kubernetes, Docker Compose, or another deployment tool.
  - Include steps for monitoring and logging to ensure application health and performance.

---

## 26. 🔹 Scenario Application Not Accessible from Host

You ran a Docker container using:

```bash
docker run -d -p 8080:80 myapp
```

The container is running, but the application is not accessible on [http://localhost:8080](http://localhost:8080). What could be wrong?

- **Answer:**  
  The application inside the container might not be listening on port 80. Run:

  ```bash
  docker logs <container_id>
  ```

  or

  ```bash
  docker exec -it <container_id> netstat -tulnp
  ```

  to check the listening ports. If needed, update the container’s configuration to bind to port 80.

---

## 27. 🔹 Scenario One Container Can’t Communicate with Another

You have two containers: App and Database, but the App container can’t connect to the database. How do you fix this?

- **Answer:**  
  Containers should communicate via Docker Networks instead of exposing ports unnecessarily.
  1. Create a network:
  
     ```bash
     docker network create mynetwork
     ```
  
  2. Run both containers on the same network:
  
     ```bash
     docker run -d --network=mynetwork --name=db mysql
     docker run -d --network=mynetwork --name=app myapp
     ```
  
  Now, the App can connect to the Database using the service name `db` instead of an IP address.

---

## 28. What is the difference between RUN and CMD?

- **Answer:**  
  - **RUN** is the instruction executed at the time of image creation, while **CMD** is the instruction executed at the time of container creation.
  - **CMD** commands keep the container running.
  - **RUN** is used to install packages and configure something at the time of image creation.

---

## 29. Diff b/w COPY vs ADD?

- **Answer:**  
  COPY and ADD both are used to copy the files from the workspace to the Docker image. However, ADD has 2 extra advantages:
  1. It can directly download content from the internet into the image.
  2. It can directly untar the files into the image.

---

## 30. Diff b/w CMD and Entrypoint?

- **Answer:**  
  Both serve the same function but CMD can be overridden at runtime whereas the entrypoint command cannot be overridden.  
  We can mix CMD and entrypoint to achieve better results. For example, using CMD as arguments to ENTRYPOINT and overriding those arguments at runtime:

  ```dockerfile
  CMD [ "google.com" ]
  ENTRYPOINT [ "ping", "-c5" ]
  ```

---

## 31. What is ARG?

- **Answer:**  
  1. ARG can be the first instruction in only one case. It can be used to supply the version for the FROM instruction.
  2. The ARG instruction is used similarly to environment variables; we can use them at build time or runtime using `--build-arg` with the ARG name.
  
  *Example:*

  ```bash
  docker build -t arg:v1.0 --build-arg version=9 --build-arg course=me --build-arg trainer=you .
  ```

  ```dockerfile
  ARG course=docker
  ARG trainer=siva
  ENV duration=120hrs
  RUN echo "course is ${course}, trainer is ${trainer}, duration is ${duration}"
  ```

---

## 31. Diff b/w ENV vs ARG?

- **Answer:**  
  1. ENV variables can be accessed both at build time and inside containers.
  2. ARG instructions can only be accessed at build time (or during image build).
  - We can also pass a default value for ARG in the Dockerfile and override the value at runtime.
  - ARG is the only instruction that can be written before the FROM instruction.
  - We can mix both of them for better results, such as assigning the value of ARG to an ENV variable.

---

## 32. How can I access arg inside container?

- **Answer:**  
  ```dockerfile
  ARG duration=120hrs
  ENV duration=${duration}
  ```

---

## 33. What is docker file and docker image?

- **Answer:**  
  - **Dockerfile:** A declarative way of creating our custom images by keeping all the instructions in a file and then building the image.
  - **Docker image:** Consists of the bare minimum OS, application runtime, system packages, and application code.

---

## 34. Tell me some docker commands?

- **Answer:**  
  ```bash
  docker pull nginx
  docker images
  docker ps -a         # all containers
  docker images -a       # all images
  docker start <container-id>
  docker ps            # running containers (docker ps --filter "status=running")
  docker ps -q         # only show running container IDs
  docker images -a -q  # show only the image IDs (docker images -q)
  docker ps -s         # show container size
  docker ps -n 5       # show last 5 containers
  
  docker stop <container-id>
  docker rm <container-id>
  docker rmi <image-id>
  
  # To delete all images:
  docker rmi `docker images -q`
  
  # To remove all containers:
  docker rm `docker ps -q`
  
  # docker run: combines docker create + docker start
  # Running a container in the foreground:
  docker run nginx
  
  # Running a container in the background (detached mode):
  docker run -d nginx
  
  # Note: 65535 ports per system
  
  # To enable port mapping:
  docker run -d -p <host-port>:<container-port> nginx
  
  docker logs <container-id> 
  docker logs -f         # --follow logs
  docker inspect <container-id>   # to view container details
  # To login or get terminal access to a running container:
  docker exec -it <container-id> bash
  ```

---

## 35. Explain the docker architecture?

- **Answer:**  
  Docker components are:
  1. **Docker Client:** The command line interface (CLI) that users interact with.
  2. **Docker Daemon:** The background service that manages building, running, and monitoring containers.
  3. **Docker Local Repository:** The local storage for Docker images.
  4. **Docker Registry (or Remote Repository):** The storage and distribution system for Docker images.
  
  When a user runs a Docker command (e.g., `docker run`), the Docker daemon checks whether the image is present locally. If not, it pulls the image from the remote registry into the local repository and then starts the container, sending the response back to the client.

---

