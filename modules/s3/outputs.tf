output "url" {
    value = aws_s3_bucket_website_configuration.site_hosting.website_endpoint
  
}

output "dns_domain_name" {
    value = aws_s3_bucket.site_bucket.bucket_regional_domain_name
  
}

output "origin_id" {
  value= aws_s3_bucket.site_bucket.id
}


output "path" {
  value =  "${path.module}"
  
}