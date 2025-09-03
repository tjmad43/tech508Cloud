# Other Compute

- **Docker:** container technology to run applications
- **ECS:** run Docker containers on EC2 instances (have to provision them in advance)
- **Fargate:** 
  - run Docker containers without provisioning the infrastructure
  - Serverless offering (no EC2 instances)
- **ECR:** private Docker Images Repository
- **Batch:** run batch jobs on AWS across managed EC2 instances
- **Lightsail:** predictable & low pricing for simple applications & DB stacks (look into this, but not imprtant for exam)

## Lambda Summary
- Lambda is Serverless, Function as a Service, seamless scaling, reactive
- Lambda billing: 
  - by the time run x by the RAM provisioned
  - by the number of invocations
- language support: many programming languages except (arbitrary) Docker
- invocation time: up to 15 minutes
- use cases:
  - create Thumbnails for images uploaded onto S3
  - run a Serverless cron job
- API Gateway: expose Lambda functions as HTTP API