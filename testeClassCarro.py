from database import SessionLocal
from carro import Carro
from datetime import date

session = SessionLocal()
novo_carro = Carro(id = 1, cor = "Preto", modelo = "Fiat uno com escada", ano = "2008, 1, 1")
session.add(novo_carro)
session.commit()
print("Carro inserido!")

carros = session.query(Carro).all()
for c in carros:
    print(c.id, c.cor, c.modelo, c.ano)

session.close()