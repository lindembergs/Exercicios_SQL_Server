# SIMULADO - MÓDULO 2: MODELAGEM DE DADOS E SQL SERVER
## TRILHA .NET 2025 - SMN TECNOLOGIA DA INFORMAÇÃO

**Nome do Estagiário**: _Lindemberg

**Data**: 12/08/2025

### INSTRUÇÕES:
1. Este simulado contém 25 questões de múltipla escolha para preparação para as avaliações.
2. Duração sugerida: 90 minutos.
3. Este simulado é uma ferramenta de estudo e não conta para a nota final.
4. Use-o para identificar pontos que precisam de mais estudo.
5. Ao final, confira suas respostas com o gabarito.

---

## QUESTÕES DE MÚLTIPLA ESCOLHA (25 QUESTÕES)

### Bloco 1: Conceitos Fundamentais de Banco de Dados (5 questões)

**1)** Qual das seguintes opções melhor define um banco de dados relacional?
   
a) Um sistema que armazena dados em formato de texto  
**b)** Uma coleção de dados organizados em tabelas relacionadas entre si  
c) Um arquivo único que contém todas as informações  
d) Um sistema que só funciona com números  
e) Uma planilha eletrônica avançada  

**2)** Qual é a principal diferença entre dados e informação?
   
a) Não há diferença, são sinônimos  
b) Dados são processados, informação são fatos brutos  
**c)** Dados são fatos brutos, informação são dados processados com significado  
d) Informação é sempre numérica, dados podem ser texto  
e) Dados são sempre verdadeiros, informação pode ser falsa  

**3)** O que caracteriza um SGBD (Sistema de Gerenciamento de Banco de Dados)?
   
a) Apenas armazena dados  
**b)** Software que permite criar, manter e usar bancos de dados  
c) Um tipo específico de banco de dados  
d) Funciona apenas com dados numéricos  
e) É sempre gratuito  

**4)** Qual das seguintes opções NÃO é um exemplo de banco de dados não relacional?
   
a) MongoDB  
b) Redis  
**c)** MySQL  
d) Cassandra  
e) DynamoDB  

**5)** No modelo relacional, como são chamados os dados organizados em linhas e colunas?
   
a) Documentos  
**b)** Relações (tabelas)  
c) Arrays  
d) Listas  
e) Estruturas  

### Bloco 2: Modelo Relacional e Modelagem (5 questões)

**6)** Segundo Edgar F. Codd, qual propriedade das relações garante que não existam tuplas duplicadas?
   
a) Atomicidade  
**b)** Unicidade  
c) Consistência  
d) Integridade  
e) Normalização  

**7)** Qual é a principal característica que distingue o modelo conceitual do modelo lógico?
   
a) O conceitual é mais complexo  
**b)** O conceitual é independente de SGBD, o lógico considera o tipo de SGBD  
c) O lógico não tem relacionamentos  
d) O conceitual só é usado para bancos pequenos  
e) Não há diferença prática entre eles  

**8)** Em um diagrama ER, como são representados os relacionamentos?
   
a) Retângulos  
b) Círculos  
**c)** Losangos  
d) Triângulos  
e) Linhas simples  

**9)** O que representa uma tupla no modelo relacional?
   
a) Uma coluna da tabela  
**b)** Uma linha da tabela (registro)  
c) O nome da tabela  
d) A chave primária  
e) O relacionamento entre tabelas  

**10)** Qual dos seguintes é um modelo de dados?
   
a) SQL Server  
b) MySQL  
**c)** Modelo Entidade-Relacionamento  
d) Oracle  
e) PostgreSQL  

### Bloco 3: Entidades, Atributos e Relacionamentos (5 questões)

**11)** Um atributo que pode ter múltiplos valores para uma única entidade é chamado de:
   
a) Atributo simples  
b) Atributo composto  
**c)** Atributo multivalorado  
d) Atributo derivado  
e) Atributo chave  

**12)** Em um relacionamento 1:N (um para muitos), onde deve estar a chave estrangeira no modelo físico?
   
a) Na entidade do lado "1"  
**b)** Na entidade do lado "N"  
c) Em uma tabela separada  
d) Em ambas as entidades  
e) Não é necessária chave estrangeira  

**13)** Como deve ser implementado um relacionamento N:N (muitos para muitos)?
   
a) Com chave estrangeira em uma das tabelas  
b) Com chave estrangeira em ambas as tabelas  
**c)** Com uma tabela intermediária (associativa)  
d) Não pode ser implementado no modelo relacional  
e) Usando apenas índices  

**14)** Qual tipo de atributo é calculado a partir de outros atributos?
   
a) Atributo simples  
b) Atributo composto  
c) Atributo multivalorado  
**d)** Atributo derivado  
e) Atributo obrigatório  

**15)** Em um sistema de e-commerce, qual seria o relacionamento entre Cliente e Pedido?
   
a) 1:1 (um para um)  
**b)** 1:N (um para muitos)  
c) N:N (muitos para muitos)  
d) Não há relacionamento  
e) Depende do sistema  

### Bloco 4: Chaves e Normalização (5 questões)

**16)** Qual das seguintes afirmações sobre chave primária é FALSA?
   
a) Identifica unicamente cada registro  
b) Não pode ter valores nulos  
c) Não pode ter valores duplicados  
**d)** Pode ser alterada frequentemente  
e) Pode ser composta por múltiplas colunas  

**17)** O que garante a integridade referencial em um banco de dados?
   
a) Chaves primárias  
**b)** Chaves estrangeiras  
c) Índices  
d) Views  
e) Triggers  

**18)** Qual é o principal objetivo da normalização?
   
a) Aumentar a velocidade das consultas  
b) Reduzir o tamanho do banco  
**c)** Eliminar redundâncias e anomalias  
d) Facilitar a programação  
e) Reduzir o número de tabelas  

**19)** Para uma tabela estar na Primeira Forma Normal (1FN), ela deve:
   
a) Ter chave primária definida  
b) Eliminar dependências transitivas  
**c)** Ter valores atômicos em todas as células  
d) Eliminar dependências parciais  
e) Ter relacionamentos definidos  

**20)** A Terceira Forma Normal (3FN) elimina:
   
a) Valores multivalorados  
b) Dependências parciais  
**c)** Dependências transitivas  
d) Chaves compostas  
e) Relacionamentos N:N  

### Bloco 5: SQL e SQL Server (5 questões)

**21)** Qual comando SQL é usado para alterar a estrutura de uma tabela existente?
   
a) UPDATE TABLE  
b) MODIFY TABLE  
**c)** ALTER TABLE  
d) CHANGE TABLE  
e) EDIT TABLE  

**22)** Na consulta "SELECT Nome FROM Produtos WHERE Preco > 100 ORDER BY Nome", qual cláusula filtra os registros?
   
a) SELECT  
b) FROM  
**c)** WHERE  
d) ORDER BY  
e) Nome  

**23)** Qual função agregada SQL retorna o maior valor de uma coluna?
   
a) SUM()  
b) AVG()  
c) COUNT()  
**d)** MAX()  
e) TOP()  

**24)** Qual tipo de JOIN retorna todos os registros da tabela esquerda, mesmo que não tenham correspondência na tabela direita?
   
a) INNER JOIN  
**b)** LEFT JOIN  
c) RIGHT JOIN  
d) FULL OUTER JOIN  
e) CROSS JOIN  

**25)** No SQL Server, qual ferramenta é usada principalmente para gerenciar bancos de dados através de interface gráfica?
   
a) Visual Studio  
b) SQL Server Configuration Manager  
**c)** SQL Server Management Studio (SSMS)  
d) SQL Server Agent  
e) SQL Server Profiler  

---

## SEÇÃO DE AUTOAVALIAÇÃO

Após responder todas as questões, use esta seção para analisar seu desempenho:

### Contagem de Acertos por Bloco:

**Bloco 1 - Conceitos Fundamentais:** ___/5  
**Bloco 2 - Modelo Relacional:** ___/5  
**Bloco 3 - Entidades e Relacionamentos:** ___/5  
**Bloco 4 - Chaves e Normalização:** ___/5  
**Bloco 5 - SQL e SQL Server:** ___/5  

**TOTAL:** ___/25 (___%*)

### Interpretação do Resultado:

- **20-25 acertos (80-100%):** Excelente! Você está bem preparado.
- **15-19 acertos (60-79%):** Bom desempenho, revise os tópicos com erros.
- **10-14 acertos (40-59%):** Precisa de mais estudo, foque nos conceitos básicos.
- **Menos de 10 acertos (<40%):** Retome a jornada de estudos desde o início.

### Tópicos que Precisam de Mais Estudo:

Com base nos erros, marque os tópicos para revisão:

- [ ] Conceitos fundamentais de banco de dados
- [ ] Diferenças entre dados, informação e conhecimento
- [ ] Modelo relacional e suas propriedades
- [ ] Modelagem conceitual, lógica e física
- [ ] Diagramas ER e seus componentes
- [ ] Tipos de atributos
- [ ] Relacionamentos e cardinalidades
- [ ] Implementação de relacionamentos N:N
- [ ] Chaves primárias e estrangeiras
- [ ] Integridade referencial
- [ ] Normalização (1FN, 2FN, 3FN)
- [ ] Comandos SQL básicos (DDL e DML)
- [ ] Cláusulas WHERE, ORDER BY, GROUP BY
- [ ] Funções agregadas
- [ ] Tipos de JOIN
- [ ] SQL Server e SSMS

### Próximos Passos de Estudo:

1. **Se seu desempenho foi baixo (<60%):**
   - Revise os conceitos fundamentais na jornada de estudos
   - Refaça os exercícios práticos do dia a dia
   - Assista novamente aos vídeos recomendados
   - Pratique criação de diagramas ER

2. **Se seu desempenho foi médio (60-79%):**
   - Foque nos tópicos específicos com erros
   - Pratique mais exercícios de SQL
   - Revise normalização com exemplos práticos
   - Teste comandos no SQL Server

3. **Se seu desempenho foi alto (80%+):**
   - Revise apenas os tópicos com erros específicos
   - Pratique exercícios mais avançados
   - Foque na parte prática para a avaliação
   - Ajude colegas com dificuldades

### Material de Apoio para Revisão:

**Links importantes da jornada:**
- [Conceitos Fundamentais de Banco de Dados - Bóson Treinamentos](https://www.youtube.com/watch?v=Q_KTYFgvu1s)
- [Modelo Relacional - DevMedia](https://www.devmedia.com.br/modelo-relacional/7337)
- [Normalização de Dados - DevMedia](https://www.devmedia.com.br/normalizacao-de-dados/32516)
- [SQL Server T-SQL Cheat Sheet](https://www.w3schools.com/sql/default.asp)

**Ferramentas para prática:**
- [Draw.io](https://app.diagrams.net/) - Para diagramas ER
- [W3Schools SQL Exercises](https://www.w3schools.com/sql/sql_exercises.asp)
- [SQLZoo](https://sqlzoo.net/) - Exercícios interativos

---

## OBSERVAÇÕES IMPORTANTES

### Este simulado cobre:
- ✅ Conceitos fundamentais de banco de dados
- ✅ Modelo relacional e modelagem de dados
- ✅ Entidades, atributos e relacionamentos
- ✅ Chaves e normalização
- ✅ SQL básico e SQL Server

### Não esqueça de estudar também:
- Diagramas ER práticos
- Comandos SQL avançados (JOINs, subconsultas)
- Implementação prática no SQL Server
- Exercícios de normalização passo a passo

### Dicas para as avaliações oficiais:
1. **Leia com atenção** cada questão
2. **Elimine alternativas** claramente incorretas
3. **Gerencie o tempo** adequadamente
4. **Revise suas respostas** antes de finalizar
5. **Pratique SQL** no SSMS antes da prova prática

**Boa sorte nos estudos e nas avaliações!**

---

*Confira suas respostas com o gabarito e identifique os pontos que precisam de mais estudo.*