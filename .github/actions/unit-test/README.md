## Description

Ejecucion de pruebas unitarias

## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `aws-region` | <p>AWS Region where the ECR is located</p> | `true` | `""` |
| `context` | <p>Build context where the container will be built</p> | `false` | `.` |
| `target` | <p>The target stage to build</p> | `false` | `""` |
| `cache-tag` | <p>Cache tag for reduce build time</p> | `false` | `build-${{ github.sha }}` |
| `sha` | <p>Commit SHA</p> | `false` | `${{ github.sha }}` |
| `dockerfile` | <p>Dockerfile used to build container</p> | `true` | `Dockerfile` |
| `ecr-repo` | <p>ECR repo where the container will be pushed</p> | `true` | `""` |
| `push` | <p>Push container after build</p> | `false` | `true` |


## Runs

This action is a `composite` action.
