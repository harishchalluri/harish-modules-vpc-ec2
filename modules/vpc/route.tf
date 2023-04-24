
resource "aws_route_table" "public-route-table" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = {
        Name = "${var.vpc_name}-publicRouting-table"
    }
}


resource "aws_route_table_association" "public-route-assos" {
    count = "${length(var.public_subnets_cidr)}"
    subnet_id = "${element(aws_subnet.public_subnets.*.id,count.index)}"
    route_table_id = "${aws_route_table.public-route-table.id}"
}
