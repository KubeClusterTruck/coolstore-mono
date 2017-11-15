**Login to Labs Docker Repo -

docker login -p [OCP User Token] -u unused -e unused https://docker-registry-default.apps.c7.core.rht-labs.com

**Tag Local Image -

docker tag jbossdemocentral/brms-coolstore-demo docker-registry-default.apps.c7.core.rht-labs.com/[CP Project]/brms-coolstore-demo

**Push Image to Registry -
  
docker push docker-registry-default.apps.c7.core.rht-labs.com/[OCP Project]/brms-coolstore-demo
