#!/usr/bin/env bash
cd $(dirname "$0")
echo $(pwd)
vagrant up --provision