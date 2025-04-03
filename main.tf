terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "default"
}


module "s3" {
  source         = "./modules/s3"
  region         = var.region
  bucket_name    = var.bucket_name
  cloudfront_arn = module.cloudfront.cloudfront_arn

}

module "cloudfront" {
  source              = "./modules/cloudfront"
  dns_domain_name     = module.s3.dns_domain_name
  domain_name         = var.domain_name
  origin_id           = module.s3.origin_id
  acm_certificate_arn = module.acm.acm_certificate_arn
}

module "acm" {
  source           = "./modules/acm"
  domain_name      = var.domain_name
  alternative_name = var.alternative_name

}

module "route53" {
  source                    = "./modules/route53"
  cloudfront_domain_name    = module.cloudfront.cloudfront_domain_name
  cloudfront_hosted_zone_id = module.cloudfront.cloudfront_hosted_zone_id

}

