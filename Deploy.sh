#!/bin/bash
sed "s/version/$1/g" deploy.yaml >deployfinal.yaml
