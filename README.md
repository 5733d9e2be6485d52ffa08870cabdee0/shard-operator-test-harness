# Smart events Add-on Test Harness

It does the following:

* Tests for the existence of the fleetshard CRDs:
    * bridgeexecutors.com.redhat.service.bridge
    * bridgeingresses.com.redhat.service.bridge
* Writes out the files expected by the [osde2e](https://github.com/openshift/osde2e) test framework to the `/test-run-results` directory:
    * `junit-report.xml`
    * `addon-metadata.json`

## Running locally

To run the tests locally, build the test image and mount valid kubeconfig file

```
$ docker build -f Dockerfile -t shard-operator-test-harness:latest .
$ docker run --rm -v ~/.kube:/home/jboss/.kube/:z -it shard-operator-test-harness:latest
```

## Debug osde2e locally
https://github.com/openshift/osde2e#running-from-source
```
make build

OCM_TOKEN="[OCM token here]" \ 
CLUSTER_ID="24324324" \
ADDON_IDS="smart-events-operator" \ 
ADDON_TEST_HARNESSES="quay.io/5733d9e2be6485d52ffa08870cabdee0/shard-operator-test-harness" \
REPORT_DIR="./report" \
ADDON_PARAMETERS="{smart-events-operator: { "EVENT_BRIDGE_MANAGER_URL": "https://dummy.openshift.com", "EVENT_BRIDGE_SHARD_ID": "123456789", "EVENT_BRIDGE_SSO_CLIENT_ID": "23480-324324-324324", "EVENT_BRIDGE_SSO_SECRET": "324324-3253324-324", "EVENT_BRIDGE_SSO_URL": "https://dummy/auth/realms/redhat-external", "WEBHOOK_CLIENT_ID": "wf23423-dsaf23-sdf32", "WEBHOOK_CLIENT_SECRET": "sfs24f-234dsf-243fd", "WEBHOOK_TECHNICAL_ACCOUNT_ID": "1234567" }}"
./out/osde2e test --configs "stage,addon-suite" --skip-health-check
```
