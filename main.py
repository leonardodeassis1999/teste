from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from database import SessionLocal
from Classcarros import Carro

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/carro")
def listar_Carro():
    session = SessionLocal()
    try:
        carro = session.query(Carro).all()
        resultado = [{"id": i.id, "cor": i.cor, "modelo": i.modelo, "ano": i.ano} for i in carro]
        return resultado
    finally:
        session.close()