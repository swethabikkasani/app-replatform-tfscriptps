resource "aws_security_group_rule" "sg_rules_cidr" {
  count             = "${var.cidr_source ? 1 : 0}"
  security_group_id = "${var.sg_id}"
  type              = "${element(split(",", var.sg_rule_sequence), 0)}"

  cidr_blocks      = ["${var.source_cidr_blocks}"]
  ipv6_cidr_blocks = ["${var.source_ipv6_cidr_blocks}"]
  prefix_list_ids  = ["${var.source_prefix_list_ids}"]
  description      = "${var.rule_description}"

  from_port = "${element(split(",", var.sg_rule_sequence), 1)}"
  to_port   = "${element(split(",", var.sg_rule_sequence), 2)}"
  protocol  = "${element(split(",", var.sg_rule_sequence), 3)}"
}

resource "aws_security_group_rule" "sg_rules_sgid" {
  count             = "${var.cidr_source ? 0 : 1}"
  security_group_id = "${var.sg_id}"
  type              = "${element(split(",", var.sg_rule_sequence), 0)}"

  source_security_group_id = "${var.source_sg_id}"
  description              = "${var.rule_description}"

  from_port = "${element(split(",", var.sg_rule_sequence), 1)}"
  to_port   = "${element(split(",", var.sg_rule_sequence), 2)}"
  protocol  = "${element(split(",", var.sg_rule_sequence), 3)}"
}
