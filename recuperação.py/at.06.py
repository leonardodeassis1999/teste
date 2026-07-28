def classificar_velocidade(km):
    if km <= 40:
        return "Lento"
    elif km <= 80:
        return "Normal"
    elif km <= 120:
        return "Rápido"
    else:
        return "Muito rápido"

print(classificar_velocidade(70))
print(classificar_velocidade(30))
print(classificar_velocidade(150))
print(classificar_velocidade(100))