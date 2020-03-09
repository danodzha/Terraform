terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "vmware-tfstates-45146"
    key            = "terraform/vmware-linux-clone.tfstate"
    region         = "us-east-1"
    #encrypt        = true
  }
}
