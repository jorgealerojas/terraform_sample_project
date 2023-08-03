[
  {
    "name": "${ecs_service_task_system_name}-container-dev",
    "image": "${ecs_service_task_ecr}",
    "essential": true,
    "memoryReservation": 128,
    "environment": [
      { "name": "ENVIRONMENT", "value": "development" },
      { "name": "SERVER_PORT", "value": "3000" },
      { "name": "POSTGRES_HOST", "value": "warning-dev-stg.czsbakny9m9u.us-east-1.rds.amazonaws.com" },
      { "name": "POSTGRES_USER", "value": "warningdevstg" },
      { "name": "POSTGRES_PASSWORD", "value": "d19#is!2chC2" },
      { "name": "POSTGRES_DB", "value": "warningdev" },
      { "name": "POSTGRES_PORT", "value": "5432" },
      { "name": "PGADMIN_DEFAULT_EMAIL", "value": "infra@shokworks.io" },
      { "name": "PGADMIN_DEFAULT_PASSWORD", "value": "123456" },
      { "name": "SENDGRID_API_KEY_ID", "value": "2CfoRHpkRP-6_rXW-0LHEQ" },
      { "name": "SENDGRID_API_KEY", "value": "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" },
      { "name": "SENDGRID_FROM", "value": "gcarloseduardo1@gmail.com" },
      { "name": "BUCKETNAME", "value": "warning-backend-dev" },
      { "name": "BUCKETACCESSKEYID", "value": "AKIAQGBJYUGT2UICZ7HQ" },
      { "name": "BUCKETSECRETACCESSKEY", "value": "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" },
      { "name": "RECAPTCHA_SECRET", "value": "6LcigW0kAAAAACbyLW38aELWEuYLd_1Bj03e_ouz" },
      { "name": "RECAPTCHA_KEY", "value": "6LcigW0kAAAAAGOpu7TQiH6PLAz3GeuuFg6dbzF1" },
      { "name": "TWILIO_ACCOUNT_SID", "value": "AC152bd69c662b5449200793f3a12d6ef6" },
      { "name": "TWILIO_AUTH_TOKEN", "value": "d5f3008dac01338907a12662377ff3a6" },
      { "name": "CLIENT_PHONE_NUMBER", "value": "+18334250844" },
      { "name": "MAILGUN_API_KEY", "value": "fa48035fd63ba901f8fc2d4826834d1f-52d193a0-ec9b5798" },
      { "name": "MAILGUN_EMAIL_DISPLAY_NAME", "value": "Warning Tehcnologies Team" },
      { "name": "MAILGUN_FROM_EMAIL", "value": "no-reply-dev@warning" }
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