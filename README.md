# streamlit_db_docker
Docker compose with streamlit, postgres, pgadmin, portainer

# Usage
## Development
```docker compose --profile prd up --build```

## Production
```docker compose --profile dev up --build```

To spin up pgadmin4 while in production:
 - ```docker compose up pgadmin```
