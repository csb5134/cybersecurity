## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/csb5134/cybersecurity/blob/main/Diagrams/ELK.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml file may be used to install only certain pieces of it, such as Filebeat.

https://github.com/csb5134/cybersecurity/blob/main/Ansible/install-elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly avaialble, in addition to restricting access to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_
- Load balancers allow for high availability, as well as reducing server resource load. The advantage of a jump box is the ability to restrict access to your network. With a jump box, you don't have to expose all of your virtual machines to the public.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.
- _TODO: What does Filebeat watch for?_
	Changes to log files
- _TODO: What does Metricbeat record?_
	Tracks and collects system metrics

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name        | Function        | IP Address   | Operating System |
|-------------|-----------------|--------------|------------------|
| Jump Box    | Gateway         | 10.1.0.4     | Linux            |
| Red_team_LB | Load Balancer   | 20.39.40.108 |                  |
| Web-1       | DVWA Containers | 10.1.05      | Linux            |
| Web-2       | DVWA Containers | 10.1.0.6     | Linux            |
| ELK-Server  | Elk Server      | 10.0.0.4     | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 76.242.53.215

Machines within the network can only be accessed by the jump box.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_
The jump-box-provisioner VM. 10.1.0.4

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Available | Allowed IP Addresses |
|-------------|--------------------|----------------------|
| Jump Box    | No                 | 76.242.53.215        |
| Red_team_LB | Yes                | *                    |
| ELK-Server  | No                 | 76.242.53.215        |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_
	Easy to scale out virtual infrastructure. Each VM configured the same. Less prone to human error.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Install Docker
- Install Python3-pip
- Increase available virtual memory
- Download and launch Docker Elk container
- Enable Docker service at boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/csb5134/cybersecurity/blob/main/Diagrams/Docker_PS.JPG (Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
10.1.0.5
10.1.0.6

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
Filebeat
Metricsbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
Filebeat collects changes to log files, which can be used to monitor failed SSH attempts and privilege escalation attempts using system.auth
Metricbeats collects system metrics, which can help identify system load, rogue processes, and server availability. Metricbeat Docker ECS shows a dashboard overview of general health of the system environment, including CPU / memory usage, and network activity.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the https://github.com/csb5134/cybersecurity/blob/main/Ansible/filebeat-playbook.yml file to your Docker container.
- Update the https://github.com/csb5134/cybersecurity/blob/main/Ansible/hosts file to include the IP address of your target webservers and ELK server
- Run the playbook, and navigate to http://52.184.230.210:5601/ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
ansible-playbook /etc/ansible/install-elk.yml
ansible-playbook /etc/ansible/roles/filebeat-playbook.yml
ansible-playbook /etc/ansible/metricbeat-playbook.yml