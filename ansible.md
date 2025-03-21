# Ansible Interview Notes

## Table of Contents

1. [what is configuration management?](#q1)
2. [why do you think ansible is better than other Configuration Management tools?](#q2)
3. [Can you write an Ansible playbook to install httpd service and get it running?](#q3)
4. [how ansible helped your organization?](#q4)
5. [What is dynamic inventory?](#q5)
6. [What is Ansible Tower? have you used it? if yes, why?](#q6)
7. [what is ansible galaxy command and what it is used for ?](#q7)
8. [Can you explain me the structure of Ansible playbook using roles?](#q8)
9. [what are handlers in ansible? why are they used?](#q9)
10. [I would like to run a specific set of tasks only on windows vms not Linux vms? is it possible?](#q10)
11. [Does ansible supports parallel execution of tasks?](#q11)
12. [what is the protocol that ansible use to connect to windows vms?](#q12)
13. [How do you define varibles in Ansible?](#q13)
14. [what is the difference between command and shell module in Ansible?](#q14)
15. [How do handle secrets in Ansible?](#q15)
16. [what do you think ansible can improve?](#q16)
17. [Can you talk about a ansible playbook that your wrote and how it helped your compnay?](#q17)
18. [what is module in ansible?](#q18)
19. [why do we need Adhoc commands and tell me some widely used?](#q19)
20. [how do you handle errors or exceptions in ansible playbook?](#q20)
21. [how do we use ansible facts?](#q21)
22. [how do you handle sensitve information in ansible?](#q22)
23. [how do you manage order of execution when you have multiple taks in a playbook?](#q23)
24. [consider a scenario where you have multiple files with you and you want to copy all those files a target host and this has to be happen recursively, how would you do it?](#q24)
25. [how do you use ansible to create encrypted files?](#q25)
26. [what is the difference between play and playbook?](#q26)
27. [what are the benefit of Ansible blocks, rescue, and always ?](#q27)
28. [tell me about Jinja2 templates?](#q28)

---

<a name="q1"></a>
### 1. what is configuration management?

**Answer:**  
- **Configuration Management** automates the process of installing software, managing system packages, and setting up systems, so you can easily control and update many computers in a consistent way.

---

<a name="q2"></a>
### 2. why do you think ansible is better than other Configuration Management tools?

**Answer:**  
- It is written in **Python** and uses **YAML**–based files that are easy to read and write.  
- It is **agentless** and backed up with a good community. It follows a push-based architecture.
- **Many people prefer Ansible** for several reasons, especially when compared to other **configuration management** tools:
  - **Agentless Architecture:** **Ansible** operates over SSH without needing agents installed on each machine, which simplifies setup and maintenance.
  - **Simple, Readable Syntax:** It uses **YAML** for its **playbooks**, making it straightforward to write and understand—even for beginners.
  - **Idempotence:** **Ansible** ensures that running the same **playbook** multiple times won’t change the system beyond what’s intended, which helps keep configurations consistent.
  - **Ease of Setup:** With minimal prerequisites and simple installation, you can quickly get started managing your systems.
  - **Strong Community and Ecosystem:** A large and active community means a wealth of modules, plugins, and support, which can speed up troubleshooting and development.

---

<a name="q3"></a>
### 3. Can you write an Ansible playbook to install httpd service and get it running?

**Answer:**  
Below is an example of an **Ansible playbook** that installs the **httpd** service (commonly used on RHEL/CentOS systems) and ensures it is running and enabled:

```yaml
---
- name: Install and start httpd service
  hosts: all
  become: true

  tasks:
    - name: Install httpd package
      yum:
        name: httpd
        state: present

    - name: Start and enable httpd service
      service:
        name: httpd
        state: started
        enabled: yes
```

---

<a name="q4"></a>
### 4. how ansible helped your organization?

**Answer:**  
- Previously, we were using **shell scripts** for manual tasks to connect to the VMs and make the required changes.
- Once we adopted **Ansible**, we reduced the time needed for these tasks.
- **Ansible** was very effective and increased our productivity.
- **Detailed Explanation:**  
  - Before using **Ansible**, we relied on **shell scripts** to manually connect to each VM and make the necessary changes. This process was not only time-consuming but also prone to errors.
  - Since adopting **Ansible**, we've automated these tasks using **playbooks**, which has drastically reduced execution time and minimized manual intervention.
  - This shift has significantly boosted our productivity, allowing the team to focus on more strategic projects instead of repetitive maintenance work.

---

<a name="q5"></a>
### 5. What is dynamic inventory?

**Answer:**  
- **Ansible dynamic inventory** is a method for automatically retrieving host information from external sources rather than using a static inventory file.
- This is especially useful in environments where servers are frequently added or removed—such as in **cloud deployments**.
- Instead of manually updating a list, **Ansible** uses a script or plugin to query services like **AWS**, **Azure**, or others, pulling the current list of hosts in real-time.
- This helps ensure your automation tasks always run on the correct, up-to-date set of machines.

---

<a name="q6"></a>
### 6. What is Ansible Tower? have you used it? if yes, why?

**Answer:**  
- **Ansible Tower** is a web-based interface and REST API built on top of **Ansible** that makes managing automation easier for teams.
- It provides a single dashboard to monitor, schedule, and manage all your **Ansible** jobs.
- It securely assigns permissions, ensuring the right team members have the appropriate access using **RBAC**.
- If not using it, you can simply state that you are working on the **Ansible CLI** and using only the open-source version of **Ansible**.

---

<a name="q7"></a>
### 7. what is ansible galaxy command and what it is used for ?

**Answer:**  
- The **ansible-galaxy** command is a tool that helps you manage and share reusable **Ansible** content, such as roles and collections.
- **Here’s what it does:**
  - **Install Roles and Collections:** You can download and install pre-built roles and collections from the **Ansible Galaxy** repository (or other sources), which speeds up your development process.
  - **Create New Roles:** It provides a structure for creating new roles, helping standardize how automation tasks are organized.
  - **Share Content:** You can package your own roles and collections to share with the community or within your organization.
- In essence, the **ansible-galaxy** command makes it easier to reuse, distribute, and manage automation content, helping you build and maintain your infrastructure more efficiently.

---

<a name="q8"></a>
### 8. Can you explain me the structure of Ansible playbook using roles?

**Answer:**  
- **Roles** help reuse code and follow the **DRY** principle.
- They provide a proper structure for creating and organizing files, tasks, variables, and other resources needed for configuration.
- **Example Directory Structure:**
  ```
  roles/
  └── myrole/
      ├── tasks/
      │   └── main.yml       # Contains the list of tasks for the role.
      ├── handlers/
      │   └── main.yml       # Defines handlers (tasks that run on notifications).
      ├── defaults/
      │   └── main.yml       # Sets default variables that can be overridden.
      ├── vars/
      │   └── main.yml       # Contains variables specific to the role.
      ├── templates/
      │   └── example.j2     # Holds Jinja2 templates.
      ├── files/
      │   └── somefile.conf  # Static files to be copied to the target.
      └── meta/
          └── main.yml       # Defines role dependencies and metadata.
  ```
- In your main **playbook**, you simply reference the roles you want to apply. For example:
  ```yaml
  - name: Configure servers using roles
    hosts: all
    become: true

    roles:
      - myrole
      - another_role
  ```

---

<a name="q9"></a>
### 9. what are handlers in ansible? why are they used?

**Answer:**  
- **Handlers** in **Ansible** are special tasks that run only when they're "notified" by other tasks.
- A task can notify a handler when it makes a change (e.g., updating a config file).
- **Example:**  
  - Suppose a configuration file is copied or changed on the target machine. If the file changes, it notifies a handler that restarts a service.
  ```yaml
  tasks:
    - name: Copy the configuration file
      copy:
        src: myconfig.conf
        dest: /etc/myconfig.conf
      notify: Restart my service
      
  handlers:
    - name: Restart my service
      service:
        name: myservice
        state: restarted
  ```

---

<a name="q10"></a>
### 10. I would like to run a specific set of tasks only on windows vms not Linux vms? is it possible?

**Answer:**  
- Yes, it's definitely possible.
- You can either target **Windows hosts** by grouping them in your inventory or use conditionals (e.g., `ansible_os_family`) within your tasks to ensure they only run on **Windows VMs**.
  ```yaml
  when: ansible_os_family == "Windows"
  ```
  And in your inventory:
  ```
  [windows]
  win_vm1.example.com
  win_vm2.example.com
  ```

---

<a name="q11"></a>
### 11. Does ansible supports parallel execution of tasks?

**Answer:**  
- **Ansible** supports parallel execution of tasks.
- By default, when you run a **playbook**, tasks are executed concurrently across all targeted hosts.
- You can control the level of parallelism using the `forks` parameter, which specifies how many hosts are managed in parallel.
  - **Example:**
    ```bash
    ansible-playbook -f 10 my_playbook.yml
    ```
    This command allows **Ansible** to run tasks on 10 hosts simultaneously.
- Additionally, you can use asynchronous tasks with the `async` and `poll` parameters to run long-running tasks in the background on individual hosts.

---

<a name="q12"></a>
### 12. what is the protocol that ansible use to connect to windows vms?

**Answer:**  
- For **Windows**, **Ansible** uses **WinRM**.
- For **Linux**, it uses **SSH**.

---

<a name="q13"></a>
### 13. How do you define varibles in Ansible?

**Answer:**  
- **Ansible** allows you to define variables in multiple ways:
  - **Directly in a Playbook:**
    ```yaml
    ---
    vars:  # variable declaration
        Course: "Terraform"
        Trainer: "Siva"
        Duration: "15hrs"
    ```
  - **Using Variable Files:**
    ```yaml
    ---
    vars_files:
      - vars.yml
    ```
  - **Using vars_prompt:**
    ```yaml
    ---
    vars_prompt:
      - name: USERNAME
        prompt: Please enter your username
        private: false
      - name: PASSWORD
        prompt: Please enter your password
        private: true
    ```
  - **In the Inventory:**
    ```
    [localhost:vars]
    Course="DevOps with AWS"
    Trainer="Sivakumar"
    Duration="120hrs"
    WISHES="Morning from inventory"
    ```
  - **Using Task Arguments:**
    ```yaml
    - name: variables from arguments
      hosts: localhost
      tasks:
      - name: get from args
        ansible.builtin.debug:
          msg: "Hello {{PERSON}}, Good {{WISHES}}"
    ```
  - **List and Map Examples:**
    ```yaml
    vars:
      Course: DevOps with AWS  # string
      Tools:                   # list
        - Linux
        - Shell
        - Ansible
      Experience:              # map or dictionary
        DevOps: 3            # number
        AWS: 2
        Docker: 1
      RealProject: true        # boolean
    ```
- **Order of Preference:**
  1. Arguments
  2. Task level
  3. Variable files
  4. Prompt
  5. Play level
  6. Inventory
  7. Role level

---

<a name="q14"></a>
### 14. what is the difference between command and shell module in Ansible?

**Answer:**  
- The **command** module is used for simple commands that do not require shell variables, environment, or features like redirections and pipes.
- The **shell** module is used to run complex commands or scripts that require shell features.
- Whatever works in the **command** module will work in the **shell** module, but not vice versa.

---

<a name="q15"></a>
### 15. How do handle secrets in Ansible?

**Answer:**  
- **Ansible** handles secrets primarily through a built-in feature called **Ansible Vault**.
- With **Ansible Vault**, you can encrypt files or variables that contain sensitive information (such as passwords, API keys, and private keys).
- You can easily create, edit, and view encrypted files using commands like:
  - `ansible-vault create`
  - `ansible-vault edit`
  - `ansible-vault view`
- When running **playbooks**, you provide the vault password either interactively or through a password file.
- Besides **Vault**, **Ansible** can integrate with external secrets management solutions (like **HashiCorp Vault**) for more dynamic or centralized secrets management.

---

<a name="q16"></a>
### 16. what do you think ansible can improve?

**Answer:**  
- It doesn’t increase the verbosity for debug on the task basis.
- **Windows support** can be improved.
- **Ansible IDE** plugins could offer auto-check, auto-correct, or suggestions (like linting and indentation).
- Although plugins are available, they are not up to the mark.

---

<a name="q17"></a>
### 17. Can you talk about a ansible playbook that your wrote and how it helped your compnay?

**Answer:**  
- At my company, I developed an **Ansible playbook** that automated the setup and configuration of our web servers.
- **Before Ansible:**
  - We relied on manual **shell scripts** to install packages, update configurations, and restart services.
  - This process was time-consuming and prone to errors, especially when managing dozens of servers.
- **After Adopting Ansible:**
  - We automated these tasks using **playbooks**, drastically reducing execution time and minimizing manual intervention.
  - This shift significantly boosted our productivity, allowing the team to focus on more strategic projects instead of repetitive maintenance work.
  - For example, when a configuration file is changed, the playbook can notify a handler to restart the service automatically.

---

<a name="q18"></a>
### 17. what is module in ansible?

**Answer:**  
- An **Ansible module** is a small, reusable piece of code designed to perform a specific task, such as:
  - Installing software
  - Managing services
  - Copying files
  - Executing commands
- Some of the most widely used modules include:
  - `ansible.builtin.package`
  - `ansible.builtin.service`
  - `ansible.builtin.debug` – to print a message (e.g., `msg: "Hi,"`)
  - `ansible.builtin.command` – for simple commands
  - `ansible.builtin.shell` – for complex shell commands (like those with redirections)
  - `ansible.builtin.dnf`
  - `ansible.builtin.user`  
    Example:
    ```yaml
    - name: create expense user
      ansible.builtin.user:
        name: expense
    ```
  - `ansible.builtin.file`  
    Example:
    ```yaml
    - name: create app directory
      ansible.builtin.file:
        path: /app
        state: directory
    ```
  - `ansible.builtin.get_url`  
    Example:
    ```yaml
    - name: download backend code
      ansible.builtin.get_url:
        url: https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
        dest: /tmp/backend.zip
    ```
  - `ansible.builtin.unarchive`  
    Example:
    ```yaml
    - name: unzip backend code
      ansible.builtin.unarchive:
        src: /tmp/backend.zip  # by default checks in ansible server
        dest: /app
        remote_src: yes
    ```
  - `ansible.builtin.copy`  
    Example:
    ```yaml
    - name: copy backend service
      ansible.builtin.copy:
        src: backend.service
        dest: /etc/systemd/system/backend.service
    ```
  - `ansible.builtin.pip`  
    Example:
    ```yaml
    - name: install python mysql dependencies
      ansible.builtin.pip: 
        name:
          - PyMySQL  # to connect MySQL DB from Ansible
          - cryptography
        executable: pip3.9  # pip3.11 if python version is 3.11
    ```
  - `ansible.builtin.systemd_service`  
    Example:
    ```yaml
    - name: daemon reload
      ansible.builtin.systemd_service:
        daemon_reload: true
    ```
  - `ansible.builtin.service`  
    Example:
    ```yaml
    - name: start and enable backend service
      ansible.builtin.service:
        name: backend
        state: started
        enabled: yes
    ```
  - `ansible.builtin.service`  
    Example:
    ```yaml
    - name: restart nginx
      ansible.builtin.service:
        name: nginx
        state: restarted
    ```

---

<a name="q19"></a>
### 18. why do we need Adhoc commands and tell me some widely used?

**Answer:**  
- **Ad-hoc commands** are useful because they allow you to perform quick, one-off tasks on remote hosts without writing a full **playbook**. They help in:
  - **Immediate Troubleshooting:** Quickly checking connectivity (using the **ping** module) or system status.
  - **Rapid Changes:** Running a command to update packages, restart services, or execute scripts immediately.
  - **Simplifying Routine Tasks:** Instead of creating a playbook for small, infrequent changes, you can execute a one-liner.
- **Widely Used Ad-hoc Commands:**
  - **Ping Hosts:**  
    ```bash
    ansible all -m ping
    ```  
    (Verifies connectivity to all hosts.)
  - **Check System Uptime:**  
    ```bash
    ansible all -m shell -a "uptime"
    ```  
    (Retrieves the uptime for all hosts.)
  - **Restart a Service:**  
    ```bash
    ansible all -m service -a "name=httpd state=restarted"
    ```  
    (Restarts the **httpd** service on all target hosts.)
  - **Copy a File:**  
    ```bash
    ansible all -m copy -a "src=/path/to/local/file dest=/path/to/remote/file"
    ```  
    (Copies a file to remote hosts.)
  - **Install a Package:**  
    ```bash
    ansible all -m yum -a "name=nginx state=present"
    ```  
    (Installs a package, e.g., **nginx** on systems that use **yum**.)

---

<a name="q20"></a>
### 19. how do you handle errors or exceptions in ansible playbook?

**Answer:**  
- **Ansible** provides several mechanisms to handle errors and exceptions within **playbooks**. Here are the main techniques:
  1. **ignore_errors:**  
     - Allows a task to fail without stopping the **playbook**. Use this when a failure is acceptable.
     ```yaml
     - name: Run a task that might fail
       shell: /path/to/command
       ignore_errors: yes
     ```
  2. **failed_when:**  
     - Lets you define custom conditions to determine if a task should be considered a failure.
     ```yaml
     - name: Check service status
       shell: /usr/bin/check_service
       register: service_status
       failed_when: "'error' in service_status.stdout"
     ```
  3. **Registering Variables & Conditional Execution:**  
     - Capture task output using `register` and conditionally run other tasks based on that output.
     ```yaml
     - name: Get system information
       shell: uname -a
       register: sys_info

     - name: Print system info if command succeeded
       debug:
         msg: "System Info: {{ sys_info.stdout }}"
       when: sys_info.rc == 0
     ```
  4. **Block/Rescue/Always Blocks:**  
     - Group tasks and define alternate actions if any task fails.
     ```yaml
     - block:
         - name: Task that may fail
           shell: /path/to/some_command
         - name: Another dependent task
           shell: /path/to/another_command
       rescue:
         - name: Handle error
           debug:
             msg: "An error occurred. Running recovery steps."
       always:
         - name: Always run this task
           debug:
             msg: "This always runs regardless of success or failure."
     ```

---

<a name="q21"></a>
### 20. how do we use ansible facts?

**Answer:**  
- **Ansible facts** are data related to your remote systems, such as operating systems, IP addresses, and attached filesystems.
- You can access these facts via the `ansible_facts` variable.
- By default, some facts are available as top-level variables with the `ansible_` prefix.
- To see all available facts, add this task to a play:
  ```yaml
  - name: Print all available facts
    ansible.builtin.debug:
      var: ansible_facts
  ```
- To view the raw fact data, run at the command line:
  ```bash
  ansible <hostname> -m ansible.builtin.setup
  ```

---

<a name="q22"></a>
### 21. how do you handle sensitve information in ansible?

**Answer:**  
- Sensitive information in **Ansible** is primarily managed using **Ansible Vault**.
- **Ansible Vault** allows you to encrypt files or variables containing secrets.
- **Key Points:**
  - Encrypt sensitive data (passwords, API keys, etc.) using **Ansible Vault**.
  - Create, edit, and view encrypted files with commands like `ansible-vault create`, `ansible-vault edit`, and `ansible-vault view`.
  - When running **playbooks**, supply the vault password interactively or via a password file.
  - **Ansible** can also integrate with external secret managers like **HashiCorp Vault**.

---

<a name="q23"></a>
### 22. how do you manage order of execution when you have multiple taks in a playbook?

**Answer:**  
- **Ansible** executes tasks sequentially in the order they are written in a **playbook**, but you can fine-tune the order using:
  1. **Sequential Order:**  
     - Tasks run one after the other.
  2. **Pre-tasks and Post-tasks:**  
     - Use `pre_tasks` to run tasks before the main tasks and `post_tasks` for tasks after.
  3. **Task Blocks:**  
     - Group related tasks using `block`, `rescue`, and `always` for structured error handling.
  4. **Handlers:**  
     - Special tasks that run only when notified, and only once even if triggered multiple times.
  5. **Includes and Imports:**  
     - Break your playbook into separate files using `include_tasks` or `import_tasks` for modularity.
  6. **Serial:**  
     - The `serial` keyword controls how many hosts are processed concurrently, useful for rolling updates.
- **Example Playbook:**
  ```yaml
  - name: Sample Playbook with Ordered Execution
    hosts: all
    become: true
    serial: 2  # Only 2 hosts will be processed concurrently

    pre_tasks:
      - name: Pre-task: Gather initial info
        setup:

    tasks:
      - name: Task 1: Install a package
        yum:
          name: httpd
          state: present

      - name: Task 2: Update configuration
        template:
          src: httpd.conf.j2
          dest: /etc/httpd/conf/httpd.conf
        notify: Restart httpd

    post_tasks:
      - name: Post-task: Clean up temporary files
        file:
          path: /tmp/temp_file
          state: absent

    handlers:
      - name: Restart httpd
        service:
          name: httpd
          state: restarted
  ```
- **Summary:**
  - **Execution Order:** Follows the order in the playbook.
  - **Pre/Post-tasks:** Run before/after the main tasks.
  - **Blocks/Handlers:** Organize tasks and manage errors.
  - **Includes/Serial:** Provide modularity and control parallelism.

---

<a name="q24"></a>
### 23. consider a scenario where you have multiple files with you and you want to copy all those files a target host and this has to be happen recursively, how would you do it?

**Answer:**  
- You can copy multiple files and directories recursively using the built-in **copy** module by setting the `recursive` parameter to `yes`.

---

<a name="q25"></a>
### 24. how do you use ansible to create encrypted files?

**Answer:**  
- **Ansible** uses **Ansible Vault** to create and manage encrypted files. This is useful for protecting sensitive data such as passwords, API keys, or configuration secrets.
- **Steps:**
  - **Create an Encrypted File:**  
    ```bash
    ansible-vault create secrets.yml
    ```
    - Prompts for a vault password and opens an editor.
  - **Encrypt an Existing File:**  
    ```bash
    ansible-vault encrypt existing_file.yml
    ```
  - **Edit an Encrypted File:**  
    ```bash
    ansible-vault edit secrets.yml
    ```
  - **Decrypt a File (if needed):**  
    ```bash
    ansible-vault decrypt secrets.yml
    ```
  - **Using Encrypted Files in Playbooks:**  
    - Supply the vault password interactively or via a password file:
      ```bash
      ansible-playbook playbook.yml --ask-vault-pass
      ```

---

<a name="q26"></a>
### 25. what is the difference between play and playbook?

**Answer:**  
- A **play** is a single set of instructions that maps a group of hosts to specific tasks.
- A **playbook** is a YAML file that contains one or more plays.
- In other words, a **playbook** is the complete automation script that can include several plays, each targeting different host groups or performing different functions.

---

<a name="q27"></a>
### 26. what are the benefit of Ansible blocks, rescue, and always ?

**Answer:**  
- **Ansible blocks**, along with their **rescue** and **always** sections, provide a structured way to manage error handling and cleanup in your **playbooks**.
- **Benefits:**
  - **Grouping Related Tasks:**  
    - Blocks let you group related tasks together for better organization.
  - **Error Handling with Rescue:**  
    - If any task in a block fails, the rescue section runs alternative tasks to handle the error or recover gracefully.
  - **Guaranteed Execution with Always:**  
    - Tasks in the always section run regardless of whether an error occurred, useful for cleanup or final notifications.

---

<a name="q28"></a>
### 26. tell me about Jinja2 templates?

**Answer:**  
- **Jinja2** is a powerful templating engine integrated into **Ansible** that lets you create dynamic text files.
- **Jinja2 templates** are typically stored in the `templates/` directory within a role.
- **Example:**
  ```
  roles/backend/templates/backend.service.j2

  [Unit]
  Description = Backend Service

  [Service]
  User=expense
  Environment=DB_HOST="{{ DB_HOST }}"
  ExecStart=/bin/node /app/index.js
  SyslogIdentifier=backend

  [Install]
  WantedBy=multi-user.target
  ```
---
