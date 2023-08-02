*** Settings ***
Documentation     Esse Suite testa o site da Amazon.com.br
Resource          amazon.resources.robot
Task Setup        Abrir o navegador
Test Teardown     Fechar o navegador

# Para execultar somente um teste da suite: robot -t "NOME DO TESTE"
*** Test Cases ***
Caso Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu do eletrônicos do site da Amazon Acessar a home page do site Amazon.com.br
    ...                e verificar a categoria computadores e informática
    [Tags]             menus categorias  
    Acessar a home page do site Amazon.com.br                          
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"
Caso Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um Produto
    [Tags]             buscar_produtos lista_busca 
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se aparece a a imagem "Console Xbox Series S"
    Verificar o resultado da pesquisa se está Listando o Produto "Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"
    Clicar no produto "Xbox Series S" 
    Adicionar o produto "Xbox Series S" no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso


Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"
    Clicar no produto "Xbox Series S"
    Adicionar o produto "Xbox Series S" no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso
    Remover o produto "Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio 
