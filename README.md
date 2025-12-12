# Custom Agent on Agentspace

This sample demonstrates how to build a custom agent using the ADK (Agent Development Kit), deploy it to Vertex AI Agent Engine, and register it with Agentspace. Once registered, the agent becomes accessible through the Agentspace interface, enabling users to interact with it as part of a unified agent experience.

## Steps
### 1. **Install required packages and set up environment**
   - Install the required dependencies:
     ```bash
     pip install google-adk[adk,agent_engine]
     ```
   - Update the `.env` files:     
     - In `./currency_agent`

     Insert your Google Cloud `project_id` in both files.

### 2. **Run the ADK Agent locally**
```bash
     adk web
```
This will run the agent locally on your localhost, allowing you to test the agent in a local environment.

### 3. **Deploy ADK Agent to Agent Engine**
You need to modify the `agent_engine_deployment.py` file by providing your `project_id`, `location`, and `staging_bucket`.  
The `staging_bucket` is a GCS bucket used during the deployment process.
```bash
     python agent_engine_deployment.py
```
This will deploy your agent on Vertex AI Agent Engine and return the REASONING_ENGINE_ID.


### 5. **Register Agent to Gemini Enterprise**
To register your agent to Gemini Enterprise follow the steps on this link:  



