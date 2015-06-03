#!/usr/bin/env bash

# debug output
pwd
ls -la $HOME

# Create environment for Karaf execution
export JAVA_HOME=$HOME/jre
export KARAF_HOME=$HOME/karaf
export PATH=$JAVA_HOME/bin:$PATH
export BPM_PLUGINS=$HOME/bpm-plugins

# configure Karaf webconsole to deploy and run on specified CloudFoundry port

echo "org.osgi.service.http.port=$VCAP_APP_PORT"
echo "org.osgi.service.http.port=$VCAP_APP_PORT" > $KARAF_HOME/etc/org.ops4j.pax.web.cfg
sed 's#\(^featuresBoot\).*=\(.*$\)#\1 =\2,webconsole#' $KARAF_HOME/etc/org.apache.karaf.features.cfg > $KARAF_HOME/karaf.features.cfg
grep "featuresBoot" $KARAF_HOME/karaf.features.cfg
mv -f $KARAF_HOME/karaf.features.cfg $KARAF_HOME/etc/org.apache.karaf.features.cfg

# sed "s#\(^.*\)file:.*\/plugins\/\(.*\)#\1file:$BPM_PLUGINS\/\2#g" bpmmicroservice.xml > $KARAF_HOME/deploy/bpmmicroservice.xml
# cat $KARAF_HOME/deploy/bpmmicroservice.xml

echo "Starting app with launch.sh"
echo "CFBPM_PROPS = $CFBPM_PROPS"
grep "^features" $KARAF_HOME/etc/org.apache.karaf.features.cfg

# start Karaf ..
sh $KARAF_HOME/bin/karaf

