output "region_1" {
    value = data.aws_region.region_1
    description = "Name of 1st region"
}

output region_2 {
    value = data.aws_region.region_2
    description = "Name of 2nd region"
}

output "instance_region_1_az" {
    value = aws_instance.region_1.availability_zone
    description = "AZ were instance is deployed in region 1"
}

output "instance_region_2_az" {
    value = aws_instance.region_2.availability_zone
    description = "AZ were instance is deployed in region 2"
}