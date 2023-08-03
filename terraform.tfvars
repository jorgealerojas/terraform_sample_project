vpc-name = "terraform-default-vpc"
vpc-cidr = "10.0.0.0/16"
vpc-azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc-db-subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
vpc-private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
vpc-public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

bastion_name          = "bastion-host"
bastion_ami_id        = "ami-007855ac798b5175e" # Ubuntu 22.04 instance in us-east-1
bastion_key_pair      = "shok-new-virginia"     # Substitute this with a new key-pai
bastion_instance_type = "t3.nano"
bastion_monitoring    = true

s3_param_bucket_name = "shokworks-s3-backend"
s3_param_environment = "dev"

ecs_role_system_name = "Shokworks"

ecs_cluster_name = "Shokworks-Cluster"
ecs_environment_prefix = "Dev"

db_subnet_group_name     = "shokworks-db-subnet-group"
db_parameter_group_name  = "shokworks-db-parameter-group"
database_identifier      = "shokworks-db"
database_size            = 20
database_instance_class  = "db.t3.micro"
database_environment     = "dev"

asg_system_name   = "shokworks-asg"
asg_environment   = "dev"
asg_ami_id        = "ami-007855ac798b5175e"
asg_instance_type = "t3.micro"
asg_key_pair_name = "shok-new-virginia"
asg_acm           = "arn:aws:acm:us-east-1:067895002187:certificate/d614ad88-46e8-485d-bc48-a5b8f3e77c76"

alb_system_name          = "shokworks-backend"
alb_deployment_env       = "dev"
alb_ssl_certificate_arn  = "arn:aws:acm:us-east-1:067895002187:certificate/d614ad88-46e8-485d-bc48-a5b8f3e77c76"

ecs_service_task_region                     = "us_east-1"
ecs_service_task_system_name                = "shokworks-task-definition"
ecs_service_task_ecr                        = "a"
ecs_service_task_deployment_env             = "dev"
ecs_service_task_cloudwatch_logs_group_name = "shokworks-backend"