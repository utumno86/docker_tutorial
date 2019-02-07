#! /bin/bash

docker build -t utumno86/fibonacci-client:latest -t utumno86/fibonacci-client:$SHA ./DockerKubernetesCourse/fibonacci/client
docker build -t utumno86/fibonacci-server:latest -t utumno86/fibonacci-server:$SHA ./DockerKubernetesCourse/fibonacci/server
docker build -t utumno86/fibonacci-worker:latest -t utumno86/fibonacci-worker:$SHA ./DockerKubernetesCourse/fibonacci/worker

docker push utumno86/fibonacci-client:latest
docker push utumno86/fibonacci-server:latest
docker push utumno86/fibonacci-worker:latest

docker push utumno86/fibonacci-client:$SHA
docker push utumno86/fibonacci-server:$SHA
docker push utumno86/fibonacci-worker:$SHA

kubectl apply -f ./DockerKubernetesCourse/fibonacci/k8s
kubectl set image deployments/server-deployment server=utumno86/fibonacci-server:$SHA
kubectl set image deployments/client-deployment client=utumno86/fibonacci-client:$SHA
kubectl set image deployments/worker-deployment worker=utumno86/fibonacci-worker:$SHA