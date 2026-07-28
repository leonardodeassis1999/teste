import mysql.connector

def criar_conexao():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='csv_db'
    )

def inserir_funcionario():
    # Coleta os dados do usuário aqui
    matricula = int(input("Qual é sua matricula? "))
    nome = input("Qual é o seu nome? ")
    data_nascimento = input("Qual é a sua data de nascimento (AAAA-MM-DD)? ")
    cargo = input("Qual é o seu cargo? ")

    conn = criar_conexao()
    cursor = conn.cursor()

    sql = "INSERT INTO funcionario (matricula, nome, data_nascimento, cargo) VALUES (%s, %s, %s, %s)"
    valores = (matricula, nome, data_nascimento, cargo)
    
    cursor.execute(sql, valores)
    conn.commit()
    
    print("Funcionário inserido com sucesso!")
    cursor.close()
    conn.close()

def listar_funcionarios():
    conn = criar_conexao()
    cursor = conn.cursor()
    
    cursor.execute("SELECT * FROM funcionario")
    resultados = cursor.fetchall()
    
    for linha in resultados:
        print(linha)
        
    cursor.close()
    conn.close()

# --- Execução ---
if __name__ == "__main__":
    # Chama a função de inserir (ela vai pedir os inputs no console)
    inserir_funcionario()

    # Listando os resultados
    print("\nLista de Funcionários Atualizada:")
    listar_funcionarios()