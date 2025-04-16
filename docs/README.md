# Documentación para Desplegar la Infraestructura y Ejecutar la Aplicación
## Requisitos
Para desplegar la infraestructura y ejecutar la aplicación, necesitas tener configurado lo siguiente:

* Terraform 1.9.0 o mayor
* Asegúrate de tener Terraform instalado en tu máquina local. Si no lo tienes, puedes instalarlo usando Chocolatey (en Windows) o directamente desde terraform.io.

### Instalar Terraform usando Chocolatey (Windows):

Si estás en Windows, instala Chocolatey primero y luego Terraform:

* Abre PowerShell como Administrador y ejecuta el siguiente comando para instalar Chocolatey:

powershell
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

* Luego, instala Terraform con:

```
choco install terraform
```

* Verificar que tienes la versión correcta de Terraform instalada:

```
terraform version
```

Asegúrate de que la versión sea 1.9.0 o mayor.

### Credenciales de AWS configuradas en AWS CLI
Necesitas tener configurado el acceso a tu cuenta de AWS. Si no lo has hecho, configura las credenciales de AWS con el siguiente comando:

```
aws configure
```

Lo anterior deberia dejar tu archivo ~/.aws/credentials & ~/.aws/config de la siguiente manera

#### ~/.aws/credentials

```
[devops]
aws_access_key_id = XXXXXXXX
aws_secret_access_key = YYYYYYYYYYYYY
```

#### ~/.aws/config

```
[devops]
[default]
region = us-east-1

[profile devops]
region = us-east-1
```

* Asegúrate de que las credenciales estén configuradas con el perfil de usuario devops (o el perfil que uses), el cual debe tener permisos para interactuar con recursos de EKS, EC2, VPC, entre otros.

Asegúrate de que el archivo de provider esté configurado correctamente en tu máquina local.

```
provider "aws" {
  region  = "us-east-1"  # Cambia la región según tu configuración
  profile = "devops"     # Asegúrate de usar el perfil correcto
}
```

### Verificar el plan de Terraform
Ejecuta `terraform init` para posteriormente ejecutar `terraform plan` para verificar que Terraform pueda realizar los cambios sin aplicarlos aún:

### Aplicar la infraestructura
Si todo está correcto, despliega la infraestructura con el siguiente comando:

```
terraform apply
```

Terraform te pedirá confirmación antes de proceder, escribe yes para confirmar.

Terraform creará/configurará todos los recursos necesarios en AWS, incluyendo un EKS cluster, subredes y otros recursos asociados. Esto tomará algunos minutos.

### Construcción de la Imagen y Ejecución del Contenedor
#### Construcción de la imagen Docker
Para construir la imagen Docker de la aplicación, ejecuta el siguiente comando en el directorio raíz del proyecto:

`DOCKER_BUILDKIT=1 docker buildx build --progress=plain --tag test -f ./app/Dockerfile .`

Esto construirá la imagen de la aplicación utilizando el archivo Dockerfile ubicado en el directorio ./app/.

#### Ejecutar el contenedor Docker
Una vez que la imagen esté construida, ejecuta el contenedor con el siguiente comando:

`docker run -p 3000:3000 --name test test`

Esto ejecutará el contenedor y expondrá la aplicación en el puerto 3000.

### Configuracion de bastion
Terraform, como se menciono anteriormente, se encargará de aplicar toda la infraestructura necesaria, incluido el Bastion, el cual se utiliza para poder interactuar con la API de EKS evitando que un usuario pueda ejecutar consultas kubectl desde su maquina local.
#### Ejecutar el agente de GitHub
Para ejecutar el agente de Github como runner utilizando el bastion, sigue las siguientes instrucciones explicadas en esta [documentacion](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners). Posterior a esto, puede mantener activo el agente de Github con los siguientes comandos:

* `sudo ./svc.sh install`
* `sudo ./svc.sh start`