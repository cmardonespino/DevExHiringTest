## Description

Ejecuta un linter para verificar y corregir problemas de estilo y errores en el código, asegurando calidad y consistencia en el proyecto.

## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `aws-region` | <p>AWS Region where the ECR is located</p> | `true` | `""` |
| `context` | <p>Build context where the container will be built</p> | `false` | `.` |
| `target` | <p>The target stage to build</p> | `false` | `""` |
| `dockerfile` | <p>Dockerfile used to build container</p> | `true` | `Dockerfile` |
| `cache-tag` | <p>Cache tag for reduce build time</p> | `false` | `build-${{ github.sha }}` |
| `ecr-repo` | <p>ECR repo where the container will be pushed</p> | `true` | `""` |
| `push` | <p>Push container after build</p> | `false` | `false` |


## Runs

This action is a `composite` action.
