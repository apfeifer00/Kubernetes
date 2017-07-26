#!/bin/bash
export TOKEN=920452.0ce99965d74737a4
export MASTER_IP_ADRESSE=192.168.8.7
export MASTER_PORT=6443
#read -p "Bitte Token eingeben:" TOKEN
#read -p "Bitte die Master IP-Adresse eingeben:" Master_IP_ADRESSE

# Installation der Benötigten packages:
apt-get update
apt-get install -y docker.io
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm

# Beitritt ins Cluster
#kubeadm join --token $TOKEN $MASTER_IP_ADRESSE:$MASTER_PORT --skip-preflight-checks

# Not ready bug fix 
sed -i "s|ExecStart=/usr/bin/kubelet.*$|ExecStart=/usr/bin/kubelet \$KUBELET_KUBECONFIG_ARGS \$KUBELET_SYSTEM_PODS_ARGS \$KUBELET_DNS_ARGS \$KUBELET_AUTHZ_ARGS \$KUBELET_CAD$|g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
reboot
