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

## Contribute

In order to contribute please create a pull request and read the following guidelines depending on your type of change.

***
__IMPORTANT:__ Because this project follows the [conventional commit specification](https://www.conventionalcommits.org/en/v1.0.0/), each commit for a chart needs to include the type as well as the corresponding scope so that our tooling can determine the new chart version automatically (e.g. `feat(flux-kluctl-controller): this a valid commit`).
***

### General information

- Check that all commits are signed with a valid GPG key and that each commit includes a sign-off to certify that you accept the https://developercertificate.org/.
- Check that the charts are still working by running `task template-all-charts`.
- Check that all charts are formatted correctly by running `task lint-all-charts`.

### Bump the operator version

1. Check the version of the operator and replace it in the `appVersion` of the chart.
2. Update the CRDs by running `task download-crds-CHART_FOLDER` (Check if any new CRDs are introduced as part of the new operator version and add them to the task inside `Taskfile.yml`).
3. Update the RBAC resources by running `task download-rbac-CHART_FOLDER` (Check if any new RBAC resources are introduced as part of the new operator version and add them to the task inside `Taskfile.yml`).
4. Create a commit following the conventional commit specification (__Don't miss the scope!__).
5. Check if all charts are still working by running `task template-all-charts`.
6. Check if all charts are formatted correctly by running `task lint-all-charts`.
7. Create a pull request.

### Introduce changes to a chart
1. Change something in a chart.
2. Create one or multiple commits following the conventional commit specification (__Don't miss the scope!__).
3. Check if all charts are still working by running `task template-all-charts`.
4. Check if all charts are formatted correctly by running `task lint-all-charts`.
7. Create a pull request.

### Create a new release
1. Check if all charts are still working by running `task template-all-charts`.
2. Check if all charts are formatted correctly by running `task lint-all-charts`.
3. Prepare the release (Bump chart, Create Changelog, Create README) by running `task prepare-release-CHART_FOLDER`.
4. Create the release commit by running `task create-release-commit-CHART_FOLDER`.
5. Create a pull request.

![](install-charts.gif)

