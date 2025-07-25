CREATE DATABASE VendaLevelTwo;
GO

USE VendaLevelTwo;
GO

CREATE TABLE Categoria
(
Id INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(50) NOT NULL
)

INSERT INTO Categoria (Nome)
VALUES ('Informática'),('Móveis'),('Utilidades');

CREATE TABLE Cliente
(
Id INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR (100) NOT NULL,
CPF CHAR(11) UNIQUE NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL
)

INSERT INTO Cliente (Nome, CPF, Email)
VALUES('João Silva','12345678901', 'Joao@gmail.com'),
('Maria Oliveira', '98765432100', 'maria.oliveira@hotmail.com'),
('Carlos Andrade', '11122233344','carlos.andrade@yahoo.com');

CREATE TABLE Produto
(
Id INT PRIMARY KEY IDENTITY(1,1),
Id_Categoria INT NOT NULL,
Nome VARCHAR (100) NOT NULL,
Preco DECIMAL(10,2),
Estoque SMALLINT NOT NULL DEFAULT 0

CONSTRAINT FK_Id_Categoria FOREIGN KEY (Id_Categoria)
REFERENCES Categoria (Id)
)

INSERT INTO Produto(Nome,Id_Categoria,Preco,Estoque)
VALUES('Teclado Gamer', 1, 150.00, 3),
('Mouse sem fio',1, 90.00, 15),
('Cadeira Escritório', 2, 600.00, 2),
('Garrafa Térmica', 3, 80.00, 20),
('Monitor 24', 1, 950.00, 5);

CREATE TABLE Venda
(
Id INT PRIMARY KEY IDENTITY(1,1),
Id_Cliente INT NOT NULL

CONSTRAINT FK_Id_Cliente FOREIGN KEY (Id_Cliente)
REFERENCES Cliente (Id)
)

-- Inserir vendas
INSERT INTO Venda (Id_Cliente)
VALUES (1), (2);


CREATE TABLE Itens_Venda
(
Id INT PRIMARY KEY IDENTITY(1,1),
Id_Venda INT NOT NULL,
Id_Produto INT NOT NULL,
Quantidade INT NOT NULL,
Preco_Unitario DECIMAL(10,2)
)

-- Insert Itens_venda
INSERT INTO Itens_Venda(Id_Venda, Id_Produto, Quantidade, Preco_Unitario)
VALUES(1, 1, 2, 150.00),
(1, 2, 1, 90.00),
(2, 4, 3, 80.00),
(2,5,1, 950.00)

--  5. Escreva uma query que mostre o nome do cliente, data da venda, e o total da venda (soma dos itens).
SELECT C.Nome, SUM(IV.Quantidade * IV.Preco_Unitario) 'Total das vendas'
FROM Venda V
INNER JOIN Itens_Venda IV
ON V.Id = IV.Id_Venda
INNER JOIN Cliente C
ON V.Id_Cliente = C.Id
GROUP BY C.Nome;

-- 6. Atualize o e-mail de um dos clientes para um novo endereço.

UPDATE Cliente
SET Email = 'quest6@email.com'
WHERE Cliente.id = 2;

SELECT * FROM Cliente;

--  7. Diminua o estoque dos produtos vendidos conforme a quantidade registrada em ItensVenda
UPDATE P
SET P.Estoque = P.Estoque - IV.Quantidade
FROM Produto P
INNER JOIN Itens_Venda IV
ON P.Id = IV.Id_Produto

SELECT * FROM Produto;

-- 8. Liste todos os produtos cujo estoque esteja abaixo de 5 unidades.
SELECT * 
FROM Produto
WHERE Estoque < 5;

-- 9. Mostre os produtos que nunca foram vendidos (não estão em ItensVenda).
SELECT * 
FROM Produto P
WHERE NOT EXISTS
(
SELECT 1 
FROM Itens_Venda IV
WHERE P.Id = IV.Id_Produto
)

-- segunda forma

SELECT P.Nome, P.Preco, P.Estoque
FROM Produto P
LEFT JOIN Itens_Venda IV
ON P.Id = IV.Id_Produto
WHERE IV.Id_Produto IS NULL;

--  10. Apresente a quantidade total vendida por produto com nome e soma de quantidade.

SELECT P.Nome, COUNT(IV.Id_Produto) 'Contagem de produtos', SUM(IV.Quantidade) 'Soma da quantidade'
FROM Itens_Venda IV
INNER JOIN Produto P
ON IV.Id_Produto = P.Id
GROUP BY P.Nome

--  11. Liste o cliente que mais comprou em valor total.
SELECT TOP 1 C.Nome,
SUM(IV.Quantidade * IV.Preco_Unitario) 'Valor total de compras'
FROM Cliente C
INNER JOIN Venda V
ON C.Id = V.Id_Cliente
INNER JOIN Itens_Venda IV
ON IV.Id_Venda = V.Id
GROUP BY C.Nome
ORDER BY 'Valor total de compras' DESC

-- 12. Liste as vendas realizadas no mês atual
-- Não registrei vendas com data

-- 13. Exiba o nome do cliente, produto comprado, quantidade e total (quantidade * preço).
SELECT C.Nome 'Nome do cliente', P.Nome 'Nome do produto', COUNT(IV.Quantidade) 'Quantidade', SUM(IV.Quantidade * IV.Preco_Unitario) 'Soma'
FROM Cliente C
INNER JOIN Venda V
ON C.Id = V.Id_Cliente
INNER JOIN Itens_Venda IV
ON V.Id = IV.Id_Venda
INNER JOIN Produto P
ON P.Id = IV.Id_Produto
GROUP BY C.Nome, P.Nome;

--  14. Remova um item de venda e ajuste o estoque do produto correspondente (aumentando).
UPDATE Itens_Venda
SET Quantidade = Quantidade - 1
WHERE Id_Venda = 1

SELECT * FROM Itens_Venda;

UPDATE Produto
SET Estoque = Estoque + 1
WHERE Id = 1

SELECT * FROM Produto;

-- 15 Mostre o nome dos clientes e o valor total que cada um 
-- já comprou, ordenado do maior para o menor.

SELECT C.Nome, SUM(IV.Quantidade * IV.Preco_Unitario) total
FROM Cliente C
INNER JOIN Venda V
ON C.Id = V.Id_Cliente
INNER JOIN Itens_Venda IV
ON V.Id = IV.Id_Venda
GROUP BY C.Nome
ORDER BY total DESC;












                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              










