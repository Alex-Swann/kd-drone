
FROM quay.io/ukhomeofficedigital/kd:v1.14.0

ENV version=v1.2.4

RUN apk upgrade --no-cache && apk add --no-cache bash curl ca-certificates
RUN curl -s https://raw.githubusercontent.com/UKHomeOffice/dsp-root-ca/master/root-ca.pem > /usr/local/share/ca-certificates/dsp_root_ca.crt && \
    curl -s https://raw.githubusercontent.com/UKHomeOffice/dsp-root-ca/master/intermediate-ca.pem > /usr/local/share/ca-certificates/dsp_intermediate_ca.crt && \
    update-ca-certificates && \
    curl -Ls https://github.com/drone/drone-cli/releases/download/${version}/drone_linux_amd64.tar.gz | tar -C /usr/local/bin -zx

ENTRYPOINT ["/bin/bash"]
