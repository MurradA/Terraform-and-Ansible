###--- Terraform Infrastructure ---###

When "Main_Script/auto_create" is run, it performs the "terraform apply -auto-approve" command which builds all the ".tf" files in this directory.

The code provides a database server on a private subnet that can be accessed using a bastion host that is hosted on a public subnet, all inside a VPC connected to an internet gateway. Outside the VPC is an elastic load balancer (elb). An Auto-Scaling Group is used to create an instance when CPU usage on a PetClinic server ec2 instance reaches 80%, and destroys an ec2 instance when CPU usage drops to 40%.

A failover Availability Zone (AZ) is provided to ensure the system is resilient in the face of hardware issues.

---Firewalls---
The user will need to insert the public IP's of their machine into the "our_ips" security group variable, which is located in the "vars.tf" file.
