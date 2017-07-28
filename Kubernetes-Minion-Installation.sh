#!/bin/bash

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
kubeadm join --token $token $MASTER_IP_ADRESSE:6443 --skip-preflight-checks

# Not ready bug fix 
sed -i "s|ExecStart=/usr/bin/kubelet.*$|ExecStart=/usr/bin/kubelet \$KUBELET_KUBECONFIG_ARGS \$KUBELET_SYSTEM_PODS_ARGS \$KUBELET_DNS_ARGS \$KUBELET_AUTHZ_ARGS \$KUBELET_CAD$|g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
reboot
