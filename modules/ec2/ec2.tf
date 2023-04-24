resource "aws_instance" "public_servers" {
    count = "${var.environment == "prod" ? 3 : 1}"
    ami = var.imagename
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = "${element(var.public_subnets, count.index)}"
    vpc_security_group_ids = ["${var.sg}"]
    associate_public_ip_address = true	
    tags = {
         Name = "${var.environment}-Publicserver-${count.index+1}"
         Env = "var.environment"
     }
}