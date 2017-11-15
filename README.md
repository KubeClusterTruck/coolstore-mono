JBoss BRMS Suite Cool Store Monolith Demo
================================
This is a retail web store demo where you will find rules, decision tables, events, and a ruleflow
that is leveraged by a web application. The web application is a WAR built using the JBoss BRMS
generated project as a dependency, providing an example project showing how developers can focus on the
application code while the business analysts can focus on rules, events, and ruleflows in the
JBoss BRMS product web based dashboard.

This demo is self contained, it uses a custom maven settings to deploy all built JBoss BRMS knowledge artifacts
into an external maven repository (not your local repository), in /tmp/maven-repo.

Tor using this demo a local Docker build, push to an OpenShift Enterprise Repo, then S2I/Docker File Build will be executed to describe the steps of Containerizing a Legacy J2EE App, and then typical changes needed for a Developer created Container to deploy/run on OpenShift Enterprise.

Software
--------
The following software is required to run this demo:
- [JBoss EAP 7.0 installer](https://developers.redhat.com/download-manager/file/jboss-eap-7.0.0-installer.jar)
- [JBoss BRMS 6.4.0.GA deployable for EAP 7](https://developers.redhat.com/download-manager/content/origin/files/sha256/14/148eb9be40833d5da00bb6108cbed1852924135d25ceb6c601c62ba43f99f372/jboss-brms-6.4.0.GA-deployable-eap7.x.zip)
- Git client
- Maven 3.2+
- [7-Zip](http://www.7-zip.org/download.html) (Windows only): to overcome the Windows 260 character path length limit, we need 7-Zip to unzip the BRMS deployable.


Build/Run Developement Docker Container on Local Machine
-----------------------------------------
The following steps can be used to configure and run the demo in a container

1. Clone this Repo to a local working directory

2. Add the EAP installer and BPM Suite deployable to installs directory.

3. Run the 'init-docker.sh' or 'init-docker.ps1' file.

4. Start the container: `docker run -it -p 8080:8080 -p 9990:9990 jbossdemocentral/brms-coolstore-demo`

5. Open shopping cart and smoke test container locally  (http://&lt;DOCKER_HOST&gt;:8080/brms-coolstore-demo)

Additional information can be found in the jbossdemocentral container [developer repository](https://github.com/jbossdemocentral/docker-developer)

Build/Deploy Container Application to OpenShift Enterprise
-----------------------------------------
The following steps can be used to push the local image to OpenShift and Build/Run non-privileged container on OpenShift

1. Create an OpenShift project to Build/Deploy Application

2. Tag/Push local Docker Image to your OpenShift Project, follow instructions [here](https://github.com/mono2micro/coolstore-mono/blob/master/support/docker-OCP/README.md)

3. Create Application in OpenShift using the Docker File Build Strategy, execute the following **oc command**
```
oc new-app [OpenShift Project]/brms-coolstore-demo
```
4. Expose the created service as a Route, execute the following **oc command**
```
oc expose service brms-coolstore-demo --port=8080 --path=/brms-coolstore-demo/
```
5. Open a Browser using the newly created Route in OpenShift to validate the deployed Application

Released versions
-----------------
See the tagged releases for the following versions of the product:

- v3.8 JBoss BRMS 6.4.0.GA on JBoss EAP 7.0.0.GA with cool store installed and RH CDK on OSE Cloud install option.

- v3.7 JBoss BRMS 6.3.0 on JBoss EAP 6.4.7 with cool store installed and RH CDK on OSE Cloud install option.

![Announcement Sign](https://github.com/jbossdemocentral/brms-coolstore-demo/blob/master/docs/demo-images/announce-sign.jpg?raw=true)

[![Video bpmPaaS CoolStore](https://github.com/jbossdemocentral/brms-coolstore-demo/blob/master/docs/demo-images/video-brms-coolstore-demo.png?raw=true)](https://vimeo.com/ericschabell/brms-coolstore-demo)

[![Video bpmPaaS CoolStore](https://github.com/jbossdemocentral/brms-coolstore-demo/blob/master/docs/demo-images/video-bpmpaas-coolstore.png?raw=true)](http://vimeo.com/ericschabell/bpmpaas-brms-coolstore-demo)

![Decision Table](https://github.com/jbossdemocentral/brms-coolstore-demo/blob/master/docs/demo-images/coolstore-decision-table.png?raw=true)

![Domain Model](https://github.com/jbossdemocentral/brms-coolstore-demo/blob/master/docs/demo-images/coolstore-model.png?raw=true)
