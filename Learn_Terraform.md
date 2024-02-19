## Terraform:

- Terraform enables you to safely and predictably create, change, and improve infrastructure. It is an open-source tool that codifies APIs into declarative configuration files that can be shared among team members, treated as code, edited, reviewed, and versioned.
- Terraform is a declarative language, which means you describe the end state that you want, and Terraform will figure out how to get there.
- Terraform uses HCL language(HashiCorp Configuration Language)
- Terraform doesn't work on a per-file basis, but rather on a per-directory basis. The `terraform init` command is used to initialize a working directory containing Terraform configuration files. It doesn't target a specific file but prepares the whole directory for other operations.

Basic:

steps to run .tf file:

1. terraform init: initialize the terraform config file in the directory
2. terraform plan: shows the plan to achieve the desire state
3. terraform apply: describes the plan and execute the plan.

Basic command:

- terraform validate:  validate the syntax of .tf file or debugger
- terraform fmt : make .tf file prettier
- terraform show : shows current state of terraform in the directory
- terraform  provider: shows the provider used in .tf file
- terraform output  <variable name> : prints all output variable or specified  output <variable name>.
- terraform refresh : updates the .tf according to infrastructure.
- terraform destory: destories all the resource created using current terraform file.[ be carefull ]
- 












