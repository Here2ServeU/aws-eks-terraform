# This Terraform code will help you deploy an EKS (Elastic Kubernetes Service) cluster on AWS.

**The architecture is using modules to accomplish our goal. What that means is you have to organize your code as follows** 

## 1. Create a folder and give it a name. For example, AWS_EKS. Or, you can clone this repo by using this command: 

     -> $ git clone 

## 2. Inside your working directory (folder), create 6 child directories and name them per your naming convention: 
      
      a) modules
      b) s3-backend, where you will store the code to create an S3 backend, and your terraform state file will reside. 

## 3. Go inside the "modules" directory and create the following:
      
      a) eks and add these files, main.tf, variables.tf, and output.tf. 
      b) iam and add these files, main.tf, and output.tf.
      c) security_group and add these files, main.tf, variables.tf, and output.tf.
      d) vpc and add these files, main.tf, variables.tf, and output.tf.

## 4. In the s3-backend module, add these files: main.tf, variables.tf, provider.tf, and output.tf.

## 5. In the parent directory (AWS_EKS, or whatever name you gave it and where you store everything for this deployment), add the following files: README.md, main.tf, provider.tf, variables, and terraform.tfvars. 

## 6. Go back to the s3-backend module and run the following commands: 
            
            -> $ terraform init
            -> $ terraform plan
            -> $ terraform apply

## 7. Now that you have created an S3 bucket to store your Terraform state file remotely, go back to the parent directory. 

## 8. Run the following commands: 
            
            -> $ terraform init
            -> $ terraform plan
            -> $ terraform apply

There you go! You've deployed your infrastructure, an EKS cluster on AWS using Terraform modules. 

## 9. Clean up. 
        -> $ terraform destroy. 
