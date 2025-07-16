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
4. What Will Happen?
5. By default, Terraform will overwrite the entire tags block with what’s defined in the .tf file.
6. tags = {
7.  Owner = "DevOps"
8. }
9. Then after terraform apply, the manually added tag (Environment = Production) will be removed, and only Owner = DevOps will remain.
11. How to prevent this ?
12. Create lifecycle block and ignore the TAG changes.
    
    <img width="511" height="285" alt="lifrCycle" src="https://github.com/user-attachments/assets/614bb9f1-9960-4e60-a865-793428b8034c" />

13. Using ignore_changes = [tags] means Terraform will no longer manage tags for that resource. If you want to manage some tags but ignore others, you’ll need a more advanced setup (like using locals or external data sources to merge tags).
14. If you manually add another tag in the Azure Portal (e.g., Environment = Production), Terraform will not remove it in future apply operations.
15. If you change the Owner tag in the .tf file (e.g., to Owner = "Admin"), Terraform will ignore that change too — because all tag changes are being ignored.
    
    <img width="386" height="175" alt="tags" src="https://github.com/user-attachments/assets/f73f54e8-12ca-4f93-9b03-5ef4f4b9ec0b" />

    







