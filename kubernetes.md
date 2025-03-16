# Kubernetes Interview Questions & Answers

---

### 1. what is the diff b/w docker and k8s?

**Answer:**

- Docker is a container platform, whereas Kubernetes (k8s) is a container orchestration platform that offers capabilities such as:
  1. Autoscaling
  2. Autohealing
  3. Clustering
  4. Enterprise-level support (e.g., load balancing techniques)
- Kubernetes capabilities can be extended using Custom Resource Definitions (CRDs).
- Containers are ephemeral in nature; if a container goes down, the end user may see traffic loss.
- Using Kubernetes, if a pod or node goes down, it automatically brings up new containers (using autoscaling or cluster scaling) to ensure no traffic loss.
- There are additional advantages of Kubernetes beyond these points.

---

### 2. what are the main components of k8s architecture?

**Answer:**

Kubernetes components are divided into two parts:

1. **Control Plane:**
   - **API Server**: handles Kubernetes API
   - **Scheduler**: schedules resources on the cluster
   - **etcd**: stores all cluster information
   - **Controller Manager**: controls controllers like ReplicaSet, Node, Service Account controllers
   - **Cloud Controller**: Manager creates cloud resources

2. **Data Plane:**
   - **kubelet:** An agent on each node that pulls information from the control plane and runs pods.
   - **kubeproxy:** Manages network communication between pods and ensures services can communicate.
   - **Container runtime:** Runs container images on nodes (commonly containerd).

---

### 3. Diff b/w Docker container and k8s pod?

**Answer:**

- A **pod** is the smallest deployable unit in Kubernetes:
  - It can contain one or more containers.
  - Containers within a pod share the same network and storage.
- In contrast, a **Docker container** is a single container that runs in isolation:
  - Docker containers do not inherently share storage or networking; explicit configuration is required for inter-container communication.

---

### 4. What is Namespace?

**Answer:**

- A **Namespace** is an isolation mechanism used to organize and manage resources within a cluster.
- For example, in a company with multiple projects sharing one cluster, separate namespaces (e.g., for project B and project C) prevent overlapping or interference between resources.

---

### 5. what are types of services in k8s?

**Answer:**

- **ClusterIP:** Exposes the service within the cluster.
- **NodePort:** Exposes the service externally using the node’s IP, available to authorized users.
- **LoadBalancer:** Exposes the service to the outside world. The Cloud Controller Manager (CCM) creates an external load balancer and provides an endpoint.

---

### 6. Transition from Monolithic to Microservices

**Answer:**

- In a monolithic architecture, deploying applications can be challenging.
- Transitioning to microservices makes deployment faster and more efficient.
- Kubernetes plays a key role by:
  1. Containerizing the application.
  2. Deploying containerized applications in an EKS cluster.
  3. Providing features such as automatic scaling, self-healing, and rolling updates for continuous availability and minimal downtime.

---

### 7. Kubernetes vs. Docker Swarm

**Answer:**

- **Kubernetes:**  
  - Powerful, flexible, and feature-rich.
  - Highly extensible and supports complex workloads, networking, and security.
- **Docker Swarm:**  
  - Simpler and easier to set up.
  - Integrates closely with Docker and is suitable for smaller applications or teams that do not require advanced features.

---

### 8. Deployment Challenges in Microservices

**Answer:**

- Kubernetes simplifies deployment challenges by automating:
  1. Rolling updates
  2. Auto-scaling
  3. Self-healing
  4. Service discovery
  5. Implementation of network policies
- These features help manage multiple services, allow independent scaling, and ensure high availability, so teams can focus on application development rather than infrastructure management.

---

### 9. what is Load Balancing with Kubernetes?

**Answer:**

- **Internal Load Balancing:**  
  - Managed by Kubernetes Services to efficiently route traffic between pods within the cluster.
- **External Load Balancing:**  
  - Handled by LoadBalancer services or **Ingress controllers** to expose applications externally and route traffic based on defined rules (such as hostnames or URL paths).

---

### 10. What is Kubernetes Operators?

**Answer:**

- A Kubernetes Operator is a method for packaging, deploying, and managing a Kubernetes-native application.
- It extends Kubernetes by using:
  - **Custom Resources (CRs):** Allow you to add custom resource definitions.
  - **Custom Controllers:** Monitor resource changes and act accordingly.
- **Operators** are especially useful for managing stateful applications and complex workloads.

---

### 11. Enhancing Kubernetes Security

**Answer:**

- Enhance security by implementing:
  1. Network Policies to restrict pod-to-pod communication.
  2. Role-Based Access Control (RBAC) to manage permissions.
  3. Namespaces for resource segregation and access control.

---

### 12. Centralized Logging in Kubernetes

**Answer:**

- Centralize logs using methods such as:
  - Node-level logging agents.
  - Integration with Grafana for visualization and analysis.
  - Exporting logs directly from pods using sidecar containers.

---

### 13. Kubernetes Ingress and Default Backend

**Answer:**

- **Kubernetes Ingress:**  
  - Manages routing of incoming requests based on defined rules.
- **Default Backend:**  
  - Handles any requests that do not match Ingress rules.
- Both ensure that traffic is directed properly to the intended services.

---

### 14. Troubleshooting Kubernetes Pod Scheduling Issues

**Answer:**

- Steps include:
  1. Using `kubectl describe` to diagnose pod startup issues.
  2. Adjusting resource allocations if pods are unschedulable.
  3. Checking for scheduling issues (taints, affinities, or constraints).

---

### 15. Port Forwarding in Kubernetes

**Answer:**

- Methods include:
  1. Forwarding a port (e.g., 8080) from a container to a service, then to an Ingress, and finally to a browser.
  2. Using Ingress controllers to expose ports externally.
  3. Configuring selectors to manage traffic forwarding effectively.

---

### 16. Do know about federated clusters?

**Answer:**

- Kubernetes Federated Clusters allow organizations to extend their environments across multiple clusters.
- Clusters may be spread across various geographical regions, cloud providers, or on-premises systems for scalability and redundancy.

---

### 17. have you ever heard about the application quick ride, quick ride want to increase their number of servers by simultanicely scaling their platform, how do u think quick ride can deal with the servers and their installations?

**Answer:**

- Quick Ride can containerize its application using Docker.
- The application can then be managed by Kubernetes for:
  1. Automated scaling
  2. Self-healing
- To monitor that a pod is always running, use Deployments with ReplicaSets and Horizontal Pod Autoscalers (HPA) to maintain the desired number of pods.

---

### 18. what is the diff b/w loadbalancer ip and external ip?

**Answer:**

- **LoadBalancer IP:**  
  - Specific to LoadBalancer-type services.
  - Automatically assigned by the cloud provider to expose the service externally.
- **External IP:**  
  - A general term for services (including NodePort and ClusterIP).
  - Can be manually configured or provided by a cloud provider.

---

### 19. k8s is self healing, can u walk me thru why?

**Answer:**

- Kubernetes is self-healing because:
  - It uses ReplicaSets to ensure that if a pod is deleted or fails, a new one is created to match the desired state.
  - This continuous monitoring and adjustment help maintain application availability despite failures or crashes.

---

### 20. lot of people call k8s as portable? if yes then how?

**Answer:**

- The container image built once can be deployed on any operating system.
- This portability allows deployment in various environments (e.g., AKS, EKS) regardless of the underlying OS.
- It embodies the "build once, deploy anywhere" principle.

---

### 21. when we talk about k8s app availability is there so how does k8s ensure the availability of applications?

**Answer:**

- Kubernetes ensures high availability using:
  1. ReplicaSets to maintain the desired number of pods.
  2. Autoscaling (Horizontal Pod Autoscaler).
  3. Deployment across multiple Availability Zones.
  4. Cluster Autoscaler to manage node resources.
- Together, these features provide fault tolerance, scalability, and self-healing.

---

### 22. Diff k8s deployment and k8s service?

**Answer:**

- **Kubernetes Deployment:**  
  - Manages the lifecycle of pods (ensuring desired count, updates, and self-healing).
- **Kubernetes Service:**  
  - Exposes pods to internal or external networks.
  - Provides load balancing and a stable endpoint.
- In summary:
  - Deployment → Focuses on application availability, scaling, and updates.
  - Service → Focuses on networking and traffic distribution.

---

### 23. upgrading clusters if you have any past experience?

**Answer:**

- Upgrading Kubernetes clusters involves:
  1. Backing up data (etcd).
  2. Upgrading the control plane first, then the worker nodes.
  3. Verifying the health of the cluster and applications.
  4. Managing rolling upgrades to minimize downtime.
  5. Testing post-upgrade to ensure functionality.
- Managed services like EKS, GKE, or AKS simplify some of these steps but careful planning is essential.

``` shell
Cluster upgrade is planned
--------------------------
no downtime to the existing apps but no new release and no new deployments in the upgrade time...
communications sent about cluster upgrade activity is started...

1. first we need to get another node group called green.
2. taint the green nodes, so that they should not get any pods scheduled
kubectl taint nodes ip-10-0-11-151.ec2.internal project=expense:NoSchedule
3. now upgrade your control plane, do it from console -
The control plane is upgraded first, ensuring the core management of the cluster is updated.

4. upgrade green node group also to 1.30 -
The green node group is then upgraded to version 1.30.

5. shift the workloads from 1.29 node group to 1.30 nodegroup -
Workloads are gradually shifted from the old (blue) node group to the new (green) one.

6. cordon blue nodes - The blue nodes are cordoned to stop new scheduling

7. untaint green nodes

8. drain blue nodes - eventually drained nodes to safely move remaining workloads off

inform all stake holders, application teams. perform sanity testing

close the activity

```

---

### 24. scaling k8s deployment?

**Answer:**

- Kubernetes allows scaling via:
  1. **Manual Scaling:** Using `kubectl scale` or modifying the replicas field in the Deployment YAML.
  2. **Automated Scaling:** Using Horizontal Pod Autoscalers (HPA) that scale based on resource metrics (CPU, memory, or custom metrics).

---

### 25. how does it handles the persistant storage requirements of the applications?

**Answer:**

- Persistent storage is handled by creating a PersistentVolumeClaim (PVC), which provisions an underlying storage volume (such as an EBS volume).
- This volume is then attached to the pod, ensuring that data is preserved even if the pod is recreated.

---

### 26. how do you use configmap?

**Answer:**

- ConfigMaps are used to store non-sensitive configuration data as key-value pairs.
- They can be injected into pods as environment variables or mounted as files.

---

### 27. k8s service account?

**Answer:**

- A Service Account in Kubernetes is used for managing permissions.
- Typically:
  1. Create an IAM role with the required policies.
  2. Attach the role and create a Service Account.
  3. Use this Service Account in deployments to restrict permissions.

---

### 28. types of deployment startegies?

**Answer:**

- Deployment strategies in Kubernetes include:
  1. **Rolling Update:** Gradually replaces pods with minimal downtime.
  2. **Recreate:** Terminates old pods before starting new ones (causing downtime).
  3. **Blue/Green:** Maintains two environments (blue and green) and switches traffic between them.
  4. **Canary:** Rolls out a new version to a subset of users first.
  5. **A/B Testing:** Tests different app versions with different user groups.
  6. **Rollback:** Reverts to a previous deployment version if issues arise.

---

### 29. how would you perform a rolling update?

**Answer:**

- **Steps:**
  1. **Prepare the Deployment:** Ensure the YAML file is correct and the app is running.
  2. **Update the Image:** Modify the container image (or use `kubectl set image`).
  3. **Configure the Rolling Update Strategy:** Optionally set parameters like `maxSurge` and `maxUnavailable`.
  4. **Apply the Update:** Use `kubectl apply -f deployment.yaml`.
  5. **Monitor the Update:** Use `kubectl rollout status` and `kubectl get pods`.
  6. **Rollback if Needed:** Use `kubectl rollout undo` if issues occur.
  7. **Verify the Update:** Confirm that the new version is running correctly.
- The update creates new pods one by one while terminating old pods in parallel.
- **Example Commands:**
  ```shell
  kubectl rollout undo deployment/<deployment-name>
  
  kubectl rollout history deployment/<deployment-name>
  
  kubectl rollout undo deployment/nginx-deployment --to-revision=1
  
  kubectl set image=<> <container name> <app-name:v1>
  ```

---

### 30. When do you use statefullset?

**Answer:**

- **StatefulSet** is used for stateful applications (e.g., databases, Prometheus, Elasticsearch) that require:
  1. Persistent storage
  2. Stable network identities
- It guarantees a specific deployment order (e.g., pod-0, pod-1, etc.), unlike Deployments which are best suited for stateless applications.

---

### 31. as a k8s admin if I ask you to secure my k8s cluster? how do you do? there are multiple ways just walk me thru one or two.

**Answer:**

- Options include:
  1. Implementing **RBAC** to restrict access to API groups and resources.
  2. Using **Network Policies** to limit pod communication.
  3. Managing **Secrets** to handle sensitive data securely.

---

### 32. monitoring part of k8s cluster?

**Answer:**

- Monitoring is essential for maintaining a healthy cluster.
- Tools and methods include:
  1. Prometheus (for metrics collection)
  2. Grafana (for visualization)
  3. ELK Stack (Elasticsearch, Logstash, Kibana)
  4. Fluentd (for log aggregation)
  5. Jaeger (for tracing)
- These tools help track cluster health and application performance.

---

### 33. Why thanos?

**Answer:**

- Prometheus is designed for short-term, in-memory storage (typically a few weeks).
- For long-term retention in larger environments, Thanos provides:
  1. Long-term storage capabilities.
  2. Efficient data retention.
- Thanos scrapes data from Prometheus and stores it for extended periods.

---

### 34. High availability and fault tolerance part? how does eks ensures all of this?

**Answer:**

- EKS achieves high availability (HA) by:
  1. Distributing the control plane across multiple Availability Zones (AZs).
  2. Using Auto Scaling Groups (ASG) for worker nodes.
- This multi-AZ distribution and node group resiliency ensure scalability and fault tolerance.
- Multi-AZ Worker Nodes:
  You can deploy worker nodes in multiple Availability Zones. This distribution not only enhances fault tolerance but also improves workload availability by spreading resources           
  geographically.

---

### 35. when we talk about the load balancing part for the services across the nodes, how does k8s manage this?

**Answer:**

- Kubernetes manages load balancing using various service types (e.g., ClusterIP, NodePort, LoadBalancer, Headless).
- The method used depends on whether the load balancing is internal or external to the cluster.

---

### 36. what are diff kind of load bal techiques or algorithms available?

**Answer:**

- Load balancing techniques include:
  - **Round Robin:** Requests are routed in cyclic order.
  - **Least Connections:** Directs new requests to the server with the fewest active connections.
  - **Least Response Time:** Routes to the server with the lowest latency.
  - **Weighted Round Robin:** Distributes requests based on assigned weights.
  - **IP Hash:** Uses a hash of the client's IP to route requests.
  - **Sticky Sessions:** Maintains client-session affinity using session IDs or cookies.
  - **Random:** Selects a server at random.
  - **Least Bandwidth:** Chooses the server with the lowest current bandwidth usage.

---

### 37. let's talk about ingress? how do you think it facialates external access to the services?

**Answer:**

- There are two common approaches:
  1. **Direct Exposure:** Expose a service directly as a LoadBalancer.
  2. **Ingress Controller:**  
     - Creates a LoadBalancer service behind the scenes.
     - Monitors Ingress resources with defined rules (host-based, path-based) to route traffic.
- The Ingress controller uses selectors and labels to identify and route traffic to the correct service.

---

### 38. how finely grained access control you can manage in amazon eks clusters, how would you implement and what are the terminlogies what are the things that you're gonna take care about it?

**Answer:**

- Use **RBAC** to define fine-grained access policies.
- Limit permissions via Service Accounts (SAs) attached to deployments.
- Map specific IAM users or roles in the `aws-auth` ConfigMap:
  ```shell
  kubectl -n kube-system get configmap/aws-auth -o yaml
  ```

---

### 39. have you ever heard about pod security policies PSP?

**Answer:**

- Pod Security Policies enforce security constraints (e.g., allowed hosts, capabilities, namespaces).
- Note: PSPs are deprecated in Kubernetes v1.25; alternatives include Pod Security Admission.

---

### 40. Do you know about pattern containers?

**Answer:**

- **Sidecar Pattern:**  
  - Runs a secondary container alongside the main application container.
  - Provides additional functionalities such as logging, monitoring, proxying, or configuration management.
- **Init Containers:**  
  - Run before the main containers.
  - Often used to perform initialization tasks like setting up databases or loading configuration.

---

### 41. K8s helm? how does it assists in your managing the applications?

**Answer:**

- Helm is the package manager for Kubernetes.
- It enables templating and parameterizing manifest files, so you don’t have to rewrite YAML files for every deployment.
- You can use a common chart and override values with a `values.yaml` file for different deployments.

---

### 42. helm release management?

**Answer:**

- Use the command `helm ls` to list releases.
- When you install a Helm chart, it creates a release instance in your cluster.
- Each release is versioned and can be managed (updated, rolled back) independently.

---

### 43. what is istio?

**Answer:**

- Istio is a service mesh platform designed to manage microservices communication.
- It provides traffic management, security, observability, and resilience.
- Istio deploys proxies alongside microservices to handle service-to-service communication without requiring code changes.

---

### 44. "When we say that we have to compare it with a Docker container, how is it different from a Docker container?"

**Answer:**

- A Kubernetes pod is the smallest deployable unit in Kubernetes (comparable to an EC2 instance).
- A pod can host one or more containers that share the same network and storage.
- In contrast, a Docker container is a single isolated container.
- For example, a pod might contain:
  1. A web server container.
  2. One or more sidecar containers.
  3. An application container.
- This is the key difference between a pod and a standalone Docker container.

---

### 45. "When does it run this init container? When the pod is created? ... Can you tell me about the purpose of the init container and when do you use it?"

**Answer:**

- Init containers run before the main application containers in a pod.
- They are used to perform initialization tasks that must complete before the main containers start.
- For example, an init container might load database schemas into a database before the backend service starts.

---

### 46. "Kubernetes has this stateful sets, right? So, when would you choose stateful set instead of a deployment?"

**Answer:**

- **StatefulSet:**  
  - Used for stateful applications (e.g., databases like PostgreSQL, MySQL, RabbitMQ, Redis) that require persistent storage and stable network identities.
  - It guarantees the order of pod deployment (e.g., pod-0, pod-1, etc.).
- **Deployment:**  
  - Used for stateless applications where deployment order is not critical.

---

### 47. "So, we have ConfigMap and Secrets, right? How do they differ from each other, and if you can provide a use case for each one of them?"

**Answer:**

- **ConfigMap:**  
  - Stores non-sensitive key-value pairs.
  - Example use case: Storing application configuration data such as database connection strings.
- **Secrets:**  
  - Stores sensitive data (e.g., passwords, API keys) in an encoded format.
  - Example use case: Storing API keys for external services.

---

### 48. "In your current job, if you're using Kubernetes, what are the deployment strategies your folks are using?"

**Answer:**

- **Rolling Update:**  
  - New updates are applied one pod at a time—each new pod is created and verified before an old pod is terminated.
- **Blue/Green:**  
  - Two separate environments (blue and green) are maintained; after testing one environment, traffic is switched to the other.
- **Comparison:**  
  - Rolling updates use minimal resources but may take longer.
  - Blue/Green allows quick rollback but requires extra resources to maintain both environments.

---

### 49. "Access Control in Kubernetes, yes, right? Set up an RBAC for a user or a service account. Can you set up an RBAC for a user or a service account?"

**Answer:**

- RBAC (Role-Based Access Control) lets you define which actions a user or service account can perform on Kubernetes resources.
- To set up RBAC:
  1. Define a Service Account (or specify a user).
  2. Create a Role that specifies allowed actions.
  3. Bind the Role (or ClusterRole) to the user or Service Account using a RoleBinding or ClusterRoleBinding.

---

### 50. "What exactly is a multi-tenant cluster? In terms of Kubernetes"

**Answer:**

- A multi-tenant cluster is one in which multiple teams, departments, or organizations share the same Kubernetes cluster while maintaining isolation and control over their own resources.

---

### 51. "When we talk about Kubernetes, there are two strategies, let's say, rolling back and rolling forward for deployment. Can you explain to me like when would we use what and why?"

**Answer:**

- **Rolling Back:**  
  - Used when a new deployment introduces critical issues. You revert to a previous version.
  - Example command:  
    ```shell
    kubectl rollout undo deployment/<deployment-name>
    ```
- **Rolling Forward:**  
  - Used for incremental updates and patches where the transition should be smooth.
  - Rolling back is employed in cases of critical bugs, while rolling forward suits non-disruptive updates.

---

### 52. Can you walk me through the CI/CD pipeline you use in your current project, specifically related to Kubernetes?

**Answer:**

- Our CI/CD pipeline uses Jenkins and follows GitFlow:
  1. Developers create feature branches from the main branch.
  2. Feature branches merge into the development branch.
  3. A release branch is created from development, then merged into both development and master.
  4. For hotfixes, a branch is created from master and merged back into both master and development.
- Webhooks trigger Jenkins jobs when code is checked in.
- Jenkins stages include:
  - SCM checkout
  - Compile
  - Build
  - Test
  - Code coverage
  - Code quality analysis
  - Security scan
  - Vulnerability scan
  - Delivery and deployment

---

### 53. How do you perform rolling updates for your application in Kubernetes without causing downtime?

**Answer:**

- When new code is committed, a new Docker image is generated.
- Update the Deployment YAML with the new image and desired replica settings.
- Apply the update using:
  ```shell
  kubectl apply -f deployment.yaml
  ```
- This process performs a rolling update, ensuring no downtime.

---

### 54. When you create a new version of your Docker image, what steps do you follow?

**Answer:**

- Update the Deployment YAML with the new Docker image version.
- Apply the updated YAML with `kubectl apply` to deploy the new version.

---

### 55. Have you ever worked with horizontal pod autoscaling (HPA) in Kubernetes? If so, how do you set it up?

**Answer:**

- HPA scales pods based on defined metrics (e.g., CPU utilization).
- Setup involves:
  1. Configuring HPA via a YAML file.
  2. Setting minimum and maximum replicas (e.g., 1 to 50), scaleTargetRef points to the actuall deployment.
  3. Defining target metrics (such as average CPU utilization).
  4. Ensuring a metrics server is running (or using Prometheus/other metrics APIs).

---

### 56. Explain the purpose of persistent storage in Kubernetes and why it's needed?

**Answer:**

- Persistent storage is critical for stateful applications (like databases) where data loss is unacceptable.
- Kubernetes uses Persistent Volumes (PV) and Persistent Volume Claims (PVC) to provide storage that survives pod restarts or rescheduling.

---

### 57. Describe a scenario where you would use Persistent Volumes (PVs) and Persistent Volume Claims (PVCs) in Kubernetes?

**Answer:**

- Steps include:
  1. Define a Persistent Volume (PV) with storage details.
  2. Create a Persistent Volume Claim (PVC) that specifies the required storage.
  3. Mount the PVC in a stateful application's Deployment or StatefulSet.
- This approach ensures that data remains intact even if pods are recreated.

---

### 58. Have you ever used multiple containers within a single pod in Kubernetes? Provide an example.

**Answer:**

- Yes, multiple containers (e.g., a main container plus sidecar or init containers) can run in a single pod.
- **Example:**  
  - A pod that runs:
    1. A primary application (e.g., Nginx)
    2. A sidecar container (e.g., Fluentd for logging)
- **Example YAML:**
  ```yaml
  spec:
    containers:
    - name: nginx
      image: nginx:latest
      ports:
      - containerPort: 80
    - name: fluentd
      image: fluent/fluentd:v1.12-1
      volumeMounts:
      - mountPath: /fluentd/log
        name: log-volume
  ```

---

### 59. How do you manage secrets in your Kubernetes project, and what role does Kubernetes Secret play?

**Answer:**

- Secrets store sensitive data (e.g., API keys, passwords) in an encrypted (Base64) format.
- They can be created and referenced in manifest files to securely inject sensitive data into pods without exposing it.

---

### 60. Can you explain a scenario where you would use a service mesh in Kubernetes, especially in terms of authentication and authorization?

**Answer:**

- A service mesh (e.g., Istio) manages secure communication between microservices.
- It automates tasks such as:
  1. Traffic management
  2. Load balancing
  3. Service discovery
  4. Security (including mTLS for authentication and authorization)
- It can also handle SSL termination and advanced routing.

---

### 61. Why are Pod Security Policies important in Kubernetes, and how would you implement them to enhance security?

**Answer:**

- Pod Security Policies (PSPs) enforce security constraints (e.g., allowed hosts, capabilities, namespaces) on pods.
- They help maintain a secure environment.
- Note: PSPs are deprecated in Kubernetes v1.25; alternatives like Pod Security Admission should be used.

---

### 62. Do you work with resource limits and resource quotas in your Kubernetes setup? If yes, how do you set them up? What factors will you include?

**Answer:**

- Resource limits and quotas ensure fair resource allocation and prevent resource exhaustion.
- The process involves (Assessing the application's CPU, memory, and other resource requirements.):
  1. resource quotas and limits for the name spaces that it will allow us to control the resource consumption
  2. first all of we need to check the resource requirements of application
  3. we need to analyze the how much resources are consuming by the application
  4. we need to understand the cpu
  5. we need to understand the memory
  6. we need to understand the namespace needs
  7. Creating a ResourceQuota for a namespace.
  8. Binding the quota to the namespace.
- **Example YAML:**
  ```yaml
  apiVersion: v1
  kind: ResourceQuota
  metadata:
    name: resource-quota
    namespace: my-namespace
  spec:
    hard:
      requests.cpu: "4"
      requests.memory: "8Gi"
      limits.cpu: "8"
      limits.memory: "16Gi"
      pods: "10"
      persistentvolumeclaims: "5"
  ```

---

### 63. what is crds?

**Answer:**

- Custom Resource Definitions (CRDs) allow you to define custom resources within your Kubernetes cluster.
- They extend Kubernetes’ capabilities by letting you create resources specific to your application.
- CRDs are often used with custom controllers and operators (e.g., the Prometheus operator).

---

### 64. Network policies and how would you enchance the cluster secuirty networkpolicies?

**Answer:**

- Network policies control and restrict communication between pods.
- They define ingress (incoming) and egress (outgoing) traffic rules.
- Use network policies to limit access to sensitive resources (e.g., databases) to only trusted pods.
- **Example YAML:**
  ```yaml
  apiVersion: networking.k8s.io/v1
  kind: NetworkPolicy
  metadata:
    name: allow-frontend-ingress
  spec:
    podSelector:
      matchLabels:
        app: backend  # Apply to 'backend' pods
    ingress:
    - from:
      - podSelector:
          matchLabels:
            app: frontend  # Allow ingress from pods with label 'app=frontend'
  ```

---

### 65. How would you implement horizontal pod scaling based on custom metrics specific to your application's performance indicators?

**Answer:**

- Horizontal Pod Autoscaler (HPA) scales pods based on defined metrics.
- Steps include:
  1. Configuring HPA via a YAML file.
  2. Setting minimum and maximum replicas (e.g., 1 to 50).
  3. Defining target metrics (e.g., average CPU utilization).
  4. Ensuring a metrics server (or Prometheus/other metrics APIs) is running.

---

### 66. Explain a scenario where pod priority and preemption in Kubernetes would be useful, and have you ever implemented this? If yes, then how?

**Answer:**

- **Scenario:**  
  - Critical services (e.g., Order Service, Payment Service) must continue running even under resource constraints.
  - In every Apps there will beHigh-Priority Workloads, Low-Priority Workloads; high workload has be run even under resource shortages
  - Priority: Each pod gets a priority value. The higher the priority, the more important the pod is to the cluster.
  - Preemption: If a higher-priority pod cannot be scheduled due to resource constraints, Kubernetes will try to preempt (evict) lower-priority pods to free up the necessary resources.

The critical services like Order Service and Payment Service continued running smoothly even during resource pressure when we use Pod priority and preemption features.

Non-critical services, such as batch processing jobs, were evicted when resources were tight, but they could always be rescheduled once resources became available.
Pod priority and preemption are powerful features that help ensure that critical applications are not disrupted during resource shortages, making them crucial for ensuring the reliability and availability of high-priority services.
- **Implementation:**  
  1. Assign priority values to pods (higher for critical services).
  2. If resources are scarce, Kubernetes preempts (evicts) lower-priority pods to free up resources.
- This ensures that essential applications remain operational during high resource pressure.
  ```yml
  apiVersion: scheduling.k8s.io/v1
  kind: PriorityClass
  metadata:
    name: high-priority #for low low-priority
  value: 1000 #for low we need to give less value like 100 or 500
  globalDefault: false
  description: "Priority class for critical production workloads"
  ```
  - once we define the the above class we can use this class name under pod spec as : **priorityClassName: high/low-priority**

---

### 67. Can you differentiate between Kubernetes Jobs and Cron Jobs, and when would you use each?

**Answer:**

- **Kubernetes Job:**  
  - Runs a task once and is short-lived.
- **Cron Job:**  
  - Schedules and runs tasks repeatedly at specified intervals.
- Use a Job for one-time tasks and a CronJob for periodic tasks (e.g., daily backups).

---

### 68. In what situations would you use StatefulSets in Kubernetes, and what benefits do they offer over Deployments?

**Answer:**

- **StatefulSet:**  
  - Used for stateful applications (e.g., databases like PostgreSQL, MySQL, RabbitMQ, Redis).
  - Provides persistent storage and stable network identities.
  - Guarantees a specific deployment order (e.g., pod-0, pod-1, etc.).
- **Deployment:**  
  - Suitable for stateless applications where deployment order is not critical.

---

### 69. How can you change the number of replicas for a ReplicaSet in Kubernetes, and what should you check for if the replicas are not scaling as expected?

**Answer:**

- **Commands:**
  ```shell
  kubectl scale replicaset my-replicaset --replicas=5
  kubectl scale deployment my-deployment --replicas=5
  kubectl autoscale replicaset my-replicaset --min=1 --max=10 --cpu-percent=80
  ```
- **If not scaling, check:**
  1. Pod resource requests and limits.
  2. Node resource availability.
  3. Pod scheduling issues (taints, affinities, or constraints).
  4. Pod readiness and liveness probes.
  5. Cluster events and logs.
  6. HPA status (`kubectl get hpa`).
  7. Resource quotas in the namespace (`kubectl get resourcequota -n <namespace>`).

---

### 70. how do you ensure HA and scalability in eks cluster?

**Answer:**

- EKS ensures high availability (HA) by:
  1. Distributing the control plane across multiple Availability Zones (AZs).
  2. Using Auto Scaling Groups (ASG) for worker nodes.
  3. ReplicaSets to maintain the desired number of pods.
  4. Autoscaling (Horizontal Pod Autoscaler).
  5. Deployment across multiple Availability Zones.
  6. Cluster Autoscaler to manage node resources.
  Together, these features provide fault tolerance, scalability, and self-healing.
- This multi-AZ distribution and autoscaling make the cluster resilient and scalable.

---

### 71. Can you explain the process of updating the nodes in eks without causing the downtime?

**Answer:**

- EKS supports rolling updates for worker nodes:
  1. Launch a new instance with the desired AMI version.
  2. Gradually drain and terminate the old instances.
- Using EKS Managed Node Groups simplifies this process because Amazon handles many update tasks.
- This rolling update process ensures continuous operation without downtime.

---

### 72. monitoring and logging with respect to kubernetes? how do you done it?

**Answer:**

- **Monitoring:**  
  - Collect and visualize metrics using tools like Prometheus and Grafana.
- **Logging:**  
  - Aggregate logs from containers, nodes, and the control plane using:
    - The EFK stack (Elasticsearch, Fluentd, Kibana)
    - The PLG stack (Promtail, Loki, Grafana)
- Best practices include centralizing logs, setting retention policies, using structured logging, and establishing alerts for critical metrics.

---

### 73. Have you ever used aws cloudwatch and explain how does it integrate with eks?

**Answer:**
- Basically we can integrate aws cloudwatch for monitoring, we can collect and monitor the logs using cloudwatch logs.
- Additionaly we can configure specific tools like fluentD, prometheus and grafana is also one thing.
- We can use cloudwatch container insights to gain deeper insights for containerzed applications
  
- AWS CloudWatch integrates with EKS by:
  1. Collecting container logs using Fluent Bit or Fluentd.
  2. Capturing resource utilization metrics (CPU, memory, disk usage) via CloudWatch Container Insights.
  3. Setting up alarms with CloudWatch Alarms.
  4. Enabling advanced querying with CloudWatch Logs Insights.
  5. Integrating with Managed Prometheus and Grafana for visualization.

---

### 74. Can you explain me how IAM roles are used in eks for access control?

**Answer:**

- IAM roles in EKS are mapped to Kubernetes RBAC:
  1. The `aws-auth` ConfigMap maps specific IAM users/roles to Kubernetes users or groups.
  2. IAM Roles for Service Accounts (IRSA) allow pods to securely access AWS resources.
- This integration provides both authentication (who can access the cluster) and authorization (what actions they can perform).

---

### 75. how are you integrating amazon eks with cicd pipeline? consider a scenario in which I have containerized apps I want to deploy them on amazon eks using any cicd pipeline, how will you do that?

**Answer:**

- The process involves:
  1. Building container images.
  2. Pushing the images to Amazon ECR.
  3. Updating the EKS cluster using `kubectl` or `eksctl` commands.
- This enables automated, continuous delivery of containerized applications.

---

### 76. Let's say you are setting up an eks cluster for new client? can you describe me what are the networking considering you will use?

**Answer:**

- An EKS cluster requires:
  1. A VPC with specific configurations.
  2. Subnets spanning different Availability Zones.
  3. Proper security groups.
  4. Network policies.
  5. Service networking.
  6. Scaling mechanisms (e.g., HPA or Cluster Autoscaler).

---

### 77. when we have eks cluster there are external services or resources as well right? so how can your apps in an eks cluster access external services or resources?

**Answer:**

- Options include:
  1. Using a NAT Gateway for internet access from private subnets.
  2. Configuring VPC Endpoints for private access to AWS services.
  3. Utilizing Elastic Load Balancers (ELB) for external access.
  4. Employing IAM Roles for Service Accounts (IRSA) to securely access AWS resources.
  5. Ensuring proper DNS resolution, security groups, and network policies for secure communication.

---

### 78. Have you ever done any cost optimization related to eks?

**Answer:**

- Cost optimization strategies include:
  1. Right-sizing EC2 instances.
  2. Using Cluster Autoscaler and Horizontal Pod Autoscaler.
  3. Leveraging AWS Fargate for serverless deployments.
- In my experience, using EC2 spot instances for worker nodes can significantly reduce costs, and autoscaling ensures you only pay for the resources you need.

---

### 79. Can you describe a roll back startegy in eks? and how would you handle a deployment failure?

**Answer:**

- **Rolling Update Strategy Example (in Deployment YAML):**
  ```yaml
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
  ```
- This configuration ensures zero-downtime updates.
- If a deployment fails, Kubernetes can automatically or manually roll back to the previous stable version.
- Use the **kubectl rollout undo <>** command to revert to the previous stable revision.
-  Alternatively, if we’re using an automated deployment tool, configure it to trigger this command automatically.

---

### 80. Have you ever worked on multicluster management? like dev staging prod? how would you manage multiple eks clusters across different environment?

**Answer:**

- Management can be achieved using:
  1. AWS Organizations.
  2. AWS Control Tower for centralized governance.
  3. Automation tools like AWS CLI/SDK.
  4. Infrastructure as Code (e.g., Terraform or CloudFormation) for consistent deployments across environments.

---

### 81. Describe a scenario where you need custom networking configuration for your eks cluster?

**Answer:**

- Custom networking may be required for:
  1. Enforcing specific firewall rules.
  2. Integrating with on-premise networks.
- Use Amazon VPC’s CNI (container network interface) plugin to enable advanced networking configurations within the VPC.

---

### 82. Can you explain me how a pod to pod communtication happen within eks cluster?

**Answer:**

- Pod-to-pod communication in an EKS cluster is seamless because:
  1. Each pod is assigned its own IP address according to the Kubernetes networking model.
  2. The CNI plugin (e.g., Amazon VPC CNI) ensures that pods across different nodes can communicate using VPC-level networking.

---
