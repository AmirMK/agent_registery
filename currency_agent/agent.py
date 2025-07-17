import logging

from google.genai import types

from google.adk.agents import Agent
from google.adk.agents import RunConfig
from google.adk.runners import InMemoryRunner



def get_exchange_rate(
    currency_from: str = "USD",
    currency_to: str = "EUR",
    currency_date: str = "latest",
):
    """Retrieves the exchange rate between two currencies on a specified date.

    Uses the Frankfurter API (https://api.frankfurter.app/) to obtain
    exchange rate data.

    Args:
        currency_from: The base currency (3-letter currency code).
            Defaults to "USD" (US Dollar).
        currency_to: The target currency (3-letter currency code).
            Defaults to "EUR" (Euro).
        currency_date: The date for which to retrieve the exchange rate.
            Defaults to "latest" for the most recent exchange rate data.
            Can be specified in YYYY-MM-DD format for historical rates.

    Returns:
        dict: A dictionary containing the exchange rate information.
            Example: {"amount": 1.0, "base": "USD", "date": "2023-11-24",
                "rates": {"EUR": 0.95534}}
    """   
    import requests
    
    response = requests.get(
        f"https://api.frankfurter.app/{currency_date}",
        params={"from": currency_from, "to": currency_to},
    )
    return response.json()


# Configure logging to see the agent's thought process.
logging.basicConfig(level=logging.INFO)


root_agent = Agent(
    name="currency_exchange_agent",
    model="gemini-2.5-flash",
    instruction=(
        "You are an expert at currency exchange. A user will ask question for currency conversion rate"
        "You use get_exchange_rate` tool to provide currency conversion rate"
        
    ),
    tools=[
        get_exchange_rate,
    ],
)
