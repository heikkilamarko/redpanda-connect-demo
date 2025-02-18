#!/bin/bash
set -e

service_name="$1"
image_tag="$2"
container_registry_name="crrpconnectdemo"

az acr login -n $container_registry_name

docker push "$container_registry_name.azurecr.io/$service_name:${image_tag}"
