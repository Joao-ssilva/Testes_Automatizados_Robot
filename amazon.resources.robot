*** Settings ***

Library    SeleniumLibrary
Library    Screenshot   
#Library    NOME_DA_RESOURCES_DE_OUTRA_ARQUIVO
 
#Váriaveis globais
*** Variables ***
${BROWSER}                     chrome
${URL}                         https://www.amazon.com.br/  
${MENU_ELETRONICOS}            //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}          //h1[contains(.,'Eletrônicos e Tecnologia')]
${BOTAO_ADICONAR_AO_CARRINHO}  //input[contains(@name,'submit.add-to-cart')]
${CARRINHO_DE_COMPRAS}         //a[contains(@aria-label,'1 item no carrinho')]
${BOTAO_EXCLUIR_DO_CARRINHO}   //input[contains(@value,'Excluir')]
${REMOVIDO_DO_CARRINHO}        //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
${FRASE_RESULTADOS}            //span[@class='a-size-medium-plus a-color-base a-text-bold'][contains(.,'Resultados')]

*** Keywords ***
#TESTE 01
Abrir o navegador
    Open Browser    browser=${BROWSER}

    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go to    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains  text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

#TESTE 02
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=field-keywords    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

    
Verificar o resultado da pesquisa se está Listando o Produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//h2[contains(.,'${PRODUTO}')])[2]
Verificar se aparece a a imagem "${CONSOLE}"
    Wait Until Element Is Visible    locator=//img[contains(@alt,'${CONSOLE}')]    

# #TESTE 03
Clicar no produto "${PRODUTO}"
   Click Element    locator=(//a[@class='a-link-normal s-underline-text s-underline-link-text s-link-style a-text-normal'][contains(.,'${PRODUTO}')])[2]

Adicionar o produto "${PRODUTO}" no carrinho
    Wait Until Element Is Visible    locator=//span[@class='a-size-large product-title-word-break'][contains(.,'${PRODUTO}')]
    Click Button    locator=${BOTAO_ADICONAR_AO_CARRINHO}

Verificar se o produto "Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains    text=Adicionado ao carrinho

#TESTE 04
Remover o produto "Xbox Series S" do carrinho 
    Click Element    locator=${CARRINHO_DE_COMPRAS}
    Wait Until Page Contains    text=Carrinho de compras
    Click Element   locator=${BOTAO_EXCLUIR_DO_CARRINHO}

Verificar se o carrinho fica vazio
   Wait Until Element Is Visible    locator=${REMOVIDO_DO_CARRINHO}
   