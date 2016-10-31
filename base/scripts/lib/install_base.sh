#!/bin/bash
set -e
apt-get update -y
# used to be apt-get install -y curl bzip2 build-essential python git
apt-get install -y build-essential