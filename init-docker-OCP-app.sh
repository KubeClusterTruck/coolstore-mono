#!/bin/sh
DEMO="JBoss BRMS Red Hat Cool Store Demo"
AUTHORS1="Jason Milliron, Andrew Block,"
AUTHORS2="AMahdy AbdElAziz, Eric D. Schabell"
AUTHORS3="Duncan Doyle, Jaen Swart"
PROJECT="git@github.com:jbossdemocentral/brms-coolstore-demo.git"
PRODUCT="JBoss BRMS"
DOCKERFILE="support/docker-OCP-app/Dockerfile"

# wipe screen.
clear

echo
echo "##############################################################"
echo "##                                                          ##"
echo "##  Setting up the ${DEMO}       ##"
echo "##                                                          ##"
echo "##                                                          ##"
echo "##             ####   ####    #   #    ###                  ##"
echo "##             #   #  #   #  # # # #  #                     ##"
echo "##             ####   ####   #  #  #   ##                   ##"
echo "##             #   #  #  #   #     #     #                  ##"
echo "##             ####   #   #  #     #  ###                   ##"
echo "##                                                          ##"
echo "##                                                          ##"
echo "##  brought to you by,                                      ##"
echo "##                     ${AUTHORS1}        ##"
echo "##                     ${AUTHORS2}   ##"
echo "##                     ${AUTHORS3}             ##"
echo "##                                                          ##"
echo "##  ${PROJECT} ##"
echo "##                                                          ##"
echo "##############################################################"
echo

# make some checks first before proceeding.

cp $DOCKERFILE .

echo Starting Docker build.
echo

docker build -t jbossdemocentral/brms-coolstore-app .

if [ $? -ne 0 ]; then
        echo
        echo Error occurred during Docker build!
        echo Consult the Docker build output for more information.
        exit
fi

echo Docker build finished.
echo

rm Dockerfile

echo
echo "==================================================================================="
echo "=                                                                                 ="
echo "=  You can now start the $PRODUCT in a Docker container with:                   ="
echo "=                                                                                 ="
echo "=  docker run -it -p 8080:8080 -p 9990:9990 jbossdemocentral/brms-coolstore-demo  ="
echo "=                                                                                 ="
echo "=  Login into business central at:                                                ="
echo "=                                                                                 ="
echo "=    http://localhost:8080/business-central  (u:brmsAdmin / p:jbossbrms1!)        ="
echo "=                                                                                 ="
echo "=  Login into the Coostore application at:                                        ="
echo "=                                                                                 ="
echo "=    http://localhost:8080/brms-coolstore-demo                                    ="
echo "=                                                                                 ="
echo "=                                                                                 ="
echo "=  $PRODUCT $VERSION $DEMO Setup Complete.                   ="
echo "=                                                                                 ="
echo "==================================================================================="
