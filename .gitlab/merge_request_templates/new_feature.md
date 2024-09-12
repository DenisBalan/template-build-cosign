## Presentation

(Necessarily link to an issue. If it doesn't exist, please create one.)

Closes #999


## Checklist

* General:
    * [ ] use [rules](https://docs.gitlab.com/ee/ci/yaml/#rules) instead of [only/except](https://docs.gitlab.com/ee/ci/yaml/#onlyexcept-advanced)
    * [ ] optimized [cache](https://docs.gitlab.com/ee/ci/caching/) configuration (wherever applicable)
* Publicly usable:
    * [ ] untagged runners
    * [ ] no proxy configuration but support `http_proxy`/`https_proxy`/`no_proxy`
    * [ ] no custom CA certificate(s) but supports `$CUSTOM_CA_CERTS` or `$DEFAULT_CA_CERTS` to declare custom CA certificate(s)
    * [ ] internet hostnames/urls only
* Used Docker images:
    * [ ] **public** images
    * [ ] **official** images (when possible)
    * [ ] `latest` tag (when possible)
* Documented:
    * [ ] `README.md` documents the new feature
    * [ ] `kicker.json` describes the new feature
* Tested & examplified:
    * [ ] (url to a project sample successfully using the new feature)


/label ~"kind/enhancement"
