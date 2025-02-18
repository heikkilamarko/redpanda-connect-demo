#!/bin/bash
set -e

service_name="$1"
image_tag="$2"
container_registry_name="crrpconnectdemo"

docker build --platform linux/amd64,linux/arm64 -t "$container_registry_name.azurecr.io/$service_name:${image_tag}" $service_name
