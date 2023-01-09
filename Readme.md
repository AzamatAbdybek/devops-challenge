# Here's a DevOps challenge for you!

## Tasks:

**1.**	Using `Terraform`, code a module that provisions a VM instance in Cloud. You can use any cloud provider of your choice.  The module should perform the following sub-tasks behind the scenes:

- 1.1 Creates an Ubuntu VM instance based on the input parameters passed to the module.

- 1.2 Sets the instance name according to agreed naming convention (refer to the addtional info section).

- 1.3 Attaches a network (VPC) to the VM instance.

- 1.5 Provisions a public IP address.

- 1.6 Assigns labels to the compute resource.

- 1.7 Validates the machine type variable making sure that only the allowed machine type is requested.

- 1.8 Using remote exec, sets a unique random password to the root user on the VM instance.

- 1.9 Returns required module outputs
    
<br>

**2.** (Optional) Information about the created VM instance must be saved to a local file. The file should contain the following information:
        - Instance name
        - Private IP addresses
        - Public IP address
        - Password

<br>

**Additional information:**
-	Naming convention for a vm-instance: *<instance_name>-<env_code>-<random_string>*. For example: `db-srv001-p-dg64`,     *where:* 
    - instance_name:         `db-srv001`
    - env_code:                  `p` 
    - random string:        `dg64`

-	The `"env_code”` string must be parsed from the `environment` variable using a Terraform function inside the module.
-	Assume that a network (VPC) is already created, `"network-prod"` . If it's required by the provider, declare a subnetwork as well.
-	Variables such as Region, Zone, Labels should not be hardcoded.
-   Public IP provisioning must be contoled by a Boolean switch: `true/false`.
- For mandaroty variables refer to the next secion. Feel free to introduce any other variuables to support the functionality of your module.


**Module Inputs:**
| Input  |  Type |  Mandatory |  Default |
|---|---|---|---|
| instance_name  | string  |  yes |  - |
| environment  | string | yes  |  production |
|region   | string  |yes   | -  |
| zone  |string   | yes  | -  |
| machine_type  | string  | no  |  n2-standard |
| network_id  |string   | no  |  network-prod |
| public_ip |  boolean | no  | false  |
| labels  | map  | no  | - |
|   |   |   |   |

**Module Outputs:**
| Output  |  Type |  Value |
|---|---|---|
| vm_name  | string  | vm-instance full name  |  
| Private IP address  | string | string | 
| Public IP address  | string | string | 

<br>

**3.** Write Terraform infrastructure code for deploying a VM instance in Cloud using the module you have created in the previous task.
 -	3.1 Demonstrate “structure” for your Terraform code files. For instance, a separate TF file for variables, etc..
 -	3.2 Make sure that you define all the mandatory variables values in a way that a CI/CD tool will be able to pass them.
 -	3.3 (optional) Make sure that your Terraform state file is NOT hosted on you local PC.
 -	3.4 Commit your Infra code into any version control tool with “public access” (GitHub).

<br>

**4.** Write a CI/CD pipeline for the infrastructure code built in the previous steps. Use any CI/CD tool of your choice.
 -	4.1 In the pipeline configuration file include the following mandatory steps in the workflow:
``` sh    
    -	Code validation
    -	Preparation 
    -	Testing
    -	(Optional) Security scan
    -	Deploy
```

- 4.2 Addtional requirements:
    -	Pass all the required variables into Terraform in the CI/CD steps following any methods of your choice.

<br>

**5.** Write Dockerfile to deploy a Python Web App with the following instructions:
``` sh
    -   Pull ubuntu 18.04 image
    -	Install Python 
    -	Install Python requirements defined in a requireemsnt.txt file. The file should be in the same directory as Dockerfile
    -	Deploy a python web application that is located under /opt/webapp
    -	The web applicaiton runs on port 5000
    -	Make sure the web applicaiton starts when a container is run.
```
<br>

**6.**	Build a docker image based on the Dockerfile written in the previous task. Provide a command that start the docker container with the image built running `interactively` in the `detached mode`.
    - Commit your Dockerfile and the comamnd into the same repository you used fro Terraform code.

<br>

**7.**	You are a Linux server administrator. Using any scripting language of your choice, write a script that performs the following jobs on a server. previous tasks.
-	7.1 Makes backup of the “var/www” directory
-	7.2 Makes sure that a backup directory exists before performing the backup operation. Backup directory should be “/var/lib/backups”.

Backup file name format: www-backup-YYY-MM-DD.tar.gz, where YYYY is the year of backups, MM is the month, DD is the day.
Commit your script code into the same task repository.
 