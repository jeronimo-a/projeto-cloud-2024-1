# define as configurações do Terraform em si
terraform {

	# define os providers necessários, ou seja, onde a infraestrutura sera implantada
	required_providers {

		# define como um dos providers um tal provider "aws", poderia ter qualquer nome
		aws = {
			source  = "hashicorp/aws"	# fala que o provider é a AWS, para o terraform saber como conversar com ele
			version = "~> 5.0"			# especifica a versão da API Terraform-AWS
		}
	}
}

# configurações do provider aws
provider "aws" {
	region = "us-east-1"	# define que região da AWS será utilizada
}