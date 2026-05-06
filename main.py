# Importa a biblioteca
# Serve para conectar o banco de dados ao python
import mysql.connector
from mysql.connector import Error

def criar_conexao():
    """Estabelece a canexão com o banco de dados."""
    try:
        conexao = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="csv_db 6"
        )
        if conexao.is_connected():
            return conexao
    except Error as e:
        print(f"Erro ao conectar ao MySQL: {e}")
    return None

def inserir_funcionario(matricula, nome, data_nascimento, cargo):
    """Insere um novo funcionário no banco de dados."""
    conn = criar_conexao()
    if conn:
        try:
            cursor = conn.cursor()
            sql = "INSERT INTO funcionario (matricula, nome, data_nascimento, cargo) values (%s, %s, %s, %s)"
            valores = (matricula, nome, data_nascimento, cargo)
            
            cursor.execute(sql, valores)
            conn.commit()
        except Error as e:
            print(f"Erro ao inserir funcionário: {e}")
        finally:
            if conn.is_connected():
                cursor.close()
                conn.close()

def listar_funcionarios():
    """Busca e exibe todos os funcionários."""
    conn = criar_conexao()
    if conn:
        try:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM funcionario")
            resultados = cursor.fetchall()

            for linha in resultados:
                print(linha)
        except Error as e:
            print(f"Erro ao listar funcionários: {e}")
        finally:
            cursor.close()
            conn.close()

# --- Exemplo de Uso ---
if __name__ == "__main__":
    # Inserindo dados de forma dinamica
    inserir_funcionario('F001', 'An Silva', '1985-03-15', 'Gerente')

    # Listando os resultados
    print("\nLista de Funcionários:")
    listar_funcionarios()