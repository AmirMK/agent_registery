# A2A Basic Sample Agent

This sample demonstrates the **Agent-to-Agent (A2A)** architecture in the Agent Development Kit (ADK), showcasing how multiple agents can work together to handle complex tasks. The sample implements an agent that can roll dice and check if numbers are prime.

## Overview
### 1. **Local Sub-Agent Integration**
- The `roll_agent` demonstrates how to create and integrate local sub-agents
- Handles dice rolling with configurable number of sides
- Uses a simple function tool (`roll_die`) for random number generation
```bash
     pip install google-adk[adk,agent_engine,a2a]
```

### 2. **Remote A2A Agent Integration**
- The `prime_agent` shows how to connect to remote agent services
- Communicates with a separate service via HTTP at `http://localhost:8001/a2a/check_prime_agent`
- Demonstrates cross-service agent communication
