#!/bin/bash

# Reset the worker nodes first since the path to them is through the control plane nodes
talosctl reset --graceful=false --reboot -n 192.168.2.9 -e 192.168.2.9
talosctl reset --graceful=false --reboot -n 192.168.2.10 -e 192.168.2.10
talosctl reset --graceful=false --reboot -n 192.168.2.11 -e 192.168.2.11

echo "Waiting for workers to reset... ^C to stop here"
sleep 15

# Reset the control plane nodes
talosctl reset --graceful=false --reboot -n 192.168.2.3 -e 192.168.2.3
talosctl reset --graceful=false --reboot -n 192.168.2.4 -e 192.168.2.4
talosctl reset --graceful=false --reboot -n 192.168.2.5 -e 192.168.2.5
