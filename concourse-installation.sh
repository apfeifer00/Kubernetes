#!/bin/bash
mkdir concourse
cd ./concourse/
#wget https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-worker-rc.yaml
#wget https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-web-svc.yaml
#wget https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-web-rc.yaml
#wget https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-secrets.yaml
#wget https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-postgresql-svc.yaml
#wget https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-postgresql-secrets.yaml
#wget https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-postgresql-rc.yaml
git clone https://gist.github.com/ea2b9e1dc23665867d60a1b340a85246.git


kubectl create -f concourse-worker-rc.yaml
kubectl create -f concourse-web-svc.yaml
kubectl create -f concourse-web-rc.yaml
kubectl create -f concourse-secrets.yaml
kubectl create -f concourse-postgresql-svc.yaml
kubectl create -f concourse-postgresql-secrets.yaml
kubectl create -f concourse-postgresql-rc.yaml
