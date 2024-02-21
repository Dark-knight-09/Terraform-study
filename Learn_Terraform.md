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
5. variable: it is used to define the variable and its type.
6. locals:
7. module:
8. terraform:
9. provisioner:


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
5. `lifecycle`: This block is used to control certain behaviors of the resource during create, update, and delete operations, such as preventing the destruction of a resource (`prevent_destroy`), creating before destroying during replacement (`create_before_destroy`), and ignoring changes to certain attributes (`ignore_changes`).











