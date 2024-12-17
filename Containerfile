FROM registry.redhat.io/ubi8

RUN dnf -y update && dnf clean all && \

    INSTALL_PKGS="\
                 bind-utils \
                 iproute \
                 net-tools \
                 dnsmasq" \
                 && \

    dnf install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS
             
ENTRYPOINT dnsmasq --no-daemon --server=/#/ --log-facility=- --log-queries