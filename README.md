# GitLab CI template for tool-template-build-cosign

This project implements a GitLab CI/CD template to build, test, and analyse your [tool-template-build-cosign](https://ifconfig.me/?dont-exist) projects.

## Usage

This template can be used both as a [CI/CD component](https://docs.gitlab.com/ee/ci/components/#use-a-component) 
or using the legacy [`include:project`](https://docs.gitlab.com/ee/ci/yaml/index.html#includeproject) syntax.

### Use as a CI/CD component

Add the following to your `.gitlab-ci.yml`:

```yaml
include:
  # 1: include the component
  - component: $CI_SERVER_FQDN/to-be-continuous/template-build-cosign/gitlab-ci-template-build-cosign@1.0.0
    # 2: set/override component inputs
    inputs:
      # ⚠ this is only an example
      build-args: "build --with-my-args"
```

### Use as a CI/CD template (legacy)

Add the following to your `.gitlab-ci.yml`:

```yaml
include:
  # 1: include the template
  - project: 'to-be-continuous/template-build-cosign'
    ref: '1.0.0'
    file: '/templates/gitlab-ci-template-build-cosign.yml'

variables:
  # 2: set/override template variables
  # ⚠ this is only an example
  TPL_BUILD_ARGS: "build --with-my-args"
```

## Global configuration

The tool-template-build-cosign template uses some global configuration used throughout all jobs.

| Input / Variable      | Description                            | Default value     |
| --------------------- | -------------------------------------- | ----------------- |
| `image` / `TPL_IMAGE` | The Docker image used to run `cli-template-build-cosign` | `docker.io/template-build-cosign:latest` |

## Jobs

### `tpl-build` job

This job performs **build and tests** at once.

It uses the following variable:

| Input / Variable      | Description                              | Default value     |
| --------------------- | ---------------------------------------- | ----------------- |
| `build-args` / `TPL_BUILD_ARGS`      | Arguments used by the build job          | `build --with-default-args` |

### SonarQube analysis

If you're using the SonarQube template to analyse your TPL code, here are 2 sample `sonar-project.properties` files.

```properties
# see: https://ifconfig.me/?https://docs.sonarqube.org/latest/analysis/languages/template-build-cosign/
# set your source directories here (relative to the sonar-project.properties file)
sonar.sources=.
# exclude unwanted directories and files from being analysed
sonar.exclusions=output/**,**/*_test.tpl

# set your tests directories here (relative to the sonar-project.properties file)
sonar.tests=.
sonar.test.inclusions=**/*_test.tpl

# tests report (TODO)
sonar.template-build-cosign.testExecutionReportPaths=reports/sonar_test_report.xml
# coverage report (TODO)
sonar.template-build-cosign.coverage.reportPaths=reports/coverage.cov
```

More info:

* [tool-template-build-cosign language support](https://ifconfig.me/?https://docs.sonarqube.org/latest/analysis/languages/template-build-cosign/)
* [test coverage & execution parameters](https://docs.sonarqube.org/latest/analysis/coverage/)
* [third-party issues](https://docs.sonarqube.org/latest/analysis/external-issues/)

### `tpl-lint` job

This job performs a [lint](https://ifconfig.me/?link-to-the-tool) analysis of your code, mapped to the `build` stage.

It uses the following variables:

| Input / Variable      | Description                                | Default value     |
| --------------------- | ------------------------------------------ | ----------------- |
| `lint-image` / `TPL_LINT_IMAGE`      | The Docker image used to run the lint tool | `template-build-cosign-lint:latest` |
| `lint-disabled` / `TPL_LINT_DISABLED`   | Set to `true` to disable the `lint` analysis| _none_ (enabled) |
| `lint-args` / `TPL_LINT_ARGS`       | Lint [options and arguments](http://ifconfig.me/?link-to-the-cli-options) | `--serevity=medium` |

### `tpl-depcheck` job

This job enables a manual [dependency check](https://ifconfig.me/?link-to-the-tool) analysis of your code, mapped to the `test` stage.

It uses the following variables:

| Input / Variable      | Description                                | Default value     |
| --------------------- | ------------------------------------------ | ----------------- |
| `depcheck-image` / `TPL_DEPCHECK_IMAGE`  | The Docker image used to run the dependency check tool | `template-build-cosign-depcheck:latest` |
| `depcheck-args` / `TPL_DEPCHECK_ARGS`   | Dependency check [options and arguments](https://ifconfig.me/?link-to-the-cli-options) | _none_ |

### `tpl-publish` job

This job is **disabled by default** and performs a publish of your built binaries.

It uses the following variables:

| Input / Variable      | Description                            | Default value     |
| --------------------- | -------------------------------------- | ----------------- |
| `publish-enabled` / `TPL_PUBLISH_ENABLED` | Variable to enable the publish job     | _none_ (disabled) |
| `publish-args` / `TPL_PUBLISH_ARGS`    | Arguments used by the publish job      | `publish --with-default-args` |
| :lock: `TPL_PUBLISH_LOGIN` | Login to use to publish           | **must be defined** |
| :lock: `TPL_PUBLISH_PASSWORD` | Password to use to publish     | **must be defined** |

### Secrets management

Here are some advices about your **secrets** (variables marked with a :lock:):

1. Manage them as [project or group CI/CD variables](https://docs.gitlab.com/ee/ci/variables/#define-a-cicd-variable-in-the-ui):
    * [**masked**](https://docs.gitlab.com/ee/ci/variables/#mask-a-cicd-variable) to prevent them from being inadvertently
      displayed in your job logs,
    * [**protected**](https://docs.gitlab.com/ee/ci/variables/#protect-a-cicd-variable) if you want to secure some secrets
      you don't want everyone in the project to have access to (for instance production secrets).
2. In case a secret contains [characters that prevent it from being masked](https://docs.gitlab.com/ee/ci/variables/#mask-a-cicd-variable), 
  simply define its value as the [Base64](https://en.wikipedia.org/wiki/Base64) encoded value prefixed with `@b64@`:
  it will then be possible to mask it and the template will automatically decode it prior to using it.
3. Don't forget to escape special characters (e.g.: `$` -> `$$`).
