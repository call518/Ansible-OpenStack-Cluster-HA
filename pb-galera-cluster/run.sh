#!/bin/bash

# Init Cluster
./run-init.sh
if [ $? -ne 0 ]; then exit 99; fi

# Bootstrap Cluster (WARNING: "Maybe All Data will be Lost...")
./run-bootstrap.sh
if [ $? -ne 0 ]; then exit 99; fi

