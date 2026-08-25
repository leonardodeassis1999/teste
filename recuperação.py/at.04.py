total = 0.0

while True:
    preco = float(input("Digite o preço do produto (0 para finalizar): R$ "))
    
    if preco == 0:
        break
    
    total += preco

print(f"\nTotal da compra: R$ {total:.2f}")