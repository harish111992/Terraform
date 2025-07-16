# Count: 
  1. In the resourceGroupParametrs you can check how to define the count usage.
  2. The count can be used in 'resource' block 'module' block and some special cases 'datablock'

# For loop: 
Especially this can be used in output code block. The code file name is "ResourceGroupParameters.tf" file, see the below example for reference

<img width="863" alt="count Example_for In output" src="https://github.com/user-attachments/assets/3fd752d4-345f-44f7-887a-64bf22c4ed57" />

# for_each:
Example- ResourceGroupParameters_foreach.tf file.

<img width="539" alt="for_each_Eample" src="https://github.com/user-attachments/assets/760ad056-750a-446a-a51d-317e2eb9ae14" />

# I have created a RG using terraform, and I have modified the Tags in a external way. I want to create a NSG in the same RG using terraform. will it leads to a drift ?
Modifying the tags of a resource group (RG) externally (i.e., outside of Terraform, such as via the Azure Portal or CLI) does not directly cause a drift when you create a new resource like a Network Security Group (NSG) in the same RG using Terraform. However, here's a breakdown of what you should be aware of
 1. When you create the NSG using Terraform and reference the existing RG (even if its tags were modified externally), Terraform will not attempt to change the RG unless the RG is also managed in your Terraform configuration and the tags differ from what's defined in your code.
 2. The NSG will be created in the RG as expected.

# There is a Resource Group I have created using terraform after I have added a TAG directly in portal. then I added another TAG in the terraform .tf file what it will do ?
1. You created a Resource Group using Terraform.
2. You then manually added a tag (e.g., Environment = Production) in the Azure Portal.
3. Later, you added a different tag (e.g., Owner = DevOps) in your Terraform .tf file and ran terraform apply.
What Will Happen?
By default, Terraform will overwrite the entire tags block with what’s defined in the .tf file.
4. tags = {
  Owner = "DevOps"
}
5. Then after terraform apply, the manually added tag (Environment = Production) will be removed, and only Owner = DevOps will remain.





