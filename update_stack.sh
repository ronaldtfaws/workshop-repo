 #!/bin/sh
export ECR_REPOSITORY=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/devops-workshop-app

aws cloudformation update-stack \
  --stack-name devops-cluster \
  --template-body file:///Workshop/setup/required-infrastructure.yml \
  --parameters ParameterKey=ContainerImage,ParameterValue=:latest \
               ParameterKey=DeploymentType,ParameterValue=ECS \
  --capabilities CAPABILITY_NAMED_IAM