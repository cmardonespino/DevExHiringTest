## Description

Deployment steps for app

## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `eks-cluster-name` | <p>EKS cluster name where the app will be deployed</p> | `true` | `""` |
| `eks-namespace` | <p>EKS Namespace where the app will be deployed</p> | `true` | `""` |
| `image-tag` | <p>Cache tag for reduce build time</p> | `false` | `build-${{ github.sha }}` |
| `ecr-repo` | <p>ECR repo where the container will be pushed</p> | `true` | `""` |


## Runs

This action is a `composite` action.
