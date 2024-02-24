## Terraform:

- Terraform enables you to safely and predictably create, change, and improve infrastructure. It is an open-source tool that codifies APIs into declarative configuration files that can be shared among team members, treated as code, edited, reviewed, and versioned.
- Terraform is declarative language, which means only the end state of the infrastructure needs to be stated and Terraform initialize , Plans, execute the plan to attain the given state.  it only alters the resource which are need to change to attain the final state
- Terraform uses HCL language(HashiCorp Configuration Language)
- Terraform doesn't work on a per-file basis, but rather on a per-directory basis. The `terraform init` command is used to initialize a working directory containing Terraform configuration files. It doesn't target a specific file but prepares the whole directory for other operations.

Basic:

steps to run .tf file:

1. terraform init: initialize the terraform config file in the directory
2. terraform plan: shows the plan to achieve the desire state
3. terraform apply: describes the plan and execute the plan.


# types of blocks in terraform:
1. resource: it is used to create, update, and delete the resources.
2. data: it is used to fetch the data from the provider.
3. output: it is used to display the output of the terraform file in the terminal.
4. provider: it is used to define the provider and its configuration.
5. variable: it is used to define the variable and its type.(can be overriden by different methods)
6. locals: it is used to define the local variable in the terraform file. (can't be overriden)
7. module: it is used to call the module(terraform code) from the different directory. // reusability of code
8. terraform: it is used to define the terraform version and its provider configuration.
9. provider: it is used to define the provider and its configuration like access key or tokens.
10. Dynamic: it is used inside the resource block to create multiple resources with different configuration.
11. provisioner: it is used to run the script on the resource after the resource is created. //don't use it, use cloud-init or user-data instead.


# priority of variable definition:
1. command line arguments [terraform apply -var 'name=value' or terraform apply -var-file=example.tfvars]
2. terraform.tfvars file // variable file declared in the same directory
3. any .auto.tfvars or .auto.tfvars.json files 
4. Environment variables [export TF_VAR_name=value]
5. default value in the variable block


# Terraform command:
- terraform apply: execute the plan
- terraform validate:  validate the syntax of .tf file or debugger
- terraform fmt : make .tf file prettier
- terraform show : shows current state of terraform in the directory
- terraform  provider: shows the provider used in .tf file
- terraform output  <variable name> : prints all output variable or specified  output <variable name>.
- terraform refresh : updates the .tf according to infrastructure.
- terraform destory: destories all the resource created using current terraform file.[ be carefull ]
- 


# meta-arguments in terraform:
Meta-arguments in Terraform are used to control the behavior of resources beyond what the resource type itself does.

1. `depends_on`: This argument is used to handle hidden resource or module dependencies. It is used to define explicit dependency on another resource.
2. `count`: This argument is used to create multiple similar instances of a resource or a module.
3. `for_each`: This argument is used to create multiple bit differenct instances of a resource or a module, similar to `count`, but it uses a map or a set of strings to create the instances.
4. `provider`: This argument is used to specify a custom or alternative provider configuration for a resource.
5. `lifecycle`: This block is used to control certain behaviors of the resource during create, update, and delete operations, 
such as preventing the destruction of a resource (`prevent_destroy`) 
creating before destroying during replacement (`create_before_destroy`) 
ignoring changes to certain attributes (`ignore_changes`)


depending on the variable value type the variable type is defined.
# types of variable:
1. string : "string name" 
2. number: 123 
3. bool: true/false
4. list: ["a", "b", "c"] ; list("a", "b", "c") // all elements should be of same type
5. map: {key1 = "value1", key2 = "value2"} ; map(string) // all elements should be of same type
6. object: {key1 = "value1", key2="value2"} ; object({key1 = string, key2 = number}) // all elements can have different type
7. tuple: ["a", 2 , "c"] ; tuple([string, number, bool])
8. set: ["a", "b", "c"] ; set("a", "b", "c")


to ssh connection to the instance using terraform:
connection {
    type    = "ssh"
    user   = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host = self.public_ip
}





