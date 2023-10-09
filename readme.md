# TRABALHO 01:  Luderia
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Filipe Moura: filipemoura.pessoal@gmail.com<br>
João Spinassé: jpspinasse@gmail.com<br>
Marllon Ribeiro: marllon.ribeiro027@gmail.com<br>
Samuel Ferreira: samuel.ferralves@gmail.com<br>


### 2.MINI-MUNDO<br>
> Uma luderia está se preparando para abrir e solicitou o desenvolvimento de um sistema para apoiar algumas de suas atividades. Luderia é um local onde grupos podem se divertir com jogos de tabuleiro, cartas e RPG enquanto podem comer e beber, como um bar. A luderia em questão precisará de auxílio em alguns campos específicos, como catálogo de  jogos, manutenção dos jogos e controle de comandas. Há duas formas de usufruir dos serviços da luderia. Na primeira, os clientes pagam por um período de tempo e podem jogar quantos jogos desejarem, além de suas expansões, respeitando que só deve haver na mesa um jogo por vez. Na segunda forma, os clientes pagam por um jogo específico, mas precisam pagar um valor extra por cada expansão que desejarem, e caso queiram jogar outro jogo, deverão pagar pelo mesmo. Quando os clientes escolhem uma mesa, deve ser gerada uma comanda única, onde devem constar o número da mesa, funcionário responsável pela mesa, o modo de cobrança, os jogos utilizados e, para o modo de cobrança por tempo, o tempo total gasto pelos clientes da mesa. Deve haver uma forma de exibir os jogos disponíveis aos clientes. Os jogos precisam de manutenção quando a luderia os adquire, e também passam por uma manutenção periódica. A Luderia pode possuir mais de uma unidade de alguns dos jogos. Deve haver uma forma de exibir ao funcionário todos os jogos, a quantidade de cada um e permitir que ele informe sobre a disponibilidade de cada exemplar de cada jogo. Um jogo estará disponível caso haja uma unidade que não esteja necessitando de manutenção e não esteja em uso. Um funcionário da luderia é quem retira os jogos do estoque e entrega na mesa. Após a devolução de um jogo, o funcionário verifica se está tudo certo. Caso haja algum dano, uma multa será aplicada e o jogo separado para manutenção. A luderia deseja fornecer aos clientes uma forma de consultar o cardápio de alimentos de forma digital. Ainda é necessário possibilitar que os clientes recebam informações sobre promoções, sendo necessário que forneçam alguma forma de contato. 

### 3.PERGUNTAS A SEREM RESPONDIDAS<br>
#### 3.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    a) O sistema proposto poderá fornecer quais tipos de relatórios e informaçes? 
    b) Crie uma lista com os 5 principais relatórios que poderão ser obtidos por meio do sistema proposto!
    
> A Empresa DevCom precisa inicialmente dos seguintes relatórios:
* Relatório que mostre o nome de cada supervisor(a) e a quantidade de empregados supervisionados.
* Relatório relativo aos os supervisores e supervisionados. O resultado deve conter o nome do supervisor e nome do supervisionado além da quantidade total de horas que cada supervisionado tem alocada aos projetos existentes na empresa.
* Relatorio que mostre para cada linha obtida o nome do departamento, o valor individual de cada salario existente no  departamento e a média geral de salarios dentre todos os empregados. Os resultados devem ser apresentados ordenados por departamento.
* Relatório que mostre as informações relacionadas a todos empregados de empresa (sem excluir ninguém). As linhas resultantes devem conter informações sobre: rg, nome, salario do empregado, data de início do salario atual, nomes dos projetos que participa, quantidade de horas e localização nos referidos projetos, numero e nome dos departamentos aos quais está alocado, informações do historico de salário como inicio, fim, e valores de salarios antigos que foram inclusos na referida tabela (caso possuam informações na mesma), além de todas informações relativas aos dependentes. 
>> ##### Observações: <br> a) perceba que este relatório pode conter linhas com alguns dados repetidos (mas não todos). <br>  b) para os empregados que não possuirem alguma destas informações o valor no registro deve aparecer sem informação/nulo. 
* Relatório que obtenha a frequencia absoluta e frequencia relativa da quantidade de cpfs únicos no relatório anterior. Apresente os resultados ordenados de forma decrescente pela frequencia relativa.

    
### 5.MODELO CONCEITUAL<br>
    A) Utilizar a Notação adequada (Preferencialmente utilizar o BR Modelo 3)
    B) O mínimo de entidades do modelo conceitual pare este trabalho será igual a 3 e o Máximo 5.
        * informe quais são as 3 principais entidades do sistema em densenvolvimento<br>(se houverem mais de 3 entidades, pense na importância da entidade para o sistema)       
    C) Principais fluxos de informação/entidades do sistema (mínimo 3). <br>Dica: normalmente estes fluxos estão associados as tabelas que conterão maior quantidade de dados 
    D) Qualidade e Clareza
        Garantir que a semântica dos atributos seja clara no esquema (nomes coerentes com os dados).
        Criar o esquema de forma a garantir a redução de informação redundante, possibilidade de valores null, 
        e tuplas falsas (Aplicar os conceitos de normalização abordados).   
        
![Alt text](https://github.com/discipbd1/trab01/blob/master/images/concept_sample.png?raw=true "Modelo Conceitual")
    
    
#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: [Nomes dos que participaram na avaliação]
    [Grupo02]: [Nomes dos que participaram na avaliação]

#### 5.2 Descrição dos dados 
    [objeto]: [descrição do objeto]
    
    EXEMPLO:
    CLIENTE: Tabela que armazena as informações relativas ao cliente<br>
    CPF: campo que armazena o número de Cadastro de Pessoa Física para cada cliente da empresa.<br>

># Marco de Entrega 01: Do item 1 até o item 5.2 (5 PTS) <br> 

### 6	MODELO LÓGICO<br>
        a) inclusão do esquema lógico do banco de dados
        b) verificação de correspondencia com o modelo conceitual 
        (não serão aceitos modelos que não estejam em conformidade)

### 7	MODELO FÍSICO<br>
        a) inclusão das instruções de criacão das estruturas em SQL/DDL 
        (criação de tabelas, alterações, etc..) 

      
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
        a) Script das instruções relativas a inclusão de dados 
	Requisito mínimo: (Script dev conter: Drop para exclusão de tabelas + create definição de para tabelas e estruturas de dados + insert para dados a serem inseridos)
        OBS
	1) Criar um novo banco de dados para testar a restauracao (em caso de falha na restauração o grupo não pontuará neste quesito)
        2) script deve ser incluso no template em um arquivo no formato .SQL


### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Usa template da disciplina disponibilizado no Colab.<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>

#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
    a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not
    b) Criar no mínimo 3 consultas com operadores aritméticos 
    c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas

#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>
    a) Criar outras 5 consultas que envolvam like ou ilike
    b) Criar uma consulta para cada tipo de função data apresentada.

># Marco de Entrega 02: Do item 6. até o item 9.1 (5 PTS) <br>

#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>
    a) Criar minimo 3 de exclusão
    b) Criar minimo 3 de atualização

#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6)<br>
    a) Uma junção que envolva todas as tabelas possuindo no mínimo 2 registros no resultado
    b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
    a) Criar minimo 2 envolvendo algum tipo de junção

#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>
    a) Criar minimo 1 de cada tipo

#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join (caso não ocorra na base justificar e substituir por uma view)
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho

#### 9.10	SUBCONSULTAS (Mínimo 4)<br>
     a) Criar minimo 1 envolvendo GROUP BY
     b) Criar minimo 1 envolvendo algum tipo de junção

># Marco de Entrega 03: Do item 9.2 até o ítem 9.10 (10 PTS)<br>

### 10 RELATÓRIOS E GRÁFICOS

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)
#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

    

### 11	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 

># Marco de Entrega 04: Itens 10 e 11 (20 PTS) <br>
<br>
<br>




### 12 FORMATACAO NO GIT:<br> 
https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. <strong>Caso existam arquivos com conteúdos sigilosos<strong>, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")


