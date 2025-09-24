environment = "dev"
aws_region = "ap-south-1"
cloudfront_config = {
    bucket_name = "prateek-todo-test"
    custom_domain = "test.dataops.fun"
    acm_certificate_arn = "arn:aws:acm:us-east-1:149536480317:certificate/0d8a7a1c-851e-4cfe-b5fe-62f3d8b4d428"
    price_class= "PriceClass_100"
    
}

instance_config ={
    vpc_id = "vpc-04550d2e519f89bca"
    instance_type = "t2.micro"
    subnet_ids = ["subnet-0e2eb8bc2bd349542","subnet-0accf8b53aa204cb5"]
    instance_count = 2
    ami_id = "ami-0d03cb826412c6b0f"
    ssh_key_name = "test-demo"

}

alb_config = {
    public_subnet_ids = ["subnet-0e2eb8bc2bd349542","subnet-0accf8b53aa204cb5"]
    certificate_arn = "arn:aws:acm:ap-south-1:149536480317:certificate/3e27aa59-3329-4682-ac9c-c0b2879e0716"
}