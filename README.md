Count: 
  1. In the resourceGroupParametrs you can check how to define the count usage.
  2. The count can be used in 'resource' block 'module' block and some special cases 'datablock'

For loop: 
Especially this can be used in output code block.
    output "ResourceGroupNames" {
        value = [for i in module.RG : i.RG_name]
     }   

for_each:

