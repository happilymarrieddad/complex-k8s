docker build -t happilymarrieddad/docker-complex-client:latest -t happilymarrieddad/docker-complex-client:$SHA -f ./client/Dockerfile ./client
docker build -t happilymarrieddad/docker-complex-server:latest -t happilymarrieddad/docker-complex-server:$SHA -f ./server/Dockerfile ./server
docker build -t happilymarrieddad/docker-complex-worker:latest -t happilymarrieddad/docker-complex-worker:$SHA -f ./worker/Dockerfile ./worker

docker push happilymarrieddad/docker-complex-client:latest
docker push happilymarrieddad/docker-complex-server:latest
docker push happilymarrieddad/docker-complex-worker:latest

docker push happilymarrieddad/docker-complex-client:$SHA
docker push happilymarrieddad/docker-complex-server:$SHA
docker push happilymarrieddad/docker-complex-worker:$SHA

kubectl apply -f ./k8s

kubectl set image deployments/server-deployment server=happilymarrieddad/docker-complex-server:$SHA
kubectl set image deployments/client-deployment client=happilymarrieddad/docker-complex-client:$SHA
kubectl set image deployments/worker-deployment worker=happilymarrieddad/docker-complex-worker:$SHA
