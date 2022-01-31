# terraform-state-file-parsing

```Bash
1. Create an AWS Infrastructure layout that was applied using Terraform that has the follo
wing:
- 2 Instances. One in Public and other in Private subnet.
- 2 Security Groups attached to each instance
- 1. Opening port 22 to 0.0.0.0 (temporarily - remove after assignment)
- 2. Opening port 80 to 0.0.0.0
You cannot use the default VPC. Your terraform code should create your own
- vpc
- public and private subnet.
- internet gateway
- nat gateway
- route tables
- security groups
Please ensure that you lock the code to run against terraform v0.12.29

2. Write a small Python script that can parse the state file and identify whic
h of the two machines can be accessed publicly based on the following rules:
- A machine can be accessed publicly IF it is in a public subnet AND has an inbound rule f
rom 0.0.0.0 on port 22 AND has a public IP.
- A public subnet is the one that has an outbound route to 0.0.0.0 via an Internet Gateway
and not NAT
```
