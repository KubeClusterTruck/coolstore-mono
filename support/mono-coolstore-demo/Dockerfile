# Update image to allow to run as Non-Root User on OpenShift from original Docker Image
FROM soa-monolith-dev/brms-coolstore-demo:latest
USER jboss
RUN mkdir -p /opt/jboss/brms/jboss-eap-7.0/standalone
USER root
RUN chgrp -R 0 /opt/jboss/brms/jboss-eap-7.0/standalone
RUN chmod -R g+rw /opt/jboss/brms/jboss-eap-7.0/standalone
RUN find /opt/jboss/brms/jboss-eap-7.0/standalone/log -type d -exec chmod g+x {} +
USER 1000
