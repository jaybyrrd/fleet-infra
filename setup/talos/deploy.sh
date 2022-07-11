#!/bin/bash

# Configure the control-plane nodes
talosctl apply-config -i -n 192.168.2.3 -f k8s-1.yaml
talosctl apply-config -i -n 192.168.2.4 -f k8s-2.yaml
talosctl apply-config -i -n 192.168.2.5 -f k8s-3.yaml

# Configure the worker nodes
 talosctl apply-config -i -n 192.168.2.9 -f k8s-4.yaml
 talosctl apply-config -i -n 192.168.2.10 -f k8s-5.yaml
 talosctl apply-config -i -n 192.168.2.11 -f k8s-6.yaml

talosctl --talosconfig=./talosconfig config endpoint 192.168.2.3 192.168.2.4 192.168.2.5
talosctl config merge ./talosconfig

# It will take a few minutes for the nodes to spin up with the configuration.  Once ready, execute
# talosctl --talosconfig=./talosconfig bootstrap -n 192.168.2.3

# It will then take a few more minutes for Kubernetes to get up and running on the nodes. Once ready, execute
# talosctl --talosconfig=./talosconfig kubeconfig -n 192.168.2.3
