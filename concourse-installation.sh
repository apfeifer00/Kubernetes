#!/bin/ba

git clone https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-worker-rc.yaml
git clone https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-web-svc.yaml
git clone https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-web-rc.yaml
git clone https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-secrets.yaml
git clone https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-postgresql-svc.yaml
git clone https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-postgresql-secrets.yaml
git clone https://raw.githubusercontent.com/apfeifer00/Kubernetes/master/concourse-kubernetes/concourse-postgresql-rc.yaml




kubectl create -f concourse-worker-rc.yaml
kubectl create -f concourse-web-svc.yaml
kubectl create -f concourse-web-rc.yaml
kubectl create -f concourse-secrets.yaml
kubectl create -f concourse-postgresql-svc.yaml
kubectl create -f concourse-postgresql-secrets.yaml
kubectl create -f concourse-postgresql-rc.yaml
