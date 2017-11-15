# Update image to allow to run as Non-Root User on OpenShift from original Docker Image
FROM soa-monolith-dev/brms-coolstore-demo:latest
USER jboss
RUN mkdir -p /opt/jboss/brms/jboss-eap-7.0/standalone && mkdir -p /opt/jboss/brms/jboss-eap-7.0/bin/.niogit
USER root
RUN chgrp -R 0 /opt/jboss/brms/jboss-eap-7.0/standalone && chgrp -R 0 /opt/jboss/brms/jboss-eap-7.0/bin/.niogit
RUN chmod -R g+rw /opt/jboss/brms/jboss-eap-7.0/standalone && chmod -R g+rw /opt/jboss/brms/jboss-eap-7.0/bin/.niogit
RUN find /opt/jboss/brms/jboss-eap-7.0/standalone -type d -exec chmod g+x {} + && find /opt/jboss/brms/jboss-eap-7.0/bin/.niogit
USER 1000
