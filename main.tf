provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}


resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.name_db}"
  read_capacity  = "${var.r_capacity}"
  write_capacity = "${var.w_capacity}"
  hash_key       = "${var.hash_key}"
  range_key      = "${var.range_key}"

  attribute {
    name = "${var.name_id}"
    type = "S"
  }

  attribute {
    name = "${var.name_title}"
    type = "S"
  }

  attribute {
    name = "${var.score}"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled = false
  }

  global_secondary_index {
    name               = "${var.name_index}"
    hash_key           = "${var.hash_key_index}"
    range_key          = "${var.range_key_index}"
    write_capacity     = "${var.w_capacity_index}"
    read_capacity      = "${var.r_capacity_index}"
    projection_type    = "${var.p_type}"
    non_key_attributes = "${var.key_attr}"
  }

  tags {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
