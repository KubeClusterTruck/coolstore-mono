# Use jbossdemocentral/developer as the base
FROM jbossdemocentral/developer:jdk8-uid

# Maintainer details
MAINTAINER Greg Hoelzer with Original Contributors Andrew Block, Eric D. Schabell, Duncan Doylle, Jaen Swart

# Environment Variables
ENV BRMS_HOME /opt/jboss/brms/jboss-eap-7.0
ENV BRMS_VERSION_MAJOR 6
ENV BRMS_VERSION_MINOR 4
ENV BRMS_VERSION_MICRO 0
ENV BRMS_VERSION_PATCH GA

ENV EAP_VERSION_MAJOR 7
ENV EAP_VERSION_MINOR 0
ENV EAP_VERSION_MICRO 0
#ENV EAP_VERSION_PATCH 7

ENV EAP_INSTALLER=jboss-eap-$EAP_VERSION_MAJOR.$EAP_VERSION_MINOR.$EAP_VERSION_MICRO-installer.jar
ENV BRMS_DEPLOYABLE=jboss-brms-$BRMS_VERSION_MAJOR.$BRMS_VERSION_MINOR.$BRMS_VERSION_MICRO.$BRMS_VERSION_PATCH-deployable-eap7.x.zip

# ADD Installation Files
COPY support/installation-eap support/installation-eap.variables installs/$BRMS_DEPLOYABLE installs/$EAP_INSTALLER  /opt/jboss/

# Update Permissions on Installers
USER root
RUN chown 1000:1000 /opt/jboss/$EAP_INSTALLER /opt/jboss/$BRMS_DEPLOYABLE
USER 1000

# Prepare and run installer and cleanup installation components
RUN sed -i "s:<installpath>.*</installpath>:<installpath>$BRMS_HOME</installpath>:" /opt/jboss/installation-eap \
    && java -jar /opt/jboss/$EAP_INSTALLER /opt/jboss/installation-eap -variablefile /opt/jboss/installation-eap.variables \
    #&& $BRMS_HOME/bin/jboss-cli.sh --command="patch apply /opt/jboss/jboss-eap-$EAP_VERSION_MAJOR.$EAP_VERSION_MINOR.$EAP_VERSION_PATCH-patch.zip --override-all" \
    && unzip -qo /opt/jboss/$BRMS_DEPLOYABLE  -d $BRMS_HOME/.. \
    && rm -rf /opt/jboss/$BRMS_DEPLOYABLE /opt/jboss/$EAP_INSTALLER /opt/jboss/installation-eap /opt/jboss/installation-eap.variables $BRMS_HOME/standalone/configuration/standalone_xml_history/

