# Update image to allow to run as Non-Root User on OpenShift from original Docker Image
FROM brms-coolstore-demo:latest
USER root
# RUN chgrp -R 0 /opt/jboss/brms/jboss-eap-7.0/standalone && chgrp -R 0 /opt/jboss/brms/jboss-eap-7.0/bin/.niogit && chgrp -R 0 /opt/jboss/.m2/repository && chgrp -R 0 /opt/jboss/brms/jboss-eap-7.0/bin/.index
RUN chgrp -R 0 /opt/jboss 
RUN chmod -R g+rw /opt/jboss
RUN find /opt/jboss -type d -exec chmod g+x {} + 
USER 1000
