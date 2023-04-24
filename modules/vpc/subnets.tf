resource "aws_subnet" "public_subnets" {
    count = "${length(var.public_subnets_cidr)}"
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${element(var.public_subnets_cidr, count.index)}"
    availability_zone = "${element(var.azs, count.index)}"
    tags = {
        Name = "${var.vpc_name}-Publicsubnet-${count.index+1}"
    }
}
