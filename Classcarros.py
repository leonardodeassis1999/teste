from sqlalchemy import Column, Integer, String, Date
from database import Base

class Carro(Base):
    __tablename__ = "carro"

    id = Column(Integer, primary_key=True, autoincrement=True)
    cor = Column(String(50))
    modelo = Column(String(50))
    data_fabricacao = Column(Date)