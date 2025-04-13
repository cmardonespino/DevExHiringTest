MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="//"

--//
Content-Type: text/x-shellscript; charset="us-ascii"
#!/bin/bash
set -ex
CLUSTER_NAME="${CLUSTER_NAME}"
API_SERVER_URL=${API_SERVER_URL}
B64_CLUSTER_CA=${B64_CLUSTER_CA}
K8S_CLUSTER_DNS_IP=10.100.0.10
/etc/eks/bootstrap.sh $CLUSTER_NAME --b64-cluster-ca $B64_CLUSTER_CA --apiserver-endpoint $API_SERVER_URL --dns-cluster-ip $K8S_CLUSTER_DNS_IP --use-max-pods false
--//--