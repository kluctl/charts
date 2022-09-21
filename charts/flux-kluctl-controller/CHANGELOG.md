# Changelog

## [Unreleased](https://github.com/kluctl/charts/compare/flux-kluctl-controller-0.1.0...HEAD) (2022-09-21)

### Features

* **flux-kluctl-controller:** support independent toggling of service accounts
  ([0a2d0dc](https://github.com/kluctl/charts/commit/0a2d0dc9ca2e77d5c44709af5abc7bf0c8fc3302))
* **flux-kluctl-controller:** split up rbac in clusterroles and roles
  ([3709b0d](https://github.com/kluctl/charts/commit/3709b0d104c2ac076903f3ae1251651b8d7b6742))
* **flux-kluctl-controller:** add rbac and use separate service account for reconciliation
  ([02c8e1e](https://github.com/kluctl/charts/commit/02c8e1e00b104a443d851e7ddd9cd8ac4a3baa7c))
* **flux-kluctl-controller:** upgrade controller to 0.6.2
  ([d8af41a](https://github.com/kluctl/charts/commit/d8af41a6131383c02088b3e88ac86f919c5245b8))
* **flux-kluctl-controller:** remove obsolete kluctlmultideployments.flux.kluctl.io crd
  ([f9e2939](https://github.com/kluctl/charts/commit/f9e293911d5bd8631c9fb806c46477044013a147))

### Fixes

* **flux-kluctl-controller:** use --default-service-account
  ([b963066](https://github.com/kluctl/charts/commit/b96306668d5f236fc4a9557d3dbecef4e1d683d1))

## flux-kluctl-controller-0.1.0 (2022-09-13)

### Features

* **flux-kluctl-controller:** initial commit
  ([c4357c0](https://github.com/kluctl/charts/commit/c4357c0bf2bcbe194b057091df9e9ea1723457ca))

### Fixes

* **flux-kluctl-controller:** remove unneeded service types from values.yaml
  ([d0d9015](https://github.com/kluctl/charts/commit/d0d9015e4cdbc391f97be651a84e86a249ba713f))
* **flux-kluctl-controller:** use port param in service
  ([5e7d480](https://github.com/kluctl/charts/commit/5e7d48009bfbf24d7f2c18c667e41f52ec3fc6b1))
* **flux-kluctl-controller:** pin container port and protocol in deployment
  ([5c5e526](https://github.com/kluctl/charts/commit/5c5e5268baefe07357c086dd299c94e14085928c))
* **flux-kluctl-controller:** remove obsolete ingress spec
  ([c0ad9ef](https://github.com/kluctl/charts/commit/c0ad9ef5f6399e2e04ee2849473e764a9627dbe9))
