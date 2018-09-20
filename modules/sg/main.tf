#################
# Security group
#################
resource "aws_security_group" "sg" {
  count = "${var.create ? 1 : 0}"

  name        = "${var.name}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"

  lifecycle {
    create_before_destroy = true
  }
}
