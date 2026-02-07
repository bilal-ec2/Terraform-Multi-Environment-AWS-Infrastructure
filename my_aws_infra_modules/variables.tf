variable "my_env" {

  description = "This is Environment name of the app"
  type        = string

}

variable "instance_count" {
  description = "This is number of instances to make"
  type        = number

}

variable "ami" {
  description = "This is AMI ID of EC2"
  type        = string
  default     = "ami-0b6c6ebed2801a5cb"

}