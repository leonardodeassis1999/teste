from fastapi import FastAPI
app = FastAPI()


@app.get("/pessoas")
def pessoas_rota():
    return {
        "nome": "Leonardo",
        "cidade": "Fraiburgo"
    }