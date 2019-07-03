#!/bin/bash

export CONCOURSE_EXTERNAL_URL=http://$(ipconfig getifaddr en0):8080
docker-compose up -d
