# Update image to allow to run as Non-Root User on OpenShift from original Docker Image
FROM soa-monolith-dev/brms-coolstore-demo:latest
USER jboss
RUN mkdir -p /opt/jboss/brms/jboss-eap-7.0/standalone && mkdir -p /opt/jboss/brms/jboss-eap-7.0/bin/.niogit && mkdir -p /opt/jboss/.m2/repository && mkdir -p /opt/jboss/brms/jboss-eap-7.0/bin/.index/datasets
USER root
RUN chgrp -R 0 /opt/jboss/brms/jboss-eap-7.0/standalone && chgrp -R 0 /opt/jboss/brms/jboss-eap-7.0/bin/.niogit && chgrp -R 0 /opt/jboss/.m2/repository && chgrp -R 0 /opt/jboss/brms/jboss-eap-7.0/bin/.index/datasets
RUN chmod -R g+rw /opt/jboss/brms/jboss-eap-7.0/standalone && chmod -R g+rw /opt/jboss/brms/jboss-eap-7.0/bin/.niogit && chmod -R g+rw /opt/jboss/.m2/repository && chmod -R g+rw /opt/jboss/brms/jboss-eap-7.0/bin/.index/datasets
RUN find /opt/jboss/brms/jboss-eap-7.0/standalone -type d -exec chmod g+x {} + && find /opt/jboss/brms/jboss-eap-7.0/bin/.niogit -type d -exec chmod g+x {} +  && find /opt/jboss/.m2/repository -type d -exec chmod g+x {} + && find /opt/jboss/brms/jboss-eap-7.0/bin/.index/datasets -type d -exec chmod g+x {} + 
USER 1000
