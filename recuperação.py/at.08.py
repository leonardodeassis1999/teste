estoque = []

def adicionar_produto():
    produto = input("Digite o nome do produto: ")
    estoque.append(produto)
    print(f'"{produto}" adicionado ao estoque!')

def retirar_produto():
    produto = input("Digite o nome do produto a retirar: ")
    if produto in estoque:
        estoque.remove(produto)
        print(f'"{produto}" retirado do estoque!')
    else:
        print(f'"{produto}" não encontrado no estoque.')

def ver_estoque():
    if len(estoque) == 0:
        print("Estoque vazio!")
    else:
        print(f"\nProdutos em estoque ({len(estoque)}):")
        for i, produto in enumerate(estoque, start=1):
            print(f"  {i}. {produto}")

def exibir_menu():
    print("\n===== CONTROLE DE ESTOQUE =====")
    print("1. Adicionar produto")
    print("2. Retirar produto")
    print("3. Ver estoque")
    print("4. Sair")
    print("================================")

while True:
    exibir_menu()
    opcao = input("Escolha uma opção: ")

    if opcao == "1":
        adicionar_produto()
    elif opcao == "2":
        retirar_produto()
    elif opcao == "3":
        ver_estoque()
    elif opcao == "4":
        print("Encerrando o sistema. Até logo!")
        break
    else:
        print("Opção inválida! Digite 1, 2, 3 ou 4.")