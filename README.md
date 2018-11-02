# Notes

1. apiVersions
    - v1: componentStatus, configMap, Endpoints, Event, Namespace, Pod
    - apps/v1: ControllerRevision, StatefulSet, Deployment
2. Server SubTypes
    - ClusterIP: Exposes a set of pods to other objects in the cluster / more restricting / no one from the outside world
    - NodePort: Expose port to outside work (i.e. only for dev purposes)
    - LoadBalancer: Legacy way of getting traffic in... should use Ingress (only access to 1 set of pods)
    - Ingress: Expose services to traffic
      a) https://github.com/kubernetes/ingress-nginx (one used in the course)
      b) https://github.com/nginxinc/kubernetes-ingress
3. Ports
    - port: The port that ANOTHER container would use to access the service
    - targetPort: port the service is mapping to
    - nodePort: the browser port that you would access (30000-32767) / expose to the outside world
4. Declarative Deployment
    - Our container setup should look like this, make it happen
5. Update deployment with latest version of client
    - kubectl set image deployment/client-deployment client=happilymarrieddad/docker-complex-client:v2
6. Configure docker-cli to talk with Kubernetes local
    - eval $(minikube docker-env)
    - docker system prune
7. Secrets
    - kubectl create secret generic <name> --from-literal key=value
    - types
      a) generic - saving some arbitrary key values together
      b) dockerregistry - setup docker authentication
      c) tls - store set of tls keys

## Kubernetes deployment

1. PersistentVolumeClaims
    - AccessModes
      a. ReadWriteOnce - Can only be used by a single node
      b. ReadOnlyMany - Multiple nodes can read from this
      c. ReadWriteMany - Can be read and written to by many nodes
2. ingress-nginx - https://kubernetes.github.io/ingress-nginx/deploy/
    - kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
    - minikube addons enable ingress
3. ## Minikube dashboard

## Travis CI Automation

1. Google Cloud
    - Create new IAM user
    - Assign Kubernetes Admin role to account
    - Download json file
    - docker run -it -v $(pwd):/app ruby:2.3 sh
    - gem install travis --no-rdoc --no-ri
    - gem install travis
    - travis login
    - travis encrypt-file service-account.json -r happilymarrieddad/multi-k8s
    - add .enc file to git repository
    - copy to travis.yaml file 'openssl aes-256-cbc -K $encrypted_0c35eebf403c_key -iv $encrypted_0c35eebf403c_iv -in service-account.json.enc -out service-account.json -d'

2. install helm
3. use helm to install nginx-ingress