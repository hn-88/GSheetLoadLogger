#!/bin/bash

# Webhook URL from your Google Apps Script deployment
WEBHOOK_URL="https://script.google.com/macros/s/AKfycbxxxxxxx/exec"

# Get the 1-minute load average using uptime
LOAD_AVERAGE=$(uptime | awk -F'load average: ' '{ print $2 }' | cut -d',' -f1 | tr -d ' ')

# Prepare JSON payload
JSON_PAYLOAD=$(printf '{"load_average":"%s"}' "$LOAD_AVERAGE")

# Send POST request to the webhook
curl -X POST -H "Content-Type: application/json" -d "$JSON_PAYLOAD" "$WEBHOOK_URL"
