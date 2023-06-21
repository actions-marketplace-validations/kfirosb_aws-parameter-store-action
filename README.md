# aws-parameter-store-action
A GitHub action centered on AWS Systems Manager Parameter Store GetParameters call, and placing the results into environment variables.

```yaml
env:
    AWS_REGION : "us-east-1"

permissions:
  id-token: write  
  contents: read

jobs:
  job_name:
    steps:
        - name: Configure AWS Credentials
            uses: aws-actions/configure-aws-credentials@v1
            with:
                role-to-assume: arn:aws:iam::<id>:role/github-actions/<role name>
                aws-region: ${{ env.AWS_REGION }}

        - name: Check out code
            uses: actions/checkout@v2

        - name: Get Values From AWS Parameter Store
            uses: philips-internal/aws-parameter-store-action@v1
            with:
                secrets: |
                /path/in/parameter/store | ENV_NAME
```
