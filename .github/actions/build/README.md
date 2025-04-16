## Description

Builds a container image from the current repo

## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `aws-region` | <p>AWS Region where the ECR is located</p> | `true` | `""` |
| `context` | <p>Build context where the container will be built</p> | `false` | `.` |
| `target` | <p>The target stage to build</p> | `false` | `""` |
| `ecr-repo` | <p>ECR repo where the container will be pushed</p> | `true` | `""` |
| `aws-account-id` | <p>AWS Account ID</p> | `true` | `""` |
| `image-tag` | <p>Tag that will be applied to the built container image</p> | `true` | `build-${{ github.sha }}` |
| `dockerfile` | <p>Dockerfile used to build container</p> | `true` | `Dockerfile` |
| `push` | <p>Push container after build</p> | `false` | `true` |


## Outputs

| name | description |
| --- | --- |
| `built-container` | <p>Full refrence to the built container in ECR</p> |
| `cache-image` | <p>Full refrence to the image cache in ECR</p> |


## Runs

This action is a `composite` action.

