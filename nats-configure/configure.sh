#!/bin/sh
set -e

nats stream add --config "/streams/demo.json"
nats stream add --config "/streams/demo_dlq.json"

nats consumer add demo --config "/consumers/demo.json"
