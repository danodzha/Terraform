terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "vmware-tfstates-45146"
    key            = "terraform/aws-vpc-networking.tfstate"
    region         = "us-east-1"
    #encrypt        = true
  }
}
