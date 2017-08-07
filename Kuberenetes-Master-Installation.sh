#!/bin/bash
export KUBECONFIG=$HOME/admin.conf

#Installation der Benötigten packages:
apt-get update
apt-get install -y docker.io
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm

echo "Output for debugging:
token=$token"
#The configuration of the master node
 kubeadm init --token string $token


# start the Cluster
#sudo cp /etc/kubernetes/admin.conf $HOME/
#sudo chown $(id -u):$(id -g) $HOME/admin.conf
#export KUBECONFIG=$HOME/admin.conf

# Not ready bug fix 
sed -i "s|ExecStart=/usr/bin/kubelet.*$|ExecStart=/usr/bin/kubelet \$KUBELET_KUBECONFIG_ARGS \$KUBELET_SYSTEM_PODS_ARGS \$KUBELET_DNS_ARGS \$KUBELET_AUTHZ_ARGS \$KUBELET_CAD$|g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
reboot
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
kubectl apply -f https://git.io/weave-kube

# Installation des Kubernetes Dashboards:
#kubectl create -f https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml

