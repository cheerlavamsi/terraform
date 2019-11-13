resource "aws_instance" "web" {

    count         = 2
    ami           = "i-008016386f3ee01f5"
    instance_type = "t2.micro"

}