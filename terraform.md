# Terraform Interview Questions

## Table of Contents

- [1. What is state file? when it is create?](#q1)
- [2. how to store statefile in AWS?](#q2)
- [3. what is taint command in terraform?](#q3)
- [4. what is null resource?](#q4)
- [5. what is the module in terraform?](#q5)
- [4. what is data source? how we can use it?](#q6)
- [5. what type of resources you have created from terraform?](#q7)
- [6. what is dynamic block?](#q8)
- [7. When you created the environment using Terraform, what components did you set up using Terraform?](#q9)
- [8. How do you make changes to the configuration of already created resources using Terraform?](#q10)
- [9. When the Terraform state file is created, what do you do with that state file and where do you store and find it?](#q11)
- [10. How do you resolve the issue if you lose the Terraform state file?](#q12)
- [11. What are the major features you have found in Terraform that you can talk about?](#q13)
- [13. What is the `terraform validate` command used for, and can you provide an example?](#q14)
- [14. Have you ever heard about the lifecycle in Terraform? Can you talk more about it?](#q15)
- [15. If you had to choose between Ansible and Terraform, which one would you prefer and why?](#q16)
- [16. In your current organization, which tool are you using: Ansible, Terraform, or Pulumi?](#q17)
- [17. In a scenario where you have 20 resources running on a public cloud (AWS or Azure) and you want to destroy just one resource, how would you go about doing that?](#q18)
- [18. Have you ever preserved a key that you created using Terraform?](#q19)
- [19. What happens if you delete the Terraform state file and then run the `terraform apply` or `terraform plan` command?](#q20)
- [20. Have you ever worked with modules in Terraform? What are the different types of modules in Terraform?](#q21)
- [21. The module that gets called is what: a parent module or a child module?](#q22)
- [22. From where we call a module, what is that module called?](#q23)
- [24. Have you ever heard about remote backends in Terraform? Do you have any ideas or experience with them?](#q24)
- [25. How can you provide variable values at runtime in Terraform?](#q25)
- [26. In an organization, how do you manage multiple environments in Terraform?](#q26)
- [27. Why do we call Terraform "Infrastructure as Code" (IaC)? Is there a particular reason for this?](#q27)
- [28. Can you explain some drawbacks or challenges you have faced in your career?](#q28)
- [29. Which version of Terraform are you using?](#q29)
- [30. 𝐖𝐡𝐚𝐭 𝐡𝐚𝐩𝐩𝐞𝐧𝐬 𝐢𝐟 𝐲𝐨𝐮𝐫 𝐬𝐭𝐚𝐭𝐞 𝐟𝐢𝐥𝐞 𝐢𝐬 𝐚𝐜𝐜𝐢𝐝𝐞𝐧𝐭𝐚𝐥𝐥𝐲 𝐝𝐞𝐥𝐞𝐭𝐞𝐝?](#q30)
- [31. What happens if multiple team members run terraform apply at the same time?](#q31)
- [32. What happens if a resource fails halfway through terraform apply?](#q32)
- [32. What happens when AWS API rate limits are hit during a large terraform apply?](#q33)
- [5. What happens if terraform plan shows no changes but infrastructure was modified outside Terraform?](#q34)
- [33. What happens if you delete a resource from your Terraform configuration?](#q35)
- [34. What happens if a provider API changes between Terraform versions?](#q36)
- [35. What happens if you have circular dependencies in Terraform modules?](#q37)
- [36. What happens if you exceed AWS service quotas during deployment?](#q38)
- [37. What happens if you lose access to the remote backend storing your state?](#q39)
- [39. what is major difeerences between terraform and cloud formation?](#q40)
- [40. whenever we have access keys and passwords, how would you manage them?](#q41)
- [41. Have you ever used Data sources to retrieve sensitive information from any external system?](#q42)
- [41. What are outputs in terraform?](#q43)
- [42. What are Locals in terraform?](#q44)
- [43. What is count and count.index?](#q45)
- [44. what are provisioners in terraform?](#q46)
- [45. What are functions in terraform and name a few functions you used?](#q47)
- [46. how does terraform manage updates to the existing resources?](#q48)
- [47. How can you roll back to a previous Terraform state version?](#q49)
- [48. how do you use conditions in terraform?](#q50)

---

<a name="q1"></a>
### 1.What is state file? when it is create?

- **Terraform**'s **state file**—typically named **terraform.tfstate**—stores the metadata of the infrastructure defined in your **Terraform** files.
- This file is created during the execution of commands like **terraform init** or **terraform apply**.
- For example, if you initially create 10 **EC2** instances, running **terraform apply** will provision those 10 instances and generate a **terraform.tfstate** file to record their state.
- Later, if your requirement increases to 15 instances and you update your configuration to include an additional 5 **EC2** instances, **Terraform** will use the existing **state file** to understand the current infrastructure.
- It will refresh the state and then create only the new 5 instances without re-provisioning the original 10.

---

<a name="q2"></a>
### 2.how to store statefile in AWS?

- To store **Terraform**'s **state file** in **AWS**, you can configure **Terraform** to use an **S3 backend**.
- This not only centralizes the **state file** storage but also facilitates collaboration and helps manage **state locking**.

---

<a name="q3"></a>
### 3.what is taint command in terraform?

- The **taint** command in **Terraform** is used to mark a specific resource as "tainted," meaning that **Terraform** will destroy and recreate it during the next **terraform apply**.
- This is particularly useful when you suspect that a resource is in a broken or inconsistent state—even if its configuration appears correct.
- Example:
  ```bash
  terraform taint aws_instance.example
  ```
- If you change your mind, you can use **terraform untaint** to remove the taint, canceling the planned replacement.

---

<a name="q4"></a>
### 4.what is null resource?

- **null resource** do not create any infra in provider but it is usefull for the triggers **remote exec** and **local exec**.

---

<a name="q5"></a>
### 5.what is the module in terraform?

- In **Terraform**, a **module** is a package of configuration that manages a group of related resources.
- **Modules** let you encapsulate and reuse code, making your infrastructure definitions more organized, maintainable, and scalable.
- advantages
  - DRY concept
  - code reuse
  - best practices can be implemented and forced to use
  - easy to maintain/update
  - we can keep few restrictions based on company guidelines
- Module developers --> they create **tf code** with best practices
- Module users --> they use the **module code**

---

<a name="q6"></a>
### 4.what is data source? how we can use it?

- **Terraform** can query the provider data using a **data source** like **AMI id** or any existing infrastructure that isn’t directly managed by our current **Terraform** configuration.
- This is useful when you need to reference details from resources that already exist or derive values dynamically.

---

<a name="q7"></a>
### 5.what type of resources you have created from terraform?

- using **Terraform** we can provision various types of infrastructure resources, including:
  - **Compute:** **EC2** instances, virtual machines, **Lambda** functions.
  - **Networking:** **VPCs**, subnets, security groups, load balancers.
  - **Storage & Databases:** **S3** buckets, block storage, databases (e.g., **RDS**).
  - **IAM:** Users, roles, permissions.
  - **Other:** **Kubernetes** clusters, **DNS** entries, and more.
- **Terraform** handles the lifecycle (create, update, delete) of these resources through configuration files, keeping your infrastructure consistent and manageable.

---

<a name="q8"></a>
### 6.what is dynamic block?

- **dynamic block** looping used to iterate the repeated dynamic blocks like **ingress block** we can iterate **ingress block** by setting up **dynamic** and **for_each** within it so that we can reduce the code to minimum and we can avoid writing **ingress block** for each and every port.
- ex:
  ```hcl
  variable "ingress_ports" {
    type    = list(number)
    default = [80, 443, 8080]
  }
  
  resource "aws_security_group" "example" {
    name = "example-sg"
  
    dynamic "ingress" {
      for_each = var.ingress_ports
      content {
        from_port   = ingress.value
        to_port     = ingress.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
  }
  ```

---

<a name="q9"></a>
### 7.When you created the environment using Terraform, what components did you set up using Terraform?

- When creating an environment with **Terraform**, common components include:
  - **Networking:** **VPC**, subnets, security groups.
  - **Compute:** **EC2** instances, autoscaling groups, **Lambda**, containers (**EKS/ECS**).
  - **Load Balancing:** **ALB** or **NLB**.
  - **Storage:** **S3** buckets, **EBS**, **EFS**.
  - **Databases:** **RDS**, **DynamoDB**, **ElastiCache**.
  - **IAM:** Roles, policies, users.
  - **Monitoring:** **CloudWatch** alarms and logs.
  - **DNS & CDN:** **Route 53**, **CloudFront**.
  - **Secrets Management:** **AWS Secrets Manager** or **Parameter Store**.

---

<a name="q10"></a>
### 8.How do you make changes to the configuration of already created resources using Terraform?

- Edit your **Terraform** `.tf` files to reflect the desired changes to your infrastructure and run **terraform plan** and **terraform apply** to apply the changes.
- if the configuration is not managed by **Terraform** previously or if a resource was created manually (or outside of **Terraform**), and you want **Terraform** to manage and update its configuration, you use **Terraform Import**.
  1. Define a resource block matching the existing resource in your `.tf` file.
     ```hcl
     resource "aws_instance" "example" {
       # Configuration matching existing resource
     }
     ```
  2. Run the **terraform import** command
     ```bash
     terraform import aws_instance.example i-0123456789abcdef0
     ```

---

<a name="q11"></a>
### 9.When the Terraform state file is created, what do you do with that state file and where do you store and find it?

- When **Terraform** creates the **state file** (**terraform.tfstate**), you typically manage and store it securely, because it contains sensitive details about your infrastructure.
- **Best Practice:** Store **state** remotely (e.g., in **AWS S3**)
- **Benefits of Remote State:**
  - Centralized & Secure: Secure access control through **IAM**.
  - Collaboration: Allows multiple team members to safely use the same **state file**.
  - **State Locking:** Prevents conflicts during concurrent state access (using **DynamoDB** for locking).
  - **Versioning:** Easy recovery from accidental deletion or modification.

---

<a name="q12"></a>
### 10.How do you resolve the issue if you lose the Terraform state file?

- If the **Terraform state file** is lost, the best recovery approach is to:
  - Recover from remote backups or versioned storage.
  - If no backup is available, manually reconstruct the state using **terraform import**.
- Validate with **terraform plan**, then apply corrections.
- 🚨 **Important Practices to Avoid Future Losses:**
  - Store **state** remotely (e.g., **AWS S3 backend**).
  - Enable **versioning** on your remote **state** storage.
  - Regularly back up your **Terraform state** to prevent accidental deletion or corruption.
  - Use **state locking** (e.g., **DynamoDB** table) to avoid concurrent modification issues.

---

<a name="q13"></a>
### 11.What are the major features you have found in Terraform that you can talk about?

- Here are some major **Terraform** features you can highlight:
  - ✅ 1. **Infrastructure as Code (IaC)**
    - Manage infrastructure declaratively using configuration files.
    - Makes infrastructure changes transparent, repeatable, and version-controlled.
  - ✅ 2. **Platform Agnostic**
    - Supports multiple cloud providers (**AWS**, **Azure**, **GCP**), on-prem solutions, and SaaS services.
    - Provides flexibility across hybrid or multi-cloud setups.
  - ✅ 3. **Resource Graph and Dependency Management**
    - Automatically manages dependencies between resources.
    - Ensures resources are created in the correct order based on dependencies.
  - ✅ 4. **Execution Plans (terraform plan)**
    - Preview changes before applying.
    - Understand clearly what **Terraform** will modify, create, or destroy.
  - ✅ 5. **State Management**
    - Keeps track of the current state of your infrastructure.
    - Supports remote **state backends** (**S3**, **Azure Storage**, etc.) for secure and collaborative state management.
  - ✅ 6. **Modules**
    - Supports reusable and shareable configurations.
    - Simplifies infrastructure management through encapsulation of resources.
  - ✅ 7. **Workspaces**
    - Create multiple isolated environments (e.g., staging, prod) within the same configuration.
  - ✅ 8. **Providers** & Community Ecosystem
    - Extensive support for cloud providers and third-party integrations.
    - Strong community and ecosystem with open-source **modules** and tools.
  - ✅ 9. **Dynamic Blocks** & Expressions
    - Allow dynamic generation of complex configurations.
    - Greatly reduce repetitive code and simplify **conditional infrastructure logic**.
  - ✅ 10. **Terraform Import**
    - Integrates manually created resources into **Terraform** management easily.

---

<a name="q14"></a>
### 13.What is the `terraform validate` command used for, and can you provide an example?

- The **terraform validate** command is used to check your **Terraform** configuration files (`.tf`) for syntax correctness, internal consistency, and valid resource definitions. It ensures your code is valid before you attempt to apply it.
- ✅ **Main Purposes:**
  - **Syntax Checking:** Ensures the configuration syntax is correct.
  - **Consistency:** Checks for missing arguments, invalid resource attributes, or misconfigured modules.
  - **Quick Feedback:** Identifies errors early without contacting external APIs or services.
- when we define a variable and forgot to use it, or when define a resource with wrong resource type or wrong attributes.
  ```bash
  Success! The configuration is valid.
  ```
  ```bash
  Error: Missing required argument
  
    on main.tf line 2, in resource "aws_instance" "example":
     2: resource "aws_instance" "example" {
  
  The argument "instance_type" is required, but no definition was found.
  ```

---

<a name="q15"></a>
### 14.Have you ever heard about the lifecycle in Terraform? Can you talk more about it?

- Yes, **Terraform** provides a feature called **lifecycle**.
- 🚩 When to Use **Terraform Lifecycle:**
  - Managing critical infrastructure (prevent accidental deletions).
  - Zero-downtime deployments (create resources before destroying old ones).
  - Allowing external changes without conflicts (ignore specific changes).
- **Terraform**’s **lifecycle** management lets you control resource behavior:
  
  | Attribute                 | Purpose                                                           |
  |---------------------------|-------------------------------------------------------------------|
  | **create_before_destroy** | Avoids downtime when recreating resources                         |
  | **prevent_destroy**       | Protects critical resources                                       |
  | **ignore_changes**        | Ignores specified external changes                                |
  | **replace_triggered_by**  | Triggers replacement based on conditions                          |
  
- Ex:
  ```hcl
  resource "aws_s3_bucket" "critical_bucket" {
    bucket = "my-critical-data-bucket"
  
    lifecycle {
      prevent_destroy = true
    }
  }
  ```
- **Terraform** won't let this bucket be destroyed until you explicitly remove this setting. Protects critical resources from accidental deletion and forces **Terraform** to throw an error if deletion is attempted.
- This provides fine-grained control over resource **lifecycle** and improves infrastructure stability.

---

<a name="q16"></a>
### 15.If you had to choose between Ansible and Terraform, which one would you prefer and why?

- **Terraform** and **Ansible** are powerful tools, each excelling in different areas:
  - **Terraform** is specialized in **infrastructure provisioning**—it creates, manages, and orchestrates cloud resources (servers, networking, databases).
  - **Ansible** is primarily a **configuration management** tool—it configures and manages existing infrastructure by installing software, updating configurations, or deploying applications.
- ⚡ Combined Approach (**Terraform** + **Ansible**)
  - **Terraform** to provision infrastructure (servers, networking, storage).
  - **Ansible** to configure those resources after **Terraform** provisions them (install software, configure settings, application deployment).

---

<a name="q17"></a>
### 16. In your current organization, which tool are you using: Ansible, Terraform, or Pulumi?

- **Terraform**:
  - Used extensively for provisioning cloud resources (**AWS EC2**, **RDS**, **S3**, **VPCs**, **EKS** clusters, **OpenSearch**, etc.).
- **Ansible**:
  - Occasionally used for configuration management or deployments, but the primary **infrastructure provisioning** is handled by **Terraform**.

---

<a name="q18"></a>
### 17. In a scenario where you have 20 resources running on a public cloud (AWS or Azure) and you want to destroy just one resource, how would you go about doing that?

- Using **terraform destroy** with the **-target** flag (Recommended for quick, one-time deletion).
- The **-target** parameter tells **Terraform** to destroy only the specified resource.
- Example:
  ```bash
  terraform destroy -target aws_instance.example_instance
  ```

---

<a name="q19"></a>
### 18.Have you ever preserved a key that you created using Terraform?

- Yes, preserving keys generated by **Terraform** is common.
- Secure storage is typically achieved via:
  - **local_file** resource for local storage (temporary use).
  - **Secrets Manager**, **Parameter Store**, or **Vault** for secure, long-term management.

---

<a name="q20"></a>
### 19.What happens if you delete the Terraform state file and then run the `terraform apply` or `terraform plan` command?

- **Terraform** loses track of all resources previously created or managed.
- **Terraform** thinks no resources exist, so it attempts to recreate everything from scratch.
- 🚨 **Consequences:**
  - **Resource Duplication:** **Terraform** tries to recreate existing resources, leading to conflicts (e.g., naming collisions, errors).
  - **Potential Downtime:** Critical resources might be accidentally recreated or replaced.
  - **Infrastructure Drift:** The actual infrastructure is out-of-sync with **Terraform**'s view, causing management confusion.
- 🚨 **How to Resolve:**
  - If you delete or lose your **state file**, you must manually re-import existing resources using **terraform import**.
- 🚨 **Best Practice:**
  - Always store your **Terraform state** remotely (e.g., **AWS S3 backend**).
  - Enable **versioning** on your remote **state** storage.
  - Regularly back up your **Terraform state** to prevent accidental deletion or corruption.
  - Use **state locking** (e.g., **DynamoDB** table) to avoid concurrent modification issues.

---

<a name="q21"></a>
### 20.Have you ever worked with modules in Terraform? What are the different types of modules in Terraform?

- ✅ 1. **Root Module** - where the developer creates all **tf files** to let the users use his module.
  - The main configuration that you execute directly using **Terraform** commands.
  - Contains your provider definitions, backend configurations, and typically references other modules.
- ✅ 2. **Child Modules (Local Modules)** - root and child are in the same repo; we can use the root module using child modules by specifying the **source**.
  - Modules that are stored within your project in a local directory.
  - Designed for reusability within the same project or multiple projects.

---

<a name="q22"></a>
### 21.The module that gets called is what: a parent module or a child module?

- The module that gets called is always a **child module**.

---

<a name="q23"></a>
### 22.From where we call a module, what is that module called?

- The module from where you call another module is known as the **parent module** or **root module**.

---

<a name="q24"></a>
### 24.Have you ever heard about remote backends in Terraform? Do you have any ideas or experience with them?

- **Remote backends** in **Terraform**:
  - Keep your **state files** secure and centralized.
  - Allow collaboration across teams and automation tools.
  - Enhance infrastructure management through built-in **locking**, **versioning**, and backup features.
- Using **remote backends** like **AWS S3** is considered best practice for managing **Terraform state**.

---

<a name="q25"></a>
### 25.How can you provide variable values at runtime in Terraform?

- ✅ 1. Using command-line (**-var** flag):
  ```bash
  terraform apply -var="instance_type=t2.micro" -var="region=us-west-2"
  ```
- ✅ 2. Using a **variable file** (`.tfvars` file): **Terraform** automatically loads values from `terraform.tfvars`.
  - You can also specify a custom file:
    ```bash
    terraform apply -var-file="dev.tfvars"
    ```
- ✅ 3. **Environment Variables** (using **TF_VAR_** prefix):
  ```bash
  export TF_VAR_instance_type="t2.micro"
  export TF_VAR_region="us-west-2"
  ```
- **Terraform** automatically picks these variables at runtime.
- 🚩 **Best Practice:**
  - Use **.tfvars files** for environment-specific values.
  - Use CLI (**-var**) for temporary overrides.
  - Use **environment variables** for automation pipelines or secrets management.

---

<a name="q26"></a>
### 26.In an organization, how do you manage multiple environments in Terraform?

- ✅ 1. Using Separate **.tfvars Files** – `dev.tfvars`, `staging.tfvars`
- ✅ 2. **Workspaces** (**Terraform** Built-in Feature)
  - **Terraform workspaces** allow multiple **state files** to be managed in isolation.
  - Example:
    ```bash
    terraform workspace new dev
    terraform workspace new staging
    terraform workspace new prod

    terraform workspace select staging
    ```
- ✅ 3. Using Separate **Directories** (Folder-based Approach)
  - Example directory structure:
    ```
    terraform-infra/
    ├── environments/
    │   ├── dev/
    │   │   ├── main.tf
    │   │   └── variables.tfvars
    │   ├── staging/
    │   │   ├── main.tf
    │   │   └── variables.tfvars
    │   └── prod/
    │       ├── main.tf
    │       └── variables.tfvars
    └── modules/
        └── ec2/
    ```
  - Each environment has its own **state file** and configuration.

---

<a name="q27"></a>
### 27.Why do we call Terraform "Infrastructure as Code" (IaC)? Is there a particular reason for this?

- **Terraform** enables infrastructure management through code, which provides **automation**, **consistency**, and **scalability**. Instead of manual provisioning, you write code describing infrastructure, thus following the principles of **Infrastructure as Code (IaC)**.

---

<a name="q28"></a>
### 28.Can you explain some drawbacks or challenges you have faced in your career?

- 🚩 **Major Drawbacks and Solutions:**
  
  | Drawback                              | Solution/Best Practice                                |
  |---------------------------------------|-------------------------------------------------------|
  | **State file complexity**             | Remote backends, versioning, backups                  |
  | **Sensitive data management**         | **Secrets Manager**, **Vault**                        |
  | **Infrastructure drift**              | Regular state reconciliation (**terraform plan**)     |
  | **Versioning challenges**             | Explicit version pinning, staged upgrades             |
  | **Complexity of large infrastructure**| Modularization, directory organization              |
  | **Debugging difficulty**              | Incremental changes, clarity in code structure        |
  | **Performance issues with large states** | Split states, smaller infrastructure units         |
- Recognizing these challenges early and applying best practices mitigates most risks, making **Terraform** a powerful tool in managing infrastructure as code.

---

<a name="q29"></a>
### 29.Which version of Terraform are you using?

- 1.10

---

<a name="q30"></a>
### 30.𝐖𝐡𝐚𝐭 𝐡𝐚𝐩𝐩𝐞𝐧𝐬 𝐢𝐟 𝐲𝐨𝐮𝐫 𝐬𝐭𝐚𝐭𝐞 𝐟𝐢𝐥𝐞 𝐢𝐬 𝐚𝐜𝐜𝐢𝐝𝐞𝐧𝐭𝐚𝐥𝐥𝐲 𝐝𝐞𝐥𝐞𝐭𝐞𝐝?

- **Terraform** loses track of existing resources. On the next **apply**, it may try to recreate everything from scratch, leading to conflicts with already existing infrastructure.

---

<a name="q31"></a>
### 31.What happens if multiple team members run terraform apply at the same time?

- If **state locking** is not enabled, the **state file** can get corrupted, causing inconsistent infrastructure. Usually, one **apply** succeeds while others fail.

---

<a name="q32"></a>
### 32.What happens if a resource fails halfway through terraform apply?

- **Terraform** keeps successfully created resources but marks the failed ones as incomplete. The next **apply** will try to recreate only the failed resources.
- Run **terraform apply** again:
  - **Terraform** will pick up from where it left off.
  - It won't re-create successfully provisioned resources unless explicitly changed.

---

<a name="q33"></a>
### 32.What happens when AWS API rate limits are hit during a large terraform apply?

- **Terraform** retries a few times, but if the limit persists, the **apply** fails. Previously created resources remain, causing a partial deployment.
- When **Terraform** hits **AWS API rate limits** during a large **terraform apply**, you'll typically see errors
  ```bash
  Error: Error creating resource: Throttling: Rate exceeded
  
  Request limit exceeded.
  ```
- **How to Mitigate AWS API Throttling:**
  - ✅ 1. Reduce **Terraform Parallelism**  
    - Default parallelism is 10; reducing it lowers request rate:
      ```bash
      terraform apply -parallelism=5
      ```
  - ✅ 2. Apply Changes in Smaller Batches  
    - Break your configuration into smaller chunks and apply them sequentially.
  - ✅ 3. Request Increased Limits from **AWS**  
    - Open a support case with **AWS** to increase API rate limits for affected services.
  - ✅ 4. Retry Failed Operations  
    - After an error, you can safely run **terraform apply** again, and **Terraform** picks up from where it left off, retrying previously failed actions.
  - ✅ 5. Exponential Backoff (Built-in)  
    - **Terraform** automatically waits longer between retries. Just waiting briefly before reapplying can often resolve issues.

---

<a name="q34"></a>
### 5.What happens if terraform plan shows no changes but infrastructure was modified outside Terraform?

- this is called **infrastructure drift**.
- **How to detect and handle drift:**
  - ✅ 1. **Terraform Refresh** (Built-in Solution)  
    - Forces **Terraform** to query the cloud provider and synchronize the **state file** with the actual infrastructure.
      ```bash
      terraform refresh
      
      Then re-run:
      
      terraform plan
      ```
    - **Terraform** now correctly identifies external changes.
  - ✅ 2. Run **terraform plan -refresh=true**  
    - **Terraform** automatically performs a refresh by default (**-refresh=true** is default behavior).
      ```bash
      terraform plan -refresh=true
      ```
    - ensures **Terraform** syncs the **state file** with your infrastructure before planning.
  - ✅ 3. Drift Detection Tools (Advanced)  
    - Consider tools designed specifically for drift detection, such as:
      - **Terraform Cloud/Enterprise** built-in drift detection.
      - Third-party tools like **DriftCTL** or **Terraformer**.
- **Best Practice to Prevent Drift:**
  - Only make changes through **Terraform**: Discourage manual modifications.
  - Periodic drift detection: Schedule regular **terraform refresh** or use automated drift detection tools.

---

<a name="q35"></a>
### 33.What happens if you delete a resource from your Terraform configuration?

- Removing resources from **Terraform** configuration → **Terraform** will destroy those resources.
- Always review **terraform plan** output carefully.
- Protect critical resources using **lifecycle** rules or careful reviews. ex: prevent deletion with `lifecycle { prevent_destroy = true }`.

---

<a name="q36"></a>
### 34.What happens if a provider API changes between Terraform versions?

- **Terraform** may break due to compatibility issues, requiring configuration updates or resource recreation to match the new **API**.
- **What Exactly Happens:**
  - **Breaking changes:**
    - Newer provider versions may alter, remove, or rename resource attributes, causing your existing **Terraform** configuration to fail or behave unexpectedly.
  - **Compatibility issues:**
    - **API** updates may introduce incompatible configurations, leading to errors or unexpected resource behavior.
  - **Deprecation warnings/errors:**
    - **Terraform** might display warnings or outright errors if you're using deprecated or removed attributes/resources.
- Proper **version management**, careful reviews, and incremental upgrades reduce the risk of **provider API** changes causing significant disruption to your infrastructure.

---

<a name="q37"></a>
### 35.What happens if you have circular dependencies in Terraform modules?

- **Terraform** does not support **circular dependencies** between resources or modules.
- If **Terraform** detects a **circular dependency**, it will immediately throw an error and refuse to execute.
  ```bash
  Error: Cycle: module.a depends on module.b, module.b depends on module.a
  ```
- **How to Handle Circular Dependencies:**
  - ✅ 1. Break the Dependency  
    - Reconsider your design to eliminate **circular references**.
    - Clearly define a linear dependency graph.
  - ✅ 2. Use **Data Sources**  
    - Reference existing resources using **data sources** instead of modules referencing each other directly.

---

<a name="q38"></a>
### 36.What happens if you exceed AWS service quotas during deployment?

- If you exceed **AWS service quotas** (limits) during a **Terraform** deployment, your deployment will fail, **Terraform** stops at that resource, and you see errors
  ```bash
  Error: Error creating resource: LimitExceeded: You have requested more instances (XX) than your current limit of YY allows.
  
  or
  Error: Service Quota Exceeded: The quota for XYZ has been exceeded.
  ```
- **How to Resolve Service Quota Exceedance:**
  - ✅ 1. Request **AWS Service Quota Increase** (Recommended)
  - ✅ 2. Reduce Resource Usage
  - ✅ 3. Split Deployments

---

<a name="q39"></a>
### 37.What happens if you lose access to the remote backend storing your state?

- if you lose access to the **remote backend** you will see below errors when we do **plan**
  ```bash
  Error loading state: AccessDenied: Access Denied
  status code: 403, request id: XYZ
  
  Error: Failed to load state: Unable to retrieve remote state
  ```
- Immediately notify team, restore **backend** access, use backups, ensure **IAM** permissions.

---

<a name="q40"></a>
### 39.what is major difeerences between terraform and cloud formation?

- Quick Summary Table of Major Differences:
  
  | Feature             | **Terraform**                                 | **AWS CloudFormation**                    |
  |---------------------|-----------------------------------------------|-------------------------------------------|
  | Platform Support    | ✅ Multi-cloud & hybrid                       | 🔸 **AWS Only**                           |
  | Language & Syntax   | ✅ **HCL** (Declarative, easy-to-read)         | 🔸 **JSON/YAML**                          |
  | State Management    | ✅ Explicit **State files**                   | 🔸 Managed by **AWS**                      |
  | Modularity          | ✅ **Modules**, Registry, highly modular       | 🔸 Nested stacks, less intuitive          |
  | Drift Detection     | 🔸 Manual/explicit                             | ✅ Built-in, automatic                    |
  | Rollbacks           | 🔸 Manual (explicit)                           | ✅ Automatic built-in                     |
  | Community Support   | ✅ Large, Open-source                           | 🔸 Smaller, **AWS-managed**                |
  
- When to choose each tool:
  - **Terraform:**
    - Ideal for **multi-cloud** or **hybrid cloud** setups.
    - Preferred by teams wanting flexibility and open-source ecosystems.
  - **CloudFormation:**
    - Great if you're exclusively on **AWS** and prefer native integration.
    - Good for teams already invested heavily in the **AWS** ecosystem and tooling.
- Both are powerful, but **Terraform** offers greater flexibility and broader use-cases across multiple platforms. **CloudFormation** integrates deeply and naturally within **AWS** infrastructure.

---

<a name="q41"></a>
### 40.whenever we have access keys and passwords, how would you manage them?

- we store them in **Secrets Manager** or **AWS Parameter Store** and using a **data source** we can retrieve the sensitive information.
- 1. Never Hardcode **Secrets**
- 2. Use **AWS Secrets Manager** or **AWS Parameter Store** (recommended for **AWS**) to store your sensitive credentials.
- 3. Inject sensitive credentials at runtime using **environment variables** (**TF_VAR_**).

---

<a name="q42"></a>
### 41.Have you ever used Data sources to retrieve sensitive information from any external system?

- Yes, I've frequently used **Terraform data sources** to securely retrieve sensitive information.
- Example :
  ```hcl
  data "aws_secretsmanager_secret_version" "db_credentials" {
    secret_id = "prod-db-credentials"
  }
  
  resource "aws_db_instance" "example" {
    username = jsondecode(data.aws_secretsmanager_secret_version.db_credentials.secret_string)["username"]
    password = jsondecode(data.aws_secretsmanager_secret_version.db_credentials.secret_string)["password"]
    # other configurations...
  }
  ```

---

<a name="q43"></a>
### 41.What are outputs in terraform?

- To display critical infrastructure information after **Terraform** applied and also we can pass this **output** of one resource wherever we required.

---

<a name="q44"></a>
### 42.What are Locals in terraform?

- **Locals** are like **variables** in some aspects. 
- We can set key, value and use it wherever we want.
- It has extra capabilities unlike **variables**; we can assign **expressions** and functions to **locals** and refer wherever required. 
- **Variable values** can be overridden through **tfvars** and command line, but **local values** can't be overridden.
- **locals** and **variables** are same we can use them for variabilisation,
- but **locals** can hold **expressions** and we can use them wherever we want where **variables** can only hold key-value pairs.
- We can also use **variables** inside **locals** but we cannot use **variable/local** inside variables.tf

---

<a name="q45"></a>
### 43.What is count and count.index?

- **Count** is used to create multiple instances of a resource.
- **count.index** is used to refer the index from 0, 
  ```hcl
  resource "aws_instance" "example" {
    count         = 3
    ami           = "ami-0123456789abcdef0"
    instance_type = "t2.micro"
  }
  -----
  variable "instance_name"{
    type = list
    default = ["db", "backend", "frontend"]
  }
  
  #count = 3
  count = lenght(var.instance_name)
  Name = var.instance_name[count.index]
  ```

---

<a name="q46"></a>
### 44.what are provisioners in terraform?

- **Provisioners** in **Terraform** allow you to execute scripts or commands on local or remote machines during the creation, updating, or destruction of infrastructure resources. They’re typically used for initializing servers, configuring software, or running specific tasks after a resource is provisioned.
- ✅ 1. **local-exec**
  ```hcl
  resource "null_resource" "run_script" {
    provisioner "local-exec" {
      command = "echo 'Hello, Terraform!' > output.txt"
    }
  }
  ```
- ✅ 2. **remote-exec**  
  Executes scripts or commands on remote resources using **SSH** or **WinRM**.
  ```hcl
  resource "aws_instance" "web_server" {
    ami                    = "ami-0123456789abcdef0"
    instance_type          = "t2.micro"
    key_name               = "your-key"
    vpc_security_group_ids = ["sg-12345678"]
  
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/your-private-key.pem")
      host        = self.public_ip
    }
  
    provisioner "remote-exec" {
      inline = [
        "sudo yum install -y httpd",
        "sudo systemctl start httpd"
      ]
    }
  }
  ```

---

<a name="q47"></a>
### 45.What are functions in terraform and name a few functions you used?

- **Functions** are to do a unit of work; they can accept inputs and provide the output for us. We have many types of functions like numeric, string, file, and network functions in **Terraform**. I frequently use:
  - **File function** to read the content
  - **Split function** to split the value based on the separator.
  - **Slice function** to get a part from a list.
  - **Element function** to find out a particular index element.
  - **Lenath function** to know the size of a list
  - **Lookup function** to find the value of a key in a map.
  - **Join function**

---

<a name="q48"></a>
### 46.how does terraform manage updates to the existing resources?

- **Terraform** manages updates to existing resources by following a clear and predictable **lifecycle**. It compares the desired state (in your **Terraform** configuration) against the current state (stored in **terraform.tfstate**) to determine necessary changes.

---

<a name="q49"></a>
### 47.How can you roll back to a previous Terraform state version?

- ✅ Step 1: Identify Previous **State Version**
- ✅ Step 2: Download the Previous **State File**
  ```bash
  aws s3api get-object --bucket my-state-bucket \
  --key path/to/terraform.tfstate \
  --version-id <previous_version_id> \
  terraform.tfstate
  ```
- ✅ Step 3: Replace the Current **State**
  - Replace the existing **state file** in the backend with your downloaded version.
  - **Remote Backend** (e.g., **AWS S3**):
    - Re-upload the previous **state file** back to the remote backend, overwriting current state.
      ```bash
      aws s3 cp terraform.tfstate s3://my-state-bucket/path/to/terraform.tfstate
      ```
- ✅ Step 4: Verify the Restored **State**
  ```bash
  terraform refresh
  terraform plan
  ```
- ✅ Step 5: Reapply to Reconcile Infrastructure

---

<a name="q50"></a>
### 48.how do you use conditions in terraform?

- In **Terraform**, **conditions** are handled using **conditional expressions** rather than traditional if/else statements.
- You can set a value based on a condition with the syntax:
  ```hcl
  instance_type = var.use_large_instance ? "m5.large" : "t2.micro"
  ```
- **Conditional Resource Creation** with **Count:**
  - You can conditionally create resources by setting the **count** parameter
    ```hcl
    resource "aws_instance" "example" {
      count         = var.create_instance ? 1 : 0
      ami           = var.ami_id
      instance_type = "t2.micro"
    }
    ```
- **Dynamic blocks:**
  - When dealing with nested blocks, you can use **dynamic blocks** to include or exclude parts of the configuration based on **conditions**. For example:
    ```hcl
    resource "aws_security_group" "example" {
      name = "example_sg"
    
      dynamic "ingress" {
        for_each = var.enable_ingress ? [1] : []
        content {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
    ```
- **Local Values:**
  - You can also use **conditional expressions** in **locals** to compute values used throughout your configuration:
    ```hcl
    locals {
      instance_count = var.enable_instances ? 3 : 0
    }
    ```
---
