from mangum import Mangum
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root() -> str:
    return {"message": "Hello World, from Terraform! :)"}


@app.post("/post")
def teste_post() -> str:
    return {"message": "Hello World, from POST Terraform! :)"}


handler = Mangum(app=app)
