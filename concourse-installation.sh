#!/bin/bash
mkdir concourse
cd ./concourse/
wget https://gist.github.com/apfeifer00/ea2b9e1dc23665867d60a1b340a85246
wget https://gist.githubusercontent.com/apfeifer00/ea2b9e1dc23665867d60a1b340a85246/raw/94a2e60f23f2990fad79ffc481450c82a7b08a8d/concourse-postgresql-secrets.yaml
wget https://gist.githubusercontent.com/apfeifer00/ea2b9e1dc23665867d60a1b340a85246/raw/94a2e60f23f2990fad79ffc481450c82a7b08a8d/concourse-postgresql-svc.yaml
wget https://gist.githubusercontent.com/apfeifer00/ea2b9e1dc23665867d60a1b340a85246/raw/94a2e60f23f2990fad79ffc481450c82a7b08a8d/concourse-secrets.yaml
wget https://gist.githubusercontent.com/apfeifer00/ea2b9e1dc23665867d60a1b340a85246/raw/94a2e60f23f2990fad79ffc481450c82a7b08a8d/concourse-web-rc.yaml
wget https://gist.githubusercontent.com/apfeifer00/ea2b9e1dc23665867d60a1b340a85246/raw/94a2e60f23f2990fad79ffc481450c82a7b08a8d/concourse-worker-rc.yaml
wget https://gist.githubusercontent.com/apfeifer00/ea2b9e1dc23665867d60a1b340a85246/raw/94a2e60f23f2990fad79ffc481450c82a7b08a8d/concourse-web-svc.yaml


kubectl create -f concourse-worker-rc.yaml 
kubectl create -f concourse-web-svc.yaml 
kubectl create -f concourse-web-rc.yaml 
kubectl create -f concourse-secrets.yaml 
kubectl create -f concourse-postgresql-svc.yaml 
kubectl create -f concourse-postgresql-secrets.yaml 
kubectl create -f concourse-postgresql-rc.yaml 
