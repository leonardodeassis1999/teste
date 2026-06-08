filmes = []

for i in range(5):
    filme = input(f"Digite o filme {i + 1}: ")
    filmes.append(filme)

print("\nSeus filmes favoritos:")
for i, filme in enumerate(filmes, start=1):
    print(f"{i}. {filme}")

print(f"\nTotal de filmes cadastrados: {len(filmes)}")