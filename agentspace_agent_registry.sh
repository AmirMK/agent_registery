#!/bin/bash

# --- Hardcoded Configuration ---
GOOGLE_CLOUD_PROJECT=...
PROJECT_NUMBER=...
GOOGLE_CLOUD_LOCATION=...
REASONING_ENGINE_ID=...
AGENTSPACE_APP_ID=...
AGENT_DISPLAY_NAME="currency exchange rate"  # optional if used later
AGENT_DESCRIPTION="Provide latest currency exchange rate"

# Construct the full reasoning engine resource name
REASONING_ENGINE="projects/${GOOGLE_CLOUD_PROJECT}/locations/${GOOGLE_CLOUD_LOCATION}/reasoningEngines/${REASONING_ENGINE_ID}"

echo "--- Configuration ---"
echo "Project ID:         $GOOGLE_CLOUD_PROJECT"
echo "Project Number:     $PROJECT_NUMBER"
echo "Reasoning Engine:   $REASONING_ENGINE"
echo "Agent Search App ID: $AGENTSPACE_APP_ID"
echo "Agent Display Name: $AGENT_DISPLAY_NAME"
echo "---------------------"
echo

echo "Patching Agent Search Assistant to register the Reasoning Engine..."
curl -X POST \
  -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  -H "Content-Type: application/json" \
  -H "X-Goog-User-Project: ${GOOGLE_CLOUD_PROJECT}" \
  "https://discoveryengine.googleapis.com/v1alpha/projects/${GOOGLE_CLOUD_PROJECT}/locations/global/collections/default_collection/engines/${AGENTSPACE_APP_ID}/assistants/default_assistant/agents" \
  -d '{
    "displayName": "'"${AGENT_DISPLAY_NAME}"'",
    "description": "'"${AGENT_DISPLAY_NAME}"'",
    "icon": {
      "uri": "https://fonts.gstatic.com/s/i/short-term/release/googlesymbols/corporate_fare/default/24px.svg"
    },
    "adk_agent_definition": {
      "tool_settings": {
        "tool_description": "'"${AGENT_DESCRIPTION}"'"
      },
      "provisioned_reasoning_engine": {
        "reasoning_engine": "'"${REASONING_ENGINE}"'"
      }
    }
  }'


echo
echo "Verifying the Agent Search Assistant configuration..."
curl -X GET -H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H "Content-Type: application/json" \
-H "x-goog-user-project: ${GOOGLE_CLOUD_PROJECT}" \
"https://discoveryengine.googleapis.com/v1alpha/projects/${PROJECT_NUMBER}/locations/global/collections/default_collection/engines/${AGENTSPACE_APP_ID}/assistants/default_assistant/agents"