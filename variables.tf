variable "region" {
  type = string
  default = "us-east-1"
}
variable "bucket_name" {
  type = string
  default = "static-site-hosting-bucket-12345"
}
variable "domain_name" {
  type = string
  default = "static.nusratdops.xyz"
}
variable "alternative_name" {
  type = string
  default = "www.static.nusratdops.xyz"
}