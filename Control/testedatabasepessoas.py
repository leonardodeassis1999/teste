from databasepessoas import engine



try: 
    conexao = engine.connect()
    print("com sucesso")
    conexao.close 
except Exception as erro:
    print("conexão falhou")
    print(erro)