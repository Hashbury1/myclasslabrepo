I elaborated on the steps you need to take to create an S3 bucket using Terraform.

You could either go to Terraform documentation to get the already defined code for creating an S3 bucket as a newbie or you write it yourself.

If you used to create a bucket with the console, you wont have much difficulty understanding the values and attributes needed to create a resource on Terraform.

Make sure you include the cloud provider, access/secret key, region as a preresequite.

Pay attention to name you choose, it has to be globally unique. 

Use Terraform commands to Initialize, validate, Plan and Apply to finally create resources.

When you are done use clean up by using Terraform destroy so you dont accumulate excess bill on your account. 
