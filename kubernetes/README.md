# Kubernetes setup

## Setup Traefik Reverse Proxy
Following instructions here: [https://doc.traefik.io/traefik/getting-started/install-traefik/#use-the-helm-chart] and [https://artifacthub.io/packages/helm/traefik/traefik]

### Create a dedicate traefik namespace
```shell
$ kubectl create ns traefik
```

### Add Traefik Labs chart repository
```shell
$ helm repo add traefik https://traefik.github.io/charts
$ helm repo update
```

### Install traefik
```shell
$ helm install --values=./traefik/helm-values.yaml --namespace=traefik traefik traefik/traefik
```

### Create traefik dashboard IngressRoute
```shell
$ kubectl apply -f ./traefik/ingress.yaml
```

Access to traefik dashboard using [http://traefik.internal/dashboard/]

## Setup Monitoring

### Create a dedicate monitoring namespace
```shell
$ kubectl create ns monitoring
```

### Add Prometheus Community chart repository
```shell
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
```

### Install Prometheus
```shell
$ helm install --values=./monitoring/prometheus/helm-values.yaml --namespace=monitoring monitoring-prometheus prometheus-community/prometheus
```

### Create Prometheus dashboard IngressRoute
```shell
$ kubectl apply -f ./monitoring/prometheus/ingress.yaml -n monitoring
```

Access to prometheus dashboard using [http://prometheus.internal/]


### Add Grafana chart repository
```shell
$ helm repo add grafana https://grafana.github.io/helm-charts
$ helm repo update
```

### Install Grafana
```shell
$ helm install --values=./monitoring/grafana/helm-values.yaml --namespace=monitoring monitoring-grafana grafana/grafana
```

### Create Grafana dashboard IngressRoute
```shell
$ kubectl apply -f ./monitoring/grafana/ingress.yaml -n monitoring
```

Access to grafana dashboard using [http://grafana.internal/]

## Setup Gitlab Runners

### Add Gitlab chart repository
```shell
$ helm repo add gitlab https://charts.gitlab.io
$ helm repo update
```

### Install Gitlab Runner
```shell
$ kubectl create ns gitlab
$ helm install --values=./gitlab/helm-values.yaml --namespace=gitlab gitlab-runner gitlab/gitlab-runner
```