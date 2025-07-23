CREATE DATABASE Controle_De_Vendas;
GO

USE Controle_De_Vendas;
GO

CREATE TABLE Cliente
(
Id INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NULL,
Data_Cadastro DATE DEFAULT GETDATE()
)

CREATE TABLE Produto
(
Id INT PRIMARY KEY IDENTITY,
Nome VARCHAR(100) NOT NULL,
Preco DECIMAL(10,2) CHECK(Preco > 0),
Estoque INT NOT NULL DEFAULT 0
)

CREATE TABLE Venda
(
Id INT PRIMARY KEY IDENTITY,
Id_Cliente INT NOT NULL,
Data_Venda DATE DEFAULT GETDATE(),
Valor_Total DECIMAL(10,2) NULL

CONSTRAINT FK_Id_Cliente FOREIGN KEY (Id_Cliente)
REFERENCES Cliente (Id)
)

CREATE TABLE Itens_Venda
(
Id INT PRIMARY KEY IDENTITY,
Id_Venda INT NOT NULL,
Id_Produto INT NOT NULL,
Quantidade INT CHECK (Quantidade > 0),
Preco_Unitario DECIMAL(10,2) NOT NULL

CONSTRAINT FK_Id_Venda FOREIGN KEY (Id_Venda)
REFERENCES Venda (Id),

CONSTRAINT FK_Id_Produto FOREIGN KEY (Id_Produto)
REFERENCES Produto (Id)
)

-- 5 Inserir dados na tabela Cliente
INSERT INTO Cliente (Nome, Email)
VAlUES('Berg', 'berg@email.com'),('Berg2', NULL), ('Berg3', 'berg3@email.com');

-- Descomentar e rodar essa linha para testar a questão 14
-- INSERT INTO Cliente (Nome, Email)
-- VAlUES('Berg3', 'berg3@email.com')

SELECT * FROM Cliente;

-- 6  Insira dois clientes com nomes e emails diferentes (um com email, outro sem).
INSERT INTO Produto(Nome, Preco, Estoque)
VALUES('Biscoito', 2.39, 150),('Macarrão', 2.79, 2),('Feijão', 10.00, 3);

SELECT * FROM Produto;

-- 7. Insira uma venda para o primeiro cliente.

INSERT INTO Venda(Id_Cliente, Data_Venda,Valor_Total)
VALUES(1, '22/07/2025', 5.18), (2, '23/07/2025', 5.18), (2, '24/07/2025', 25.23);

SELECT * FROM Venda;

--  8. Insira dois itens vendidos para a venda criada, com quantidades e precos validos.

INSERT INTO Itens_Venda(Id_Venda,Id_Produto,Preco_Unitario,Quantidade)
VALUES(1, 1, 2.39, 2), (1,2, 2.79, 3);

SELECT * FROM Itens_Venda;

-- 9. Liste todos os produtos com estoque menor que 10, ordenados por nome.

SELECT * 
FROM Produto
WHERE Estoque < 10;

-- 10. Liste os dados das vendas (ID, nome do cliente, data e valor total), da mais recente para a mais antiga.
SELECT V.Id, C.Nome, V.Data_Venda, V.Valor_Total
FROM Venda V
INNER JOIN Cliente C
ON V.Id_Cliente = C.Id
ORDER BY V.Id DESC;

--  11. Liste os itens vendidos da venda com Id = 1, mostrando: nome do produto, quantidade e preco unitario.
SELECT P.Nome, IV.Quantidade, IV.Preco_Unitario
FROM Venda V
INNER JOIN Itens_Venda IV
ON V.Id = IV.Id_Venda
INNER JOIN Produto P
ON IV.Id_Produto = P.Id
WHERE V.Id = 1;

--  12. Liste os nomes dos clientes que ainda nao realizaram nenhuma venda.
SELECT *
    FROM Cliente C
        WHERE NOT EXISTS (
            SELECT 1
                  FROM Venda V
                      WHERE V.Id_Cliente = C.Id
)

-- 13. Liste o total de vendas por cliente, exibindo: nome do cliente, quantidade de vendas e soma do valor total vendido.
SELECT C.Nome, COUNT(V.Id) 'Contagem de Vendas', SUM(V.Valor_Total) 'Valor Total'
FROM Venda V
INNER JOIN Cliente C
ON V.Id_Cliente = C.Id
GROUP BY C.Nome;

-- 14. Altere a tabela Clientes e adicione uma nova coluna chamada Status com:- Tipo: VARCHAR(10)

ALTER TABLE Cliente
ADD [Status] VARCHAR(10) DEFAULT 'Ativo'
   CHECK ([Status] IN ('Ativo', 'Inativo'))

   SELECT * FROM Cliente;

-- 15. Crie uma consulta que liste os produtos mais vendidos,
-- com:- Nome do produto- Total de unidades vendidas- 
-- Soma do valor arrecadado por produto (Quantidade  Preco)
-- Ordene do mais vendido para o menos vendido.

SELECT P.Nome, SUM(IV.Quantidade) 'Quantidade', SUM(IV.Quantidade * IV.Preco_Unitario) 'Soma'
FROM Produto P
    INNER JOIN Itens_Venda IV
    ON P.Id = IV.Id_Produto
    GROUP BY P.Nome;

















