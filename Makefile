PHONY: download-crd-kluctl-controller create-changelog-kluctl-controller bump-chart-version-kluctl-controller generate-readme-kluctl-controller

# Download the CRDs the kluctl-controller Helm chart depends on
download-crd-kluctl-controller:
	$(eval SOURCE_VER := $(shell cat charts/flux-kluctl-controller/Chart.yaml | grep -Po '(?<=appVersion: )[^;]+' | tr -d '"'))
	curl -s https://raw.githubusercontent.com/kluctl/flux-kluctl-controller/${SOURCE_VER}/config/crd/bases/flux.kluctl.io_kluctldeployments.yaml > charts/flux-kluctl-controller/crds/flux.kluctl.io_kluctldeployments.yaml
	curl -s https://raw.githubusercontent.com/kluctl/flux-kluctl-controller/${SOURCE_VER}/config/crd/bases/flux.kluctl.io_kluctlmultideployments.yaml > charts/flux-kluctl-controller/crds/flux.kluctl.io_kluctlmultideployments.yaml

# Generate README for the kluctl-controller Helm chart
generate-readme-kluctl-controller:
	docker run --rm --volume "${PWD}:/helm-docs" jnorwood/helm-docs:latest helm-docs --chart-search-root=charts/flux-kluctl-controller

# Create the changelog for the kluctl-controller Helm chart
create-changelog-kluctl-controller:
	docker run --rm -v "${PWD}:/tmp" -w /tmp convco/convco changelog --prefix "flux-kluctl-controller-" -P charts/flux-kluctl-controller > charts/flux-kluctl-controller/CHANGELOG.md

# Bumps the Chart.yaml of the kluctl-controller Helm chart based on Conventional Commits
bump-chart-version-kluctl-controller:
	git fetch --tags
	$(eval NEXT_VERSION := $(shell docker run --rm -v "${PWD}:/tmp" -w /tmp convco/convco version --prefix "flux-kluctl-controller-" --bump -P charts/flux-kluctl-controller))
	sed -i "s/^version: .*/version: ${NEXT_VERSION}/" charts/flux-kluctl-controller/Chart.yaml

# Prepares the release with changelog, readme and version bump of Chart.yaml
prepare-release-kluctl-controller: create-changelog-kluctl-controller bump-chart-version-kluctl-controller generate-readme-kluctl-controller

# Create release commits with bump, changelog and readme
create-release-commit-kluctl-controller:
	$(eval NEXT_VERSION := $(shell docker run --rm -v "${PWD}:/tmp" -w /tmp convco/convco version --prefix "flux-kluctl-controller-" --bump -P charts/flux-kluctl-controller))
	git add charts/flux-kluctl-controller/README.md && git commit --signoff -m "docs(flux-kluctl-controller): Update Readme" charts/flux-kluctl-controller/README.md
	git add charts/flux-kluctl-controller/CHANGELOG.md && git commit --signoff -m "docs(flux-kluctl-controller): Update Changelog" charts/flux-kluctl-controller/CHANGELOG.md
	git add charts/flux-kluctl-controller/Chart.yaml && git commit --signoff -m "chore(flux-kluctl-controller): Bump chart to ${NEXT_VERSION}" charts/flux-kluctl-controller/Chart.yaml


