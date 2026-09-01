from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from datetime import date
from database import SessionLocal
from Classcarros import Carro

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

class CarroSchema(BaseModel):
    cor: str
    modelo: str
    data_fabricacao: date

@app.get("/carro")
def listar_Carro():
    session = SessionLocal()
    try:
        carro = session.query(Carro).all()
        resultado = [
            {"id": i.id, "cor": i.cor, "modelo": i.modelo, "data_fabricacao": i.data_fabricacao}
            for i in carro
        ]
        return resultado
    finally:
        session.close()

@app.post("/carro")
def cadastrar_carro(carro: CarroSchema):
    session = SessionLocal()
    try:
        novo_carro = Carro(
            cor=carro.cor,
            modelo=carro.modelo,
            data_fabricacao=carro.data_fabricacao
        )
        session.add(novo_carro)
        session.commit()
        session.refresh(novo_carro)
        return {"mensagem": "Carro cadastrado com sucesso!", "id": novo_carro.id}
    except Exception as erro:
        session.rollback()
        return {"erro": str(erro)}
    finally:
        session.close()

@app.delete("/carro/{carro_id}")
def excluir_carro(carro_id: int):
    session = SessionLocal()
    try:
        carro = session.query(Carro).filter(Carro.id == carro_id).first()
        if not carro:
            return {"erro": "Carro não encontrado"}
        session.delete(carro)
        session.commit()
        return {"mensagem": f"Carro com id {carro_id} excluído com sucesso!"}
    except Exception as erro:
        session.rollback()
        return {"erro": str(erro)}
    finally:
        session.close()