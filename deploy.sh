#! /bin/bash

docker build -t utumno86/fibonacci-client ./DockerKubernetesCourse/fibonacci/client
docker build -t utumno86/fibonacci-server ./DockerKubernetesCourse/fibonacci/server
docker build -t utumno86/fibonacci-worker ./DockerKubernetesCourse/fibonacci/worker

docker push utumno86/fibonacci-client
docker push utumno86/fibonacci-server
docker push utumno86/fibonacci-worker

kubectl apply -f ./DockerKubernetesCourse/fibonacci/k8s