CREATE DATABASE Locadora_de_filmes;
go

USE Locadora_de_filmes;
GO
-- Criação da tabela Genero
CREATE TABLE Genero
(
Id INT PRIMARY KEY IDENTITY,
Descricao VARCHAR(50) NOT NULL
)

-- Criação da tabela Filme
CREATE TABLE Filme
(
Id INT PRIMARY KEY IDENTITY,
Titulo VARCHAR(150) NOT NULL,
Ano_Lancamento INT NOT NULL,
Id_Genero INT NOT NULL,
Duracao_Minutos INT NOT NULL,
Preco_Locacao DECIMAL(5,2),

CONSTRAINT fk_id_genero FOREIGN KEY(Id_Genero)
  REFERENCES Genero (Id)
)

-- Criação da tabela Cliente
CREATE TABLE Cliente 
(
Id INT PRIMARY KEY IDENTITY,
Nome VARCHAR(100) NOT NULL,
Email VARCHAR(100),
Data_Nascimento DATE
)

ALTER TABLE Cliente 
ADD CONSTRAINT unk_email UNIQUE (Email);

-- Criação da tabela Locacao
CREATE TABLE Locacao
(
Id INT PRIMARY KEY IDENTITY,
Id_Cliente INT NOT NULL,
Data_Locacao DATE NOT NULL,
Data_Devolucao DATE,
Valor_Total DECIMAL(6,2) NOT NULL

CONSTRAINT fk_id_cliente FOREIGN KEY (Id_Cliente)
   REFERENCES Cliente (Id)
)

-- Criação da tabela Filme_Locado
CREATE TABLE Filme_Locado
(
Id_Locacao INT NOT NULL,
Id_Filme INT NOT NULL,
PRIMARY KEY (Id_Locacao, Id_Filme),
CONSTRAINT fk_id_locacao FOREIGN KEY (Id_Locacao)
    REFERENCES Locacao (Id),
CONSTRAINT fk_id_filme FOREIGN KEY (Id_Filme)
   REFERENCES Filme (Id)
)

insert into Filme_Locado values (1,1)



-- 1 Inserir 2 Gêneros
SELECT * FROM Genero;

INSERT INTO Genero(Descricao)
VALUES('Ação'),('Comédia');

-- 2 Cadastrar 3 Filmes
SELECT * FROM Filme;

INSERT INTO Filme
(
Titulo,Ano_Lancamento,Id_Genero,Duracao_Minutos,Preco_Locacao
)
VALUES('Missão Impossível', 1996, 1, 110, 12.00),
('Se Beber Não Case!', 2009, 2, 100, 10.00),
('Duro de Matar', 1988, 1, 132, 11.50);

-- 3 Cadastrar cliente
SELECT * FROM Cliente;

INSERT INTO Cliente(Nome, Email, Data_Nascimento)
VALUES('Lucas Silva', 'lucas@email.com', '1990-03-15'); 

-- Comandos de Matheus para corrigir erro de current ID do SQL
SELECT IDENT_CURRENT ('Cliente');

DBCC CHECKIDENT(Cliente, RESEED, 0);

DELETE FROM Cliente;

-- 4 Registrar locação
SELECT * FROM Locacao;
DECLARE @Data_Locacao DATE = GETDATE();
DECLARE @Data_Devolucao DATE = DATEADD(DAY,5,@Data_Locacao);
INSERT INTO Locacao
(
Id_Cliente, Data_Locacao, Data_Devolucao, Valor_Total 
)
VALUES (1,@Data_Locacao,@Data_Devolucao, 12.00 + 11.50);

SELECT * FROM Filme_Locado;
SELECT * FROM Filme;
INSERT INTO Filme_Locado(Id_Locacao, Id_Filme)
VALUES(1, 1), (1, 3);

-- 5 Atualizar valor do filme
UPDATE Filme 
SET Preco_Locacao = 12.90
WHERE Filme.Id = 2;
-- 6 Liste todas as locações realizadas, exibindo: nome do cliente, data da locação, data de devolução, valor total e os títulos dos filmes locados.
SELECT 
    C.Nome 'Nome do cliente', 
    L.Data_Locacao 'Data da Locação',
    L.Data_Devolucao 'Data de Devolução',
    L.Valor_Total 'Valor total',
    F.Titulo
FROM Filme_Locado FL
INNER JOIN Locacao L
ON FL.Id_Locacao = L.Id
INNER JOIN Filme F
ON FL.Id_Filme = F.Id
INNER JOIN Cliente C
ON L.Id_Cliente = C.Id;

-- 7 Liste todos os filmes de Ação com preço acima de R$ 11,00.
SELECT * 
FROM Filme F
INNER JOIN Genero G
ON G.Id = F.Id_Genero 
WHERE F.Id_Genero = 1
AND F.Preco_Locacao > 11.00;

-- 8 Excluir filme
DELETE Filme
WHERE Filme.Id = 3;

-- 9 Atualize a locação de Lucas, preenchendo a data de devolução com a data atual.
SELECT * FROM Locacao;
UPDATE Locacao
SET Data_Devolucao = GETDATE()
WHERE Locacao.Id = 1;

-- 10 count group by have é depois que agrupar 
SELECT 
C.Nome, SUM(FL.Id_Locacao) 'Quantidade'
FROM Filme_Locado FL
INNER JOIN Cliente C
ON C.Id = FL.Id_Locacao
GROUP BY C.Nome
HAVING SUM(FL.Id_Locacao) > 1;

-- 1️1️ Exiba a quantidade total de filmes cadastrados na locadora.
SELECT COUNT(*) 'Quantidade de locações'
FROM Locacao;

-- 12 Exiba o preço médio de locação dos filmes do gênero Comédia
SELECT * FROM Genero;
SELECT AVG(F.Preco_Locacao) AS 'Preço médio'
FROM Filme F
WHERE F.Id_Genero = 2;

-- 13 Liste cada gênero com a quantidade de filmes cadastrados nele.
SELECT G.Descricao Genero, COUNT(F.Id) 'Quantidade de Filmes'
FROM Genero G
INNER JOIN Filme F 
ON F.Id_Genero = G.Id
GROUP BY G.Descricao;

-- 14 Exiba o valor total arrecadado com locações já devolvidas.
SELECT SUM(L.Valor_Total) 'Valor total arrecadado com Devolução'
FROM Locacao L
WHERE L.Data_Devolucao < GETDATE();

-- 15 Para cada cliente, exiba: nome, total de locações realizadas e valor total gasto.
SELECT
C.Nome, COUNT(*) 'Total de Locações', SUM(L.Valor_Total) 'Valor Total'
FROM Locacao L
INNER JOIN Cliente C ON C.Id = L.Id_Cliente
GROUP BY C.Nome;









