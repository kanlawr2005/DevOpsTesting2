resource "aws_s3_bucket" "b" {

  bucket = "testingtempbucketcraigpearson" 

}



resource "aws_s3_bucket_policy" "b" {

  bucket = aws_s3_bucket.b.id



  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
 "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::testingtempbucketcraigpearson/*",
      "Condition": {
         "IpAddress": {"aws:SourceIp": "8.8.8.8/32"}
      }
    }
  ]
}
POLICY

}


