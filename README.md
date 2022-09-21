# Desafio 02 - Interface Mobile com Flutter
Neste deafio temos a adição de novos elementos e novos conceitos que são utilizados diariamente pelos programadores. Teremos que realizar a codificação de três telas distintas. Faremos a codificação componentizada, ou seja, com o reaproveitamento dos títulos e campos de formulários que podem ser reaproveitados nas demais telas.

## Mockup
O [mockup](https://assets.materialup.com/uploads/e1470cb6-ecaf-46fb-9114-8d0956d58d6b/preview.png) deverá ser reproduzido com código em Flutter o mais fiel possível. Atente-se para cada detalhe do mockup e suas medidas. O mais importante neste momento é a presença de cada um dos elementos com as funcionalidades solicitadas na missão.

## Missão?
Reproduzir mockup mais fiel possivel no flutter. O MOCKUP está disponível para consulta e nós vamos trabalhar com ele neste momento. Lembre-se de atentar para cada detalhe. Não se preocupe. Na medida do possível vamos lhe dando os conceitos envolvidos para termos uma atividade enriquecedora e com grande aprendizado.

## Objetivos =)

- Criação das seguintes telas:

    - Login;
        - Login com email;
        - Senha;
    - Profile;
        - Nome;
        - Email;
        - CPF;
        - Telefone;
        - Senha;
        - Selecionar Foto;
    - Register;
        - Nome;
        - Email;
        - CPF;
        - Telefone;
        - Senha;
    - Splash; (adicional);

> Atenção: os campos de texto devem ter validador com REGEX!

- Navegação entre páginas;
    - Para este momento atente-se para a navegação utilizado o recurso de Navegação nativo com as MaterialPageRoutes; 
    - Evite neste primeiro momento o uso de rotas nomeadas para não "bugar" seu entendimento de como funciona a navegação;

- Responsividade de telas;
    - Consulte o desafio 01; Basicamente vamos respeitar o que aprendemos naquele momento;

- Theme (Design System em Monorepo);
    - Dica para criar o package:
        > '''flutter create --template=package cambona'''

    - No arquivo principal você deve exportar os arquivos; Do contrário eles não ficarão visíveis para o outro projeto;

    > '''//exportação dos arquivos;

    export 'themes/themes.dart';'''

    - Há a necessidade de relatar no Pubspec o caminho para o novo package:

    '''#o caminho poderá ter um ../ indicando a navegação entre pastas;

  cambona:
    path: cambona '''

- Validação de campos:
    - Devemos utilizar Regex;
        - Dica de artigo: [Vamos falar de Regex?](https://blog.flutterando.com.br/vamos-falar-de-regex-8a2991d71ed9);
        - Dica de Site: [Conferência/Entendimento do Regex](http://www.regexplained.co.uk/);
        - Dica de [Gerador](https://regex-generator.olafneumann.org/) de Regex para entendimento básico;


- Implementar dois elementos no Profile:
   
    1. Utilizar um package para selecionar a foto;
        - Para a seleção da foto foi utilizado o package 'ImagePicker' disponível no repositório pub.dev;
            - Dica 01: utilize a instância de File do package dart.io para retornar o caminho (path) da imagem selecionada;
            - Dica 02: crie um método 'onTap' para carregar a imagem assíncrono; assim a tela poderá ser reconstruida com a nova imagem selecionada no tempo certo, ou seja, primeiro carrega o caminho, depois envia o caminho ao widget para então mostrar a imagem;
    
    2. Obrigatório selecionar um pais;
        - Para selecionar o país tenho algumas dicas imprescindíveis:
            - Dica 01: Não utilize o DropDownButton diretamente; Você deverá criar um widget customizado para facilitar a passagem e a recuperação de dados;
            - Dica 02: Atenção para o a função de retorno de dados em seu projeto; ela é muito importante para você poder recuperar os dados depois;
            - Uma dica que eu particularmente achei muito legal é o uso de uma interface (ou contrato ou classe abstrata) para tornar todas as entidadades usuárias deste botão padronizadas, ou seja, se todas as entidades tiverem uma relação comum será possível reaproveitar o botão facilmente. Dependendo do projeto e se todas as listas forem exatamente iguais também será possível utilizar o generics para tornar o botão customizável e reaproveitavel;


## FIM

Espero que você, que chegou até aqui, tenha gostado e aprendido alguns dos conceitos envolvidos no dia-a-dia do programador!

Bons estudos! =)

Forte 73.