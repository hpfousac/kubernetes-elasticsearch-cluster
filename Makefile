help:
	@echo make install
	@echo make uninstall

install:
	kubectl create -f es-discovery-svc.yaml
	kubectl create -f es-svc.yaml
	kubectl create -f es-master.yaml
	kubectl rollout status -f es-master.yaml
	kubectl create -f es-ingest-svc.yaml
	kubectl create -f es-ingest.yaml
	kubectl rollout status -f es-ingest.yaml
	kubectl create -f es-data.yaml
	kubectl rollout status -f es-data.yaml
	kubectl create -f kibana-svc.yaml
	kubectl create -f kibana-cm.yaml
	kubectl create -f kibana.yaml
	kubectl rollout status -f kibana.yaml

uninstall:
	-kubectl delete -f kibana.yaml
	-kubectl delete -f kibana-cm.yaml
	-kubectl delete -f kibana-svc.yaml
	-kubectl delete -f es-data.yaml
	-kubectl delete -f es-ingest.yaml
	-kubectl delete -f es-ingest-svc.yaml
	-kubectl delete -f es-master.yaml
	-kubectl delete -f es-svc.yaml
	-kubectl delete -f es-discovery-svc.yaml

get:
	kubectl -n elasticsearch get all -o wide

