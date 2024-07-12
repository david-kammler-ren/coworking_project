kubectl apply -f pvc.yaml
kubectl apply -f pv.yaml
kubectl apply -f postgresql-deployment.yaml

kubectl get pods
sleep 30
kubectl get pods

# further manual checks afterwards
#  kubectl exec -it <podname> -- bash
# in the pod:
#  psql -U david -d coworking_db
# inside the db:
#  \l
