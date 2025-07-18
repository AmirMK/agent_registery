# A2A Basic Sample Agent

This sample demonstrates the **Agent-to-Agent (A2A)** architecture in the Agent Development Kit (ADK), showcasing how multiple agents can work together to handle complex tasks. The sample implements an agent that can roll dice and check if numbers are prime.

## step
### 1. **Install required packages and set up environment**
   - Install the required dependencies:
     ```bash
     pip install google-adk[adk,agent_engine,a2a]
     ```
   - Update the `.env` files:
     - In the root directory
     - In `./a2a_basic/remote_a2a/check_prime_agent/`

     Insert your Google Cloud `project_id` in both files.

### 2. **Run the ADK Agent locally**
```bash
     adk web
```
### 3. **Deploy ADK Agent to Agent Engine**
```bash
     python agent_engine_deployment.py
```
### 5. **Register Agent to Agentspace**
```bash
     python agent_engine_deployment.py
```
