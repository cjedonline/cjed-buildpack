#!/usr/bin/env bash

# debug output
pwd
ls -la $HOME

# Create environment for Karaf execution
export JAVA_HOME=$HOME/jdk
export KARAF_HOME=$HOME/apache-karaf
export PATH=$JAVA_HOME/bin:$PATH

# start Karaf as background task ..
$KARAF_HOME/bin/start

