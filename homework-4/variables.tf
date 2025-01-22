variable region {
    default = "us-east-1"
    type = string
    description = "provide a region"
}
variable key_name {
    default = "akmal-key"
    type = string
}
variable port {
    type = list
    default = [22,80,443]
}
variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0df8c184d5f6ae949"
}

variable "instance_name" {
 default = "Homework4"
}
