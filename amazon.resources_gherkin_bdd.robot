*** Settings ***
Resource    amazon_testes.robot

*** Keywords ***
#GHERKIN STEPS BDD
#TESTE 01 bdd
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br                          
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

#TESTE 02 bdd
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
Verificar se aparece a frase "Resultados" na tela
   Wait Until Element Is Visible    locator=${FRASE_RESULTADOS} 

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"
    
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está Listando o Produto "Xbox Series S"
#TESTE 03 bdd
Quando adicionar o produto "Xbox Series S" no carrinho   
    Clicar no produto "Xbox Series S"
    Adicionar o produto "Xbox Series S" no carrinho

Então o produto "Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso

#TESTE 04 bdd
E existe o produto "Xbox Series S" no carrinho
    Então o produto "Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Xbox Series S" do carrinho
    Remover o produto "Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio