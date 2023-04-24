provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

module hash1_vpc {
    source = "./modules/vpc"
    vpc_cidr = "10.80.0.0/16"
    vpc_name = "HASH1_VPC"
    environment = "TESTING"
    azs = ["us-east-1a", "us-east-1b"]
    public_subnets_cidr = ["10.80.20.0/24", "10.80.30.0/24"]
}

module hash1_ec2 {
    source = "./modules/ec2"
    environment = "${module.hash1_vpc.environment}"
    imagename = "ami-0828bae4c16160343"
    key_name = "roshan"
    instance_type = "t2.nano"
    sg = "${module.hash1_vpc.sg}"
    public_subnets = "${module.hash1_vpc.public_subnets}"
}