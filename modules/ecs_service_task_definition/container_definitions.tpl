[
  {
    "name": "${ecs_service_task_system_name}-container-dev",
    "image": "${ecs_service_task_ecr}",
    "essential": true,
    "memoryReservation": 128,
    "environment": [
      { "name": "ENVIRONMENT", "value": "development" },
      { "name": "SERVER_PORT", "value": "3000" },
      { "name": "POSTGRES_HOST", "value": "xxxxxxxxxx.us-east-1.rds.amazonaws.com" },
      { "name": "POSTGRES_USER", "value": "user" },
      { "name": "POSTGRES_PASSWORD", "value": "pass" },
      { "name": "POSTGRES_DB", "value": "testdb" },
      { "name": "POSTGRES_PORT", "value": "5432" },
      { "name": "PGADMIN_DEFAULT_EMAIL", "value": "main@email.io" },
      { "name": "PGADMIN_DEFAULT_PASSWORD", "value": "123456" },
      { "name": "SENDGRID_API_KEY_ID", "value": "XXXXXXXXXXXXX" },
      { "name": "SENDGRID_API_KEY", "value": "SG.QWERTY" },
      { "name": "SENDGRID_FROM", "value": "user@gmail.com" },
      { "name": "BUCKETNAME", "value": "bucket-backend-dev" },
      { "name": "BUCKETACCESSKEYID", "value": "AKIXXXXXYYYYY" },
      { "name": "BUCKETSECRETACCESSKEY", "value": "QWERTYABCDE12399UUUU" },
      { "name": "RECAPTCHA_SECRET", "value": "TESTW0kAAAAACbyLW38_DUMMY" },
      { "name": "RECAPTCHA_KEY", "value": "SECRETAAAAGOpu7TQiH6PLAz3GeuuFgDUMMY" },
      { "name": "TWILIO_ACCOUNT_SID", "value": "AC152bd6123698741" },
      { "name": "TWILIO_AUTH_TOKEN", "value": "92873982739283laosiquy" },
      { "name": "CLIENT_PHONE_NUMBER", "value": "+18334250844" },
      { "name": "MAILGUN_API_KEY", "value": "JAUKIQOQIEUQW8173736262" },
      { "name": "MAILGUN_EMAIL_DISPLAY_NAME", "value": "Tech Team" },
      { "name": "MAILGUN_FROM_EMAIL", "value": "no-reply-dev@email.com" }
    ],
    "portMappings": [
      {
        "containerPort": 3000
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-create-group": "true",
        "awslogs-group": "${ecs_service_task_cloudwatch_logs_group_name}",
        "awslogs-region":"${ecs_service_task_region}", 
        "awslogs-stream-prefix": "${ecs_service_task_system_name}"
      }
    }
  }
]