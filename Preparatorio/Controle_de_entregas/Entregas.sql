CREATE DATABASE SistemaEntrega;
GO

USE SistemaEntrega;
GO

-- 1 ok
CREATE TABLE Telefone(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Numero CHAR(11) NOT NULL
);

INSERT INTO Telefone(Numero)
VALUES('83993088753'),
('83993088754'),
('83993088755');

-- 2 ok
CREATE TABLE StatusPedido(
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Status] VARCHAR(45) NOT NULL
);

INSERT INTO StatusPedido([Status])
VALUES('Aguardando Retirada'),('Em Rota'),('Entregue');

--3 ok
CREATE TABLE StatusPagamento(
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Status] BIT NOT NULL
);

INSERT INTO StatusPagamento([Status])
VALUES(1);

-- 4 ok
CREATE TABLE Cidade(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL
)

INSERT INTO Cidade(Nome)
VALUES('Ingá');

-- 5 ok
CREATE TABLE Endereco(
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdCidade INT NOT NULL,
    Rua VARCHAR(45) NOT NULL,
    CEP CHAR(8) NOT NULL,
    Bairro VARCHAR(45) NOT NULL,
    Numero VARCHAR(8) NOT NULL
    FOREIGN KEY (IdCidade) REFERENCES Cidade(Id),
);

INSERT INTO Endereco(IdCidade,CEP,Rua,Bairro,Numero)
VALUES(1, '88888888', 'Rua nova do cruzeiro', 'Emboca', 61);

-- 6 ok
CREATE TABLE FormaPagamento(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Forma VARCHAR(10) NOT NULL
)

INSERT INTO FormaPagamento(Forma)
VALUES('Pix'),('Dinheiro'),('Cartão');

-- 7 ok
CREATE TABLE Pagamento(
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdStatusPagamento INT NOT NULL,
    IdFormaPagamento INT NOT NULL,
    Valor DECIMAL(10,2) NOT NULL
    FOREIGN KEY (IdStatusPagamento) REFERENCES StatusPagamento (Id),
    FOREIGN KEY (IdFormaPagamento) REFERENCES FormaPagamento(Id)
);

INSERT INTO Pagamento(IdFormaPagamento,IdStatusPagamento,Valor)
VALUES(1, 1, 253),
(3, 1, 15.00),
(3, 1, 480000.00);

-- 8 ok
CREATE TABLE Restaurante(
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdEndereco INT NOT NULL,
    IdTelefone INT NOT NULL,
    Nome VARCHAR(45) NOT NULL
    FOREIGN KEY(IdEndereco) REFERENCES Endereco(Id),
    FOREIGN KEY(IdTelefone) REFERENCES Telefone(Id)
);

INSERT INTO Restaurante(IdEndereco,IdTelefone,Nome)
VALUES(1, 2, 'Subway');

-- 9 ok
CREATE TABLE Entregador(
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdTelefone INT NOT NULL,
    Nome VARCHAR(45) NOT NULL,
    PlacaMoto VARCHAR(7) NOT NULL
    CONSTRAINT fk_telefone FOREIGN KEY (IdTelefone)
    REFERENCES Telefone (Id)
);

INSERT INTO Entregador(Nome,IdTelefone,PlacaMoto)
VALUES('Lindemberg', 1, 'EXE2102'),
('Lindemberg2', 3, 'EXE2103');

-- 10 ok 
CREATE TABLE Cliente(
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdEndereco INT NOT NULL,
    IdTelefone INT NOT NULL,
    Nome VARCHAR(45) NOT NULL
    FOREIGN KEY(IdEndereco) REFERENCES Endereco(Id),
    FOREIGN KEY(IdTelefone) REFERENCES Telefone(Id)
);

INSERT INTO Cliente(Nome,IdEndereco,IdTelefone)
VALUES ('Larry', 1, 2),
('bERG', 1, 2);

-- 11 
CREATE TABLE Pedido(
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdPagamento INT NULL,
    IdStatusPedido INT NOT NULL,
    IdRestaurante INT NOT NULL,
    IdEntregador INT NOT NULL,
    IdCliente INT NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    DataHoraPedido DATETIME DEFAULT GETDATE()
    FOREIGN KEY (IdPagamento) REFERENCES Pagamento(Id),
    FOREIGN KEY (IdStatusPedido) REFERENCES StatusPedido(Id),
    FOREIGN KEY (IdRestaurante) REFERENCES Restaurante(Id),
    FOREIGN KEY (IdEntregador) REFERENCES Entregador(Id),
);

INSERT INTO Pedido(IdPagamento,IdStatusPedido,IdRestaurante,IdEntregador,IdCliente,Descricao, DataHoraPedido)
VALUES(1, 2, 1, 1, 1, 'Descricao de teste 1',GETDATE()),
(1, 2, 1, 1, 1, 'Descricao de teste 2',GETDATE()),
(1, 2, 1, 1, 1, 'Descricao de teste 3',GETDATE()),
(1, 2, 1, 1, 1, 'Descricao de teste 4',GETDATE()),
(1, 2, 1, 1, 1, 'Descricao de teste 5',GETDATE()),
(3, 2, 1, 1, 1, 'Descricao de teste 6',GETDATE()),
(2, 3, 1, 1, 1, 'Descricao de teste 7',GETDATE()),
(NULL, 2, 1, 1, 1, 'Descricao de teste 7',GETDATE());

-- 1 Liste o nome e telefone de todos os clientes que possuem pedidos com status "Em Rota".
SELECT *
FROM Pedido
WHERE IdStatusPedido = 2;


-- 2 Exiba o nome do motoboy e a placa da moto de todos que realizaram mais de 5 entregas no último mês.
SELECT 
    E.Nome, E.PlacaMoto, COUNT(P.IdEntregador) 'Contagem de Pedidos'
FROM Entregador E
INNER JOIN Pedido P 
    ON E.Id = P.IdEntregador
WHERE P.DataHoraPedido >= DATEADD(MONTH, -1, GETDATE())
GROUP BY E.Nome, E.PlacaMoto
HAVING 
    COUNT(P.IdEntregador) > 5;

-- 3 Mostre todos os pedidos pendentes (status = 'Aguardando Retirada') com o nome do cliente e valor do pedido.
SELECT C.Nome, PAG.Valor
FROM Cliente C
INNER JOIN Pedido P
    ON C.Id = P.IdCliente
INNER JOIN Pagamento PAG
    ON P.IdPagamento = PAG.Id
WHERE P.IdStatusPedido = 1;

-- 4 Liste os motoboys que não possuem nenhuma entrega atribuída.

SELECT E.Nome
FROM Entregador E
LEFT JOIN Pedido P
    ON E.Id = P.IdEntregador
WHERE P.IdEntregador IS NULL

-- 5 Encontre o pedido de maior valor e exiba a descrição, nome do cliente e nome do motoboy responsável.

SELECT TOP 1 
  P.Descricao, 
  C.Nome 'NomeCliente', E.Nome 'NomeMotoboy', PAG.Valor 'Total'
FROM Pedido P
INNER JOIN Cliente C 
    ON C.Id = P.IdCliente
INNER JOIN Entregador E 
    ON E.Id = P.IdEntregador
INNER JOIN Pagamento PAG 
    ON PAG.Id = P.IdPagamento
ORDER BY PAG.Valor DESC;

-- 6 Mostre todos os pedidos cujo pagamento foi feito na entrega e ainda não foram entregues.

SELECT *
FROM Pedido P
LEFT JOIN Pagamento PAG
    ON P.IdPagamento = PAG.Id
WHERE P.IdStatusPedido = 2 AND P.IdPagamento IS NULL;

-- 7 Atualize o status para "Entregue" de todos os pedidos que estão com status "Em Rota" há mais de 2 dias.
UPDATE Pedido
SET IdStatusPedido = 3
WHERE IdStatusPedido = 2 AND DataHoraPedido <= DATEADD(DAY, - 3, GETDATE())

-- 8 Aumente em 10% o valor de todos os pedidos cujo valor atual seja inferior a R$ 20,00.
UPDATE Pagamento
SET Valor = Valor * 1.1
WHERE Valor < 20;

-- 9 Altere o motoboy responsável pelo pedido de ID 2 para o motoboy ID 2.

UPDATE Pedido
SET IdEntregador = 2
WHERE Pedido.Id = 2

SELECT * FROM Pedido;

-- 10 Remova todos os registros de pedidos que não possuem cliente vinculado.

DELETE 
FROM Pedido
WHERE IdCliente IS NULL;

-- 11 Liste todos os motoboys e a quantidade de pedidos que cada um realizou. (Inclua motoboys sem pedidos)

SELECT E.Nome, COUNT(P.IdEntregador) Quantidade_Pedidos
FROM Entregador E
LEFT JOIN Pedido P
    ON E.Id = P.IdEntregador
GROUP BY E.Nome;

-- 12 Mostre todos os clientes e o valor total gasto em pedidos.
--(Inclua clientes que ainda não fizeram pedidos)
SELECT C.Nome, SUM(PAG.Valor) Soma
FROM Cliente C
LEFT JOIN Pedido P
    ON C.Id = P.IdCliente
LEFT JOIN Pagamento PAG
    ON P.IdPagamento = PAG.Id
GROUP BY C.Nome;

-- 13 Exiba o nome do motoboy e o maior valor de pedido que ele já entregou.
SELECT E.Nome, MAX(PAG.Valor) 'Pedido mais alto entregue'
FROM Entregador E
INNER JOIN Pedido P
    ON E.Id = P.IdEntregador
INNER JOIN Pagamento PAG 
    ON P.IdPagamento = PAG.Id
GROUP BY E.Nome


-- 14 Liste todos os clientes que nunca receberam pedidos do motoboy "bERG".

SELECT *
FROM Cliente C
INNER JOIN Pedido P
    ON C.Id = P.IdCliente

-- 15 Mostre todos os pedidos e, ao lado, o nome do cliente e o nome do motoboy responsável.
-- (Obrigatório uso de dois LEFT JOIN)

SELECT C.Nome, E.Nome
FROM Cliente C
LEFT JOIN Pedido P
    ON C.Id = P.IdCliente
LEFT JOIN Entregador E
    ON P.IdEntregador = E.Id

-- 16 Liste todos os motoboys e a data do último pedido entregue por cada um.
SELECT E.Nome, FORMAT(P.DataHoraPedido, 'dd/MM/yyyy')
FROM Entregador E
INNER JOIN Pedido P
    ON E.Id = P.IdEntregador

-- 17 Exiba todos os clientes que já tiveram pedidos com pagamento na entrega, mostrando também o valor médio desses pedidos.
SELECT 
    C.Nome NomeCliente,
    AVG(PAG.Valor) ValorMedio
FROM Cliente C
INNER JOIN Pedido P 
    ON C.Id = P.IdCliente
INNER JOIN Pagamento PAG 
    ON P.IdPagamento = PAG.Id
WHERE PAG.IdFormaPagamento = 2
GROUP BY C.Nome;

-- 18 Liste todos os motoboys e o total de pedidos que ainda estão "Em Rota".
SELECT E.Nome, SUM(PAG.Valor) Total
FROM Entregador E
INNER JOIN Pedido P
    ON E.Id = P.IdEntregador
INNER JOIN Pagamento PAG
    ON P.IdPagamento = PAG.Id
WHERE P.IdStatusPedido = 2
GROUP BY E.Nome;

SELECT * FROM StatusPedido

-- 19 Exiba o nome dos motoboys que não realizaram nenhum pedido no último mês.
SELECT E.Nome, P.DataHoraPedido 
FROM Entregador E
INNER JOIN Pedido P
    ON E.Id = P.IdEntregador
WHERE P.DataHoraPedido >= DATEADD(DAY, -30, GETDATE())

-- 20 Mostre todos os pedidos, o nome do cliente e o nome do motoboy, incluindo pedidos sem motoboy atribuído.

SELECT C.Nome, E.Nome
FROM Cliente C
LEFT JOIN Pedido P
    ON C.Id = P.IdCliente
LEFT JOIN Entregador E
    ON P.IdEntregador = E.Id;