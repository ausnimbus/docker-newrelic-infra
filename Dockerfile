FROM centos/systemd

MAINTAINER AusNimbus <support@ausnimbus.com.au>


ENV INSTALL_SCRIPT https://75aae388e7629eec895d26b0943bbfd06288356953c5777d:@packagecloud.io/install/repositories/newrelic/infra-beta/script.rpm.sh

LABEL io.k8s.description="New Relic Linux Infrastructure Agent" \
      io.k8s.display-name="newrelic-infra"

RUN curl -s $INSTALL_SCRIPT | bash && \
    yum install newrelic-infra -y && \
    yum clean all && \
    systemctl enable newrelic-infra.service

COPY container-entrypoint /usr/bin/

ENTRYPOINT ["container-entrypoint"]
