

resource "aws_s3_bucket" "gen_name"{
    bucket = "${var.s3_bucket_name}-${random_integer.number.id}-${random_string.string.id}"
    tags = {
        default = "s3_itkmitl"
    }
}

resource "random_integer" "number"{
    min = 0
    max = 999
}

resource "random_string" "string"{
    length = 4
    lower = true
}

resource "aws_s3_bucket_ownership_controls" "control"{
    bucket = aws_s3_bucket.gen_name.id

    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "acl"{
    depends_on = [ aws_s3_bucket_ownership_controls.control ]
    bucket = aws_s3_bucket.gen_name.id
    acl = "private"
}