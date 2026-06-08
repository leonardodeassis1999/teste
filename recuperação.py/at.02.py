valor_reais = float(input("Digite um valor em reais: R$ "))

valor_dolar = valor_reais / 5.70
valor_euro = valor_reais / 6.10

print(f"Valor em Reais: R$ {valor_reais:.2f}")
print(f"Valor em Dólar: $ {valor_dolar:.2f}")
print(f"Valor em Euro: € {valor_euro:.2f}")