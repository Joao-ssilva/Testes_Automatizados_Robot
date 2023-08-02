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
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página 
    E a categoria "Computadores e Informática" deve ser exibida na página  


Caso Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um Produto
    [Tags]             buscar_produtos lista_busca 
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Verificar se aparece a frase "Resultados" na tela 
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S" 
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Xbox Series S" no carrinho
    Então o produto "Xbox Series S" deve ser mostrado no carrinho

 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Xbox Series S" no carrinho 
    Quando remover o produto "Xbox Series S" do carrinho 
    Então o carrinho deve ficar vazio 