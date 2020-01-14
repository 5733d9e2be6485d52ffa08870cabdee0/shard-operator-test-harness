FROM registry.svc.ci.openshift.org/openshift/release:golang-1.13

ENV PKG=/go/src/github.com/meowfaceman/prow-operator-test-harness/
WORKDIR ${PKG}

# compile test binary
COPY . .
RUN make

FROM registry.access.redhat.com/ubi7/ubi-minimal:latest

COPY prow-operator-test-harness.test /prow-operator-test-harness.test

ENTRYPOINT [ "/prow-operator-test-harness.test" ]

