                                                                                        
                                                                                        Lindemberg

# 🧠 Questões Teórica Modelagem de Dados e SQL Server

### 1. Qual comando é usado para recuperar dados de uma tabela no SQL Server?
- [ ] INSERT  
- [ ] DELETE  
- [x] SELECT  
- [ ] UPDATE  

---

### 2. Qual comando é usado para adicionar um novo registro em uma tabela?
- [x] INSERT  
- [ ] ALTER  
- [ ] SELECT  
- [ ] CREATE  

---

### 3. Qual das opções abaixo é usada para remover uma tabela do banco de dados?
- [ ] DROP DATABASE  
- [x] DROP TABLE  
- [ ] DELETE TABLE  
- [ ] REMOVE TABLE  

---

### 4. Qual tipo de dado é mais adequado para armazenar texto com até 50 caracteres?
- [ ] INT  
- [x] VARCHAR(50)  
- [ ] DATE  
- [ ] FLOAT  

---

### 5. O que o comando `WHERE` faz em uma instrução `SELECT`?
- [ ] Ordena os resultados  
- [x] Filtra os registros de acordo com uma condição  
- [ ] Cria uma nova tabela  
- [ ] Insere dados na tabela  

---

### 6. Qual comando é utilizado para alterar a estrutura de uma tabela existente?
- [x] ALTER TABLE  
- [ ] MODIFY  
- [ ] UPDATE TABLE  
- [ ] CHANGE TABLE  

---

### 7. O que o comando `ORDER BY` faz?
- [ ] Filtra os dados  
- [ ] Remove colunas  
- [x] Ordena os resultados  
- [ ] Limita os registros  

---

### 8. Qual função retorna a contagem de registros em uma tabela?
- [ ] SUM()  
- [x] COUNT()  
- [ ] AVG()  
- [ ] TOTAL()  

---

### 9. O que a cláusula `GROUP BY` faz em uma consulta SQL?
- [x] Agrupa resultados por uma ou mais colunas  
- [ ] Ordena os dados  
- [ ] Filtra os dados  
- [ ] Cria um índice  

---

### 10. Qual das opções abaixo cria uma nova tabela chamada `Clientes`?
- [ ] ADD TABLE Clientes  
- [ ] MAKE TABLE Clientes  
- [x] CREATE TABLE Clientes  
- [ ] NEW TABLE Clientes  

---

### 11. O que representa uma entidade em um modelo de dados?
- [ ] Uma consulta SQL  
- [ ] Um valor numérico  
- [ ] Um conjunto de procedimentos  
- [x] Um objeto ou conceito que pode ter dados armazenados  

---

### 12. Em um diagrama Entidade-Relacionamento (DER), o que representa um losango?
- [ ] Entidade  
- [ ] Atributo  
- [x] Relacionamento  
- [ ] Chave primária  

---

### 13. O que é uma chave primária?
- [ ] Um campo que armazena fórmulas  
- [ ] Um campo opcional em uma tabela  
- [x] Um campo que identifica exclusivamente cada registro de uma tabela  
- [ ] Um campo que relaciona duas tabelas  

---

### 14. Qual é a função de uma chave estrangeira?
- [ ] Criar índices automáticos  
- [ ] Armazenar dados temporários  
- [ ] Permitir transações paralelas  
- [x] Fazer referência a uma chave primária de outra tabela  

---

### 15. Qual das alternativas representa um atributo composto?
- [ ] Nome  
- [x] Endereço (com rua, número, cidade)  
- [ ] Idade  
- [ ] Telefone  

---

### 16. O que é cardinalidade em modelagem de dados?
- [ ] A quantidade de dados que uma tabela pode armazenar  
- [ ] O tipo de dado armazenado em uma coluna  
- [ ] A quantidade de registros duplicados  
- [x] A quantidade de ocorrências de um relacionamento entre entidades  

---

### 17. O que significa normalizar um banco de dados?
- [ ] Criar índices em todas as colunas  
- [ ] Garantir a consistência de tipos de dados  
- [x] Eliminar redundâncias e melhorar a estrutura das tabelas  
- [ ] Adicionar mais tabelas para dificultar o acesso  

---

### 18. Qual forma normal remove grupos repetitivos de dados?
- [x] Primeira Forma Normal (1FN)  
- [ ] Segunda Forma Normal (2FN)  
- [ ] Terceira Forma Normal (3FN)  
- [ ] Forma Normal de Boyce-Codd (BCNF)  

---

### 19. O que é uma tabela associativa?
- [ ] Uma tabela que contém apenas atributos compostos  
- [ ] Uma tabela sem chave primária  
- [x] Uma tabela usada para representar relacionamentos muitos-para-muitos  
- [ ] Uma tabela temporária criada para testes  

---

### 20. Qual é o objetivo principal da modelagem conceitual?
- [ ] Criar índices e performance  
- [ ] Modelar como os dados são fisicamente armazenados  
- [x] Representar a estrutura lógica do banco com foco no negócio  
- [ ] Escrever instruções SQL diretamente  

---

### 21. Qual tipo de dado é mais apropriado para armazenar datas no SQL Server?
- [ ] VARCHAR  
- [ ] INT  
- [x] DATE  
- [ ] FLOAT  

---

### 22. Qual tipo de dado é mais indicado para armazenar valores monetários com precisão?
- [x] MONEY  
- [ ] FLOAT  
- [ ] INT  
- [ ] CHAR  

---

### 23. O tipo `VARCHAR` no SQL Server é usado para:
- [ ] Armazenar números inteiros  
- [ ] Armazenar texto com tamanho fixo  
- [x] Armazenar texto com tamanho variável  
- [ ] Armazenar dados binários  

---

### 24. Qual a diferença entre os tipos `CHAR(n)` e `VARCHAR(n)`?
- [ ] `CHAR` aceita apenas letras maiúsculas  
- [ ] `CHAR` armazena números, `VARCHAR` armazena texto  
- [x] `CHAR` usa tamanho fixo, `VARCHAR` usa tamanho variável  
- [ ] `VARCHAR` ocupa mais espaço que `CHAR` sempre  

---

### 25. Qual tipo de dado armazena apenas dois valores: verdadeiro ou falso?
- [ ] TINYINT  
- [ ] SMALLINT  
- [ ] BIT  
- [x] BOOL  

---

### 26. Para armazenar um número com casas decimais e alta precisão, qual tipo é mais indicado?
- [x] DECIMAL  
- [ ] INT  
- [ ] TEXT  
- [ ] BIT  

---

### 27. Qual tipo de dado deve ser usado para armazenar grandes quantidades de texto (acima de 8000 caracteres)?
- [x] VARCHAR(MAX)  
- [ ] CHAR(8000)  
- [ ] NVARCHAR(50)  
- [ ] TEXT(10000)  

---

### 28. Qual tipo de dado é ideal para armazenar arquivos binários como imagens ou PDFs?
- [x] VARBINARY(MAX)  
- [ ] NVARCHAR(MAX)  
- [ ] TEXT  
- [ ] FLOAT  

---

### 29. O tipo `UNIQUEIDENTIFIER` é usado para armazenar:
- [ ] Um número sequencial  
- [ ] Um valor booleano  
- [x] Um identificador globalmente único (GUID)  
- [ ] Uma data e hora atual  

---

### 30. Qual tipo de dado é usado para armazenar valores com data e hora juntos?
- [ ] TIME  
- [ ] DATE  
- [x] DATETIME  
- [ ] CHAR  

---

### 31. Qual dos exemplos abaixo representa corretamente um relacionamento de cardinalidade N:1?
- [ ] Um produto pode ter vários pedidos associados  
- [ ] Um aluno pode estar em várias turmas  
- [x] Vários funcionários podem trabalhar em um único departamento  
- [ ] Um livro pode ter vários autores  

---

### 32. Quando uma entidade participa de um relacionamento com cardinalidade mínima igual a 1, isso indica que:
- [ ] Sua participação é opcional  
- [ ] Ela não pode participar do relacionamento  
- [x] Ela deve obrigatoriamente participar do relacionamento  
- [ ] O relacionamento é sempre de N:N  

---

### 33. Em um relacionamento 1:N entre `Cliente` e `Pedido`, qual seria a interpretação correta?
- [ ] Um cliente pode fazer vários pedidos e um pedido pode ter vários clientes  
- [x] Um cliente pode fazer vários pedidos, mas cada pedido pertence a apenas um cliente  
- [ ] Um pedido pode pertencer a vários clientes  
- [ ] Um cliente só pode ter um pedido  

---

### 34. Um relacionamento com cardinalidade mínima 0 e máxima N significa que:
- [ ] A participação da entidade no relacionamento é obrigatória e única  
- [ ] A entidade sempre estará presente no relacionamento  
- [x] A participação é opcional e pode ter várias ocorrências  
- [ ] Não é possível modelar esse tipo de relacionamento  

---

### 35. O que ocorre se uma cardinalidade for mal definida no modelo conceitual?
- [ ] O sistema rodará mais rápido  
- [x] Pode causar inconsistência nos dados e falhas na lógica do negócio  
- [ ] As consultas SQL se tornam mais fáceis  
- [ ] O banco de dados funcionará normalmente sem impacto  

---

### 36. Qual o papel da tabela associativa ao transformar um relacionamento N:N em um modelo lógico?
- [ ] Armazenar índices para otimizar o desempenho  
- [ ] Substituir as entidades envolvidas  
- [x] Registrar as ocorrências do relacionamento e conter as chaves estrangeiras de ambas as entidades  
- [ ] Eliminar a necessidade de normalização  

---

### 37. Em um relacionamento 1:1 com participação opcional em ambos os lados, qual abordagem pode ser usada no modelo lógico?
- [ ] Criar uma nova tabela para o relacionamento  
- [ ] Unir as tabelas em uma única entidade  
- [x] Colocar a chave primária de qualquer uma das entidades como chave estrangeira na outra, permitindo NULL  
- [ ] Usar cardinalidade N:N para simplificar  

---

### 38. Quando a cardinalidade é N:N e o relacionamento possui atributos próprios, o que deve ser feito no modelo lógico?
- [ ] Ignorar os atributos  
- [ ] Criar uma nova entidade fraca  
- [x] Criar uma tabela associativa com os atributos do relacionamento  
- [ ] Armazenar os atributos nas entidades originais  

---

### 39. Em um DER, como a cardinalidade máxima "1" é representada graficamente?
- [ ] Com um traço duplo  
- [ ] Com um losango duplo  
- [x] Com uma linha simples e um traço perpendicular próximo à entidade  
- [ ] Com um símbolo de ∞ (infinito)  

---

### 40. Em modelagem de dados, qual das opções abaixo representa um relacionamento de dependência fraca com cardinalidade 1:N?
- [x] Um aluno que depende de um professor exclusivo  
- [ ] Um pedido que deve ter um cliente  
- [ ] Um histórico de notas vinculado a um aluno  
- [ ] Um comentário que pertence a uma única postagem  

---

### 41. Qual comando DML é utilizado para modificar dados existentes em uma tabela?
- [ ] INSERT  
- [ ] DELETE  
- [x] UPDATE  
- [ ] SELECT  

---

### 42. O comando `DELETE FROM tabela WHERE condição` faz parte de qual categoria?
- [ ] DCL  
- [ ] DTL  
- [ ] DDL  
- [x] DML  

---

### 43. Qual tipo de JOIN retorna apenas os registros que possuem correspondência em ambas as tabelas?
- [ ] LEFT JOIN  
- [ ] RIGHT JOIN  
- [x] INNER JOIN  
- [ ] FULL OUTER JOIN  

---

### 44. Qual tipo de JOIN retorna todos os registros da tabela da esquerda, e os correspondentes da direita (se existirem)?
- [ ] INNER JOIN  
- [ ] CROSS JOIN  
- [x] LEFT JOIN  
- [ ] RIGHT JOIN  

---

### 45. Qual função agregada retorna o maior valor de uma coluna?
- [ ] COUNT()  
- [ ] SUM()  
- [x] MAX()  
- [ ] AVG()  

---

### 46. Qual função retorna a quantidade total de linhas em um conjunto de resultados?
- [ ] COUNT(*)  
- [ ] SUM()  
- [ ] LEN()  
- [x] ROW_NUMBER()  

---

### 47. Qual função retorna a data e hora atual do sistema no SQL Server?
- [ ] GETTIME()  
- [x] CURRENT_TIMESTAMP  
- [ ] DATETIME()  
- [ ] NOW()  

---

### 48. Para extrair apenas o ano de um campo do tipo `DATETIME`, usa-se:
- [ ] GETYEAR(data)  
- [x] DATEPART(YEAR, data)  
- [ ] EXTRACT(YEAR FROM data)  
- [ ] YEAR(data)  

---

### 49. Qual comando DTL é utilizado para garantir que um conjunto de alterações seja feito de forma atômica?
- [x] COMMIT  
- [ ] GRANT  
- [ ] ALTER  
- [ ] EXEC  

---

### 50. Qual das alternativas representa uma consulta que retorna os cinco maiores salários da tabela `Funcionarios`?
- [x] `SELECT TOP 5 Salario FROM Funcionarios ORDER BY Salario DESC`  
- [ ] `SELECT FIRST 5 Salario FROM Funcionarios ORDER BY Salario DESC`  
- [ ] `SELECT * FROM Funcionarios LIMIT 5 BY Salario DESC`  
- [ ] `SELECT Salario FROM Funcionarios WHERE ROWNUM <= 5`  

---

### 51. Qual cláusula é utilizada para ordenar os resultados de uma consulta `SELECT`?
- [ ] GROUP BY  
- [x] ORDER BY  
- [ ] HAVING  
- [ ] WHERE  

---

### 52. O que acontece quando se omite a cláusula `WHERE` em um comando `SELECT`?
- [ ] A consulta retorna erro  
- [ ] Nenhum dado é retornado  
- [ ] Apenas colunas com índice são retornadas  
- [x] Todos os registros da tabela são retornados  

---

### 53. Qual comando retorna apenas valores distintos de uma coluna?
- [ ] SELECT UNIQUE  
- [ ] SELECT FIRST  
- [x] SELECT DISTINCT  
- [ ] SELECT FILTER  

---

### 54. Qual é a finalidade de uma subconsulta no `WHERE`?
- [ ] Agrupar resultados de várias tabelas  
- [ ] Criar uma nova tabela temporária  
- [x] Filtrar os dados com base em outra consulta  
- [ ] Aplicar funções agregadas na cláusula `SELECT`  

---

### 55. Qual é a principal diferença entre uma subconsulta escalar e uma subconsulta de tabela?
- [ ] A subconsulta escalar retorna várias colunas  
- [x] A subconsulta escalar retorna apenas um valor  
- [ ] A subconsulta de tabela sempre retorna um valor NULL  
- [ ] Não há diferença técnica entre elas  

---

### 56. Qual operador é comumente usado para comparar o resultado de uma subconsulta com múltiplos valores?
- [ ] BETWEEN  
- [ ] EXISTS  
- [x] IN  
- [ ] IS NULL  

---

### 57. Dado o seguinte cenário, o que o SQL faz?

```sql
SELECT Nome
FROM Alunos
WHERE Nota > (SELECT AVG(Nota) FROM Alunos);
```

- [ ] Seleciona alunos com notas iguais à média  
- [ ] Seleciona todos os alunos  
- [ ] Seleciona alunos com notas abaixo da média  
- [x] Seleciona alunos com notas acima da média  

---

### 58. Em qual parte da instrução `SELECT` uma subconsulta **não pode** ser usada?
- [ ] Na cláusula `SELECT`  
- [ ] Na cláusula `WHERE`  
- [x] Na cláusula `FROM`  
- [ ] Não existe limitação — pode em todas  

---

### 59. Qual comando limita a quantidade de registros retornados em uma consulta no SQL Server?
- [ ] LIMIT  
- [ ] ROWNUM  
- [x] TOP  
- [ ] FIRST  

---

### 60. O que o operador `EXISTS` verifica em uma subconsulta?
- [ ] Se o valor é maior que zero  
- [x] Se existe pelo menos uma linha retornada  
- [ ] Se a tabela contém dados NULL  
- [ ] Se a subconsulta contém funções de agregação


---

# 📝 Questões Dissertativas sobre Modelagem de Dados

### 1. Explique a diferença entre os modelos conceitual, lógico e físico de banco de dados. Dê exemplos práticos de como uma entidade pode ser representada em cada um.
1- O objetivo dos modelos conceitual é representar a estrutura lógica do banco com foco no negócio e os relacionamentos são representados através de Losangos e as cardinalidades representadas por Números, letras e Simbolos e é projetada para os mais leigos entenderem (Alto nível).

2- A modelagem lógica é uma modelagem mais baixo nível voltada para os desenvolvedores e analistas entenderem e contém os atributos e seu respectivo tipo, e os relacionamentos são mostrados através de chave primária e secundária, relacionamentos N:N é entendido pela presença de uma tabela de junção ou assossiativa.
Essa modalegem ainda independe de um banco de dados.

3- A modelagem física é a fase que deve-se escolher o banco de dados de acordo com a necessidade, valores e escalabilidade do projeto.
Após isso, os dados das entidades da modelagem lógica se transformam em física, os relacionamentos são feitos através da constraint FOREIGN KEY referenciando a chave primária de outra tabela.
Também define as constraints de acordo com a regra de negócio, após isso, o banco pode ser populado (Armazenar dados) para serem consultados, modificados ou excluídos.
Lembrando, uma má construção da modelagem lógica, vai resultar em uma má modelagem física. 
---

### 2. O que é normalização em modelagem de dados? Descreva pelo menos três formas normais e explique a importância de cada uma na estruturação de um banco de dados.
A normalização na modelagem de dados é a prática de evitar redundâncias e melhorar a consistência dos dados.
Apesar de algumas consultas demorarem mais.

1FN: Remove os atributos multivalorado e composto, transformando em uma tabela para evitar redundância, o exemplo mais comum de atributo composto é o endereço: rua, número, bairro etc... Um exemplo de multivalorado é o telefone, alguns sistemas pedem telefone secundário, então precisa estar e uma tabela separada.

2FN: Remove as dependencias funcionais parciais, faz com que atributos que não dependem totalmente da chave primária sejam movidos para a tabela correspondente.

3FN: Remove dependências transitivas, remove a dependência de um atributo com outro atributo da mesma tabela.
---

### 3. Considere o relacionamento entre as entidades `Aluno` e `Turma`. Descreva os possíveis tipos de cardinalidade que podem existir entre elas e qual o impacto disso no modelo lógico.
Nesse caso, a cardinalidade vai depender muito da regra de negócios.
A cardinalidade mais comum é a Aluno:N Turma:1 Ou seja, um Aluno pode estar em 1 turma e 1 turma pode ter 1 ou vários alunos.

Também vejo a possibilidade de Aluno:N Turma:N Criando uma tabela de junção ou associativa Onde o aluno pode estar em 1 ou mais turmas e uma turma pode ter 1 ou mais aluno.
---

### 4. Defina o que é uma entidade fraca e explique em quais cenários ela é utilizada. Ilustre com um exemplo.
Uma entidade fraca depende totalmente da tabela pai para existir, geralmente permite um relacionamento 0,N.
Um exemplo mais comum é dependente, Cadastrando um colaborador em uma empresa, pode ou não existir dependente, nesse caso, dependente só existe se caso a tabela colaborador(pai) insira um dependente.
---

### 5. Qual a função das chaves primárias e estrangeiras na modelagem de dados? Mostre com um exemplo como elas ajudam a garantir integridade referencial.
A chave primária é um campo que identifica exclusivamente cada registro de uma tabela.
A chave estrangeira possui a função de fazer referência a uma chave primária de outra tabela.
A integridade referencial é garantida através da referência que uma chave primária existenta, caso contrário, retorne erro.
---

### 6. O que caracteriza um bom projeto de modelagem de dados? Liste e explique pelo menos três boas práticas que devem ser seguidas.
Um bom projeto de modelagem de dados (sql OLTP) precisa estar pelo menos nas 3 formas normais citadas abaixo:
1FN, 2FN, 3FN
1- Boa prática: Separar atributos compostos e multivalorados em tabelas separadas para evitar redundância.
2- Boa prática: Manter um padrão de case na estrutura, ex: não criar um atributo chamado IdAluno em uma entidade e utilizar Id_Professor em outra, ou até mesmo inverter a escrita, IdAluno, ProfessorId.
3- Boa prática: Escrever sempre por extenso: Evitar NomeA, escreva NomeAluno, criando entidades, evitar A, escreva Aluno, o Alias deve ser utilizado em consultas como: Aluno A ou AS A se preferir, até mesmo 'A' [A]
EXTRA: Mantenha sempre o código bem indentado (Definido pelo time) indentação ajuda na hora de analisar o código e encontrar erros mais fácilmente, também ajuda na manutenção, com a mente costumada, a indentação ajuda a encontrar os padrões e a mente cansa menos.
---

### 7. Explique a diferença entre atributos simples, compostos e derivados. Dê um exemplo para cada tipo.
Atributo simples: Armazena um valor atômico, EX: Nome 'Lindemberg'
Atributo composto: O exemplo mais comum de atributo composto é o endereço: rua, número, bairro etc... 
Atributo multivalorado: Um exemplo de multivalorado é o telefone, alguns sistemas pedem telefone secundário EX: Telefone '88888888888, 99999999999', então precisa estar e uma tabela separada. 
---

### 8. Um analista propôs unir várias tabelas de um sistema em uma única tabela grande para facilitar consultas. Discuta as vantagens e desvantagens dessa abordagem.
A maior vantagem de unir várias tabelas é aumentar a velocidade das consultas, recomendo que a união seja feita em casos que a integridade e redundância dos dados seja permitida sem afetar negativamente o sistema
Usado primcipalmente em sistemas OLAP, otimizado para leitura e análise de dados.

A principal desvantagem é a redundância e inconsistência dos dados, deve-se atentar que sistemas OLTP necessita de uma normalização pelo menos até a 3FN para funcionar corretamente.
Atômicidade, durabilidade e isolamento são essenciais.
---

### 9. Descreva o processo de transformar um modelo conceitual (como um DER) em um modelo lógico. Quais elementos precisam ser adaptados nesse processo?
O processo de transformação de modelo conceitual para lógico é a transcrição de um modelo de Alto nível em um modelo de baixo nível que é o lógico.
A cardinalidade é convertida na criação de uma entidade caso seja N:N.
Os relacionamento são feitos através de chave estrangeira através da referência da chave primária de outra tabela.
Relacionamenos opcionais 0:N, 0:1, demostradas por uma chave estrangeira que pode ser conter valor nulo.
Para fazer o processo de normalização, atributo composto e multivalorado, transformam-se em tabela.
---

### 10. Analise o impacto de não utilizar corretamente as cardinalidades em um modelo de dados. Quais problemas isso pode gerar no sistema e no desempenho do banco?
Utilizar cardinalidade de forma incorreta afetará causa incosistência e redundância nos dados, também causa problema na hora de inserção, atualização e exclusão dos dados.
EX: Com a cardinalidade errada, cadastra um pedido sem a chave primária do Cliente.
Outro exemplo é o fornecedor obrigatório na regra de negócios e o ID do fornecedor na entidade Produto como null.
Caso faça uma consulta para buscar os produtos de um fornecedor X, o produto que for cadastrado com o ID do fornecedor null, não vai aparecer no filtro, a não ser que use left ou right join, mesmo assim aparece null.
---

### 11. Explique a diferença entre os comandos `DELETE`, `TRUNCATE` e `DROP`. Em quais situações cada um deve ser utilizado?
DELETE: é o mais comum em casos que necessita excluir apenas registros filtrados com o WHERE (Delete mais lento), também utilizado por quê registra logs e é fácil de recuperar dados principalmente em exclusão acidental (DELETE sem WHERE)

TRUNCATE: Mais utilizado para exclusões rápidas, mantendo a extrutura da tabela e zerando o Id AUTO_INCREMENT (IDENTITY) No SQL Server.
ATENÇÃO(Não são registrados logs de exclusão) Ou seja, muito difícil de recuperar os dados sem um backup feito anteriormente.

DROP: Exclui a tabela do banco de dados (Precisa remover as referências para poder excluir, caso contrário, dá erro), utilizado quando a Entidade torna-se desnecessária.
---

### 12. Descreva como funciona o comando `JOIN` no SQL Server. Quais os tipos existentes e quando cada um é mais apropriado?
INNER JOIN: O mais utilizado, pois retorna apenas os dados que possui correspondência entre as tabelas.
LEFT JOIN: Retorna os dados da tabela da esquerda e os dados correspondentes da tabela da direita.
RIGHT JOIN: Retorna os dados da tabela da direita e os dados correspondentes da tabela da esquerda.
FULL JOIN: Retorna os dados de ambas as tabelas.
---

### 13. O que são funções agregadas em SQL Server? Cite e explique pelo menos três delas com exemplos de uso prático.
Funções agregadas são utilizadas para operações matemáticas, Contar registros, linhas, soma, média, valor mínimo(mais barato/ menos vendido) e máximo de algo(mais caro/ mais vendido) 
Caso precise mostrar dados como NomeProduto, PrecoProduto,
GROUP BY NomeProduto,PrecoProduto;
---

### 14. Discuta a importância da utilização de índices em tabelas no SQL Server. Quais são os tipos de índices disponíveis e como eles impactam na performance?
A importância da utilização de índices em tabelas é a maior velocidade de consultas em tabelas com um alto número de registros e na utilização de paginação.
OS tipos.

Indice Clusterizado: Organiza os itens da Entidade de acordo com a chave primária.
Indice NÃO Clusterizado: Necessita de uma criação de um indice para buscar os dados.
Indice Único: Indice que registra as chaves primárias que são registros únicos.
---

### 15. Explique o que são transações no SQL Server. Mostre como criar uma transação simples e como ela pode ajudar a manter a integridade dos dados.
Transações são operações que são totalmente completadas ou recusadas de acordo com os CASES, ou seja, caso dê tudo certo, faz um COMMIT, caso algo dê errado, é feito o ROLLBACK.
Ajuda na integridade dos dados: Caso mais comum é o dinheiro em uma transferência, o saldo só muda de uma conta quando cai na outra, caso dê algum erro, os dados continuam intáctos, não existe a possibilidade de ser descontado sem cair na conta do recebedor.
---

### 16. Qual a diferença entre os tipos de dados `CHAR`, `VARCHAR`, `NCHAR` e `NVARCHAR`? Em que casos é melhor usar cada um?
CHAR(Quantidade fixa): Suporta textos com uma quantidade de caracteres fixo.

VARCHAR(Quantidade máxima): Suporta textos com uma quantidade caracteres variável.

NCHAR: Suporta textos com uma quantidade de caracteres fixo com uma vantagem de ser mais apropriado para receber caracteres especiais como por exemplo: letra Mandarin.
Tem a desvantagem que ao invés de usar 1 bit, usa 2.

NVARCHAR: Suporta textos com uma quantidade caracteres variável com uma vantagem de ser mais apropriado para receber caracteres especiais como por exemplo: letra Mandarin.
Tem a desvantagem que ao invés de usar 1 bit, usa 2.
---

### 17. O que são procedures armazenadas (stored procedures)? Quais as vantagens de utilizá-las em vez de executar comandos SQL diretamente na aplicação?

---

### 18. Descreva o funcionamento da cláusula `GROUP BY` e da cláusula `HAVING`. Em quais situações elas são usadas em conjunto?
A cláusula GROUP BY é utilizada quando usamos função agregada e queremos mostrar um valor ex: C.Nome, usa um GROUP BY C.Nome, sem agrupar, dá erro.
O HAVING é utilizado para filtrar dados após o agrupamento EX GROUP BY A.Idade HAVING A.Idade >= 18, filtra o resultado para mostrar apenas alunos maiores de idade. 
---

### 19. O que são funções de data no SQL Server? Cite e explique pelo menos duas delas e como podem ser aplicadas em consultas.
A função de data mais comum é o GETDATE() busca a data hora atual do sistema.
A função que mais utilizo é a DATEPART(YEAR, DataPedido) Busca o ano do pedido. uso mais comum: YEAR,MONTH,DAY,HOUR.

Extra: DATEDIFF(DAY, DataHospedagem, GETDATE()) Mostra quantos dias o hospede ficou hospedado.
---

### 20. Comente sobre os principais mecanismos de segurança do SQL Server relacionados a controle de acesso. Como usuários e permissões são gerenciados?
O principal mecanismo de segurança é a utilização de permissões geridas pelo Administrador do banco de dados, utiliza-se da linguagem DCL para manipular permissões dos usuários de acordo com as Roles EX Atendente de caixa, Fiscal, a fiscal possui permissões a mais.
INSTRUÇÕES DCL são:
GRANT, DENIED E REVOKE.
