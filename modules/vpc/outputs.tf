output "vpc_id" {
    value = "${aws_vpc.default.id}"
}

output "environment" {
    value = "${var.environment}"
}

output "public_subnets" {
    value = "${aws_subnet.public_subnets.*.id}"
}


output "sg" {
    value = "${aws_security_group.allow_all.id}"
}
