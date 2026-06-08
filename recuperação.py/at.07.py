def calcular_gorjeta(total, percentual):
    gorjeta = total * (percentual / 100)
    total_pagar = total + gorjeta
    return gorjeta, total_pagar

gorjeta, total = calcular_gorjeta(100, 10)
print(f"Conta: R$ 100.00 | Gorjeta 10%: R$ {gorjeta:.2f} | Total: R$ {total:.2f}")

gorjeta, total = calcular_gorjeta(250.50, 15)
print(f"Conta: R$ 250.50 | Gorjeta 15%: R$ {gorjeta:.2f} | Total: R$ {total:.2f}")

gorjeta, total = calcular_gorjeta(480, 20)
print(f"Conta: R$ 480.00 | Gorjeta 20%: R$ {gorjeta:.2f} | Total: R$ {total:.2f}")