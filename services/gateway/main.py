import hashlib
import hmac # Secure hashing with a secret key

import httpx
from fastapi import FastAPI, HTTPException, Request
from prometheus_fastapi_instrumentator import Instrumentor

from models import Settings

settings = Settings()

# create FastAPI app instance
app = FastAPI()

# instrument the FastAPI app for Prometheus metrics
Instrumentor().instrument(app).expose(app)


@app.get("/health")
async def health():
    return {"status": "ok"}