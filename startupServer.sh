#!/bin/sh 
DEMO="JBoss A-MQ Biomedical Signals Sensor Demo"
VERSION=6.1.0
AMQ=jboss-a-mq-6.1.0.redhat-379
AMQ_BIN=jboss-a-mq-6.1.0.redhat-379.zip
DEMO_HOME=./target
AMQ_HOME=$DEMO_HOME/$AMQ
SERVER_CONF=$AMQ_HOME/etc
SRC_DIR=./installs
PRJ_DIR=./projects/amqp-example-web



echo
echo "Starting up Dashboard Web Server...."
echo

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }


if [ ! -x $DEMO_HOME ]; then
		echo "  - Checking JBoss A-MQ installation failed! Please run init.sh to setup first";
		exit 1;
else
		echo "  - JBoss A-MQ installed Checked!"
		echo
fi

if [ ! -x $PRJ_DIR/target ]; then
		echo "  - Checking Biomedical Signals Sensor Monitor DashBoard project failed! Please run init.sh to setup first";
		exit 1;
else
		echo "  - Biomedical Signals Sensor Monitor DashBoard installed Checked!"
		echo
fi

echo "Enter [y] to start Dashboard, other key to skip startup: "
read var_key
if [ "$var_key" = "y" ]
then
		echo "WEB Dashboard will start soon, don't forget to start up A-MQ too!See README.MD"
    mvn jetty:run
else
    echo "OK, bye!"    
fi