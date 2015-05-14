#!/usr/bin/env bash

# debug output
pwd
ls -la $HOME

# Create environment for Karaf execution
export JAVA_HOME=$HOME/jdk
export KARAF_HOME=$HOME/apache-karaf
export PATH=$JAVA_HOME/bin:$PATH

# configure Karaf webconsole to deploy and run on port 80

echo "org.osgi.service.http.port=$VCAP_APP_PORT"
echo "org.osgi.service.http.port=$VCAP_APP_PORT" > $KARAF_HOME/etc/org.ops4j.pax.web.cfg
sed 's/^featuresBoot=.*$/&,webconsole/' $KARAF_HOME/etc/org.apache.karaf.features.cfg > $KARAF_HOME/karaf.features.cfg
mv -f $KARAF_HOME/karaf.features.cfg$KARAF_HOME/etc/org.apache.karaf.features.cfg

# start Karaf as background task ..
$KARAF_HOME/bin/start

