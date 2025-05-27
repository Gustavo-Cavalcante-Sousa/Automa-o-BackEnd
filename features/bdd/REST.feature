# language: pt

Funcionalidade: Pesuquisar Funcionarios
    Para averiguar informações
    O usuario do sistema
    Deseja poder consultar informações dos funcionarios 

    Cenario: Buscar informações de funcionarios
        Dado que o usuario consulte informacoes de funcionario
        Quando ele realizar a pesquisa 
        Entao uma lista de funcionarios deve retornar 
    
    @cenario_dois
    Cenario: Cadastrar funcionario
        Dado que o usuario casdastre um novo usuario
        Quando ele enviar as informacoes do funcionario
        Entao esse funcionario sera casdastrado