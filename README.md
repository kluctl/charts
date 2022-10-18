# The Kluctl Library for Kubernetes

[Helm Charts](https://github.com/helm/helm) provided by [kluctl](https://kluctl.io).

### Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+


## Install

```bash
$ helm repo add kluctl http://kluctl.github.io/charts
$ helm search repo kluctl
$ helm install my-release kluctl/<chart>
```

![](install-charts.gif)
