#!/usr/bin/env bash

# debug output
pwd
ls -la $HOME

# Create environment for Karaf execution
export JAVA_HOME=$HOME/jre
export SERVICEMIX_HOME=$HOME/apache-servicemix
export PATH=$JAVA_HOME/bin:$PATH

# configure Karaf webconsole to deploy and run on port 80

echo "org.osgi.service.http.port=$VCAP_APP_PORT"
echo "org.osgi.service.http.port=$VCAP_APP_PORT" > $SERVICEMIX_HOME/etc/org.ops4j.pax.web.cfg
sed 's/^featuresBoot=.*$/&,webconsole/' $SERVICEMIX_HOME/etc/org.apache.karaf.features.cfg > $SERVICEMIX_HOME/karaf.features.cfg
mv -f $SERVICEMIX_HOME/karaf.features.cfg $SERVICEMIX_HOME/etc/org.apache.karaf.features.cfg

# start servicemix ..
sh $SERVICEMIX_HOME/bin/servicemix

