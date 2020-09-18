# app-ListaCompras
## Desafio Aula 10 - App Lista de compras (Mízia, Michel, Rodrigo)

- [Repositório das aulas](https://github.com/michelldossantos/projetosTestesDigitalHouse)


### Criar um app de Lista de Compras:
- Um item de compra, deve ter nome e quantidade
- Eu posso: Criar, Editar, Excluir
- Ao inserir o nome do produto, o app já deve verificar se existe ou nao e mostrar numa label. Se já existe, deve trazer a quantidade no textField de quantidade.
  Deve tbm mudar o texto dos botões de acordo com as opções.
- Se eu tentar criar um item já existente, devo somente atualizar a quantidade.
- O app deve exibir em uma label o nome dos itens existentes
- Deve exibir um botão Limpar que limpa toda tela
Layout quando insere um novo:
[Digite o nome do produto aqui     ]
[Digite a quantidade aqui          ]
Produto novo
[Salvar] [Limpar]
Amaciante
Sabão
Detergente
Pão
---------------------------------------
Layout quando insere um existente:
[Amaciante     ]
[2             ]
Produto já existente
[Salvar edição] [Excluir] [Limpar]
Amaciante
Sabão
Detergente
Pão
Sobre o Desenvolvimento:
- Classe de item deve estar numa classe num arquivo separado.
- Para verificar se o item existe, deve ser colocada a string tudo para minusculo e ignorar caracteres especiais.
- A lista deve ser exibida para o usuário numa label.
- Ao clicar em qualquer botão, deve esconder o teclado.
- No campo quantidade, o teclado deve ser numérico.
let nome = "nárléi"
print(nome.folding(options: .diacriticInsensitive, locale: .current).lowercased()) // narlei
