#!/bin/bash
# to keep ssh connection alive when idle

# Interval in seconds (e.g., 120 = 2 minutes)
INTERVAL=120

while true; do
    # Send a newline (as if pressing Enter)
    printf '\n'
    sleep $INTERVAL
done