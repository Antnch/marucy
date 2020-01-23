variable "aws_region" {
  default = "eu-west-1"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "volume_type" {
  default = "gp2"
}
variable "volume_size" {
  default = "30"
}
variable "ssh_key" {
  default = ""
}

variable "aws_access_key" {
  default = ""
}
variable "aws_secret_key" {
  default = ""