module "dev" {

    source = "./my_aws_infra_modules"
    my_env = "dev"
    instance_count = 1
    
  
}

module "stg" {

    source = "./my_aws_infra_modules"
    my_env = "stg"
    instance_count = 1
    
  
}

module "prd" {

    source = "./my_aws_infra_modules"
    my_env = "prd"
    instance_count = 1
    
  
}

output "dev_server_ips" {
  value = module.dev.my_ec2_public_ips
}

output "stg_server_ips" {
  value = module.stg.my_ec2_public_ips
}

output "prd_server_ips" {
  value = module.prd.my_ec2_public_ips
}



