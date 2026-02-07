output "my_ec2_public_ips" {

  description = "This is for the public ips of ec2"
  value       = aws_instance.my_instance[*].public_ip

}