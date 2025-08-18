CREATE DATABASE FabricaDePneus;

USE FabricaDePneus;

CREATE TABLE Pneu(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Modelo VARCHAR(100) NOT NULL,
	Marca VARCHAR(50) NOT NULL,
	Tamanho VARCHAR(20) NOT NULL,
	PrecoUnitario DECIMAL(6,2),
	Estoque INT
);

CREATE TABLE Fornecedor(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(100) NOT NULL,
	CNPJ VARCHAR(14) NOT NULL,
	Telefone VARCHAR(15),
	Email VARCHAR(100)
);

CREATE TABLE Cliente(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(100) NOT NULL,
	Email VARCHAR(100),
	Endereco VARCHAR(200)
);

 CREATE TABLE Venda(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdCliente INT NOT NULL,
	DataVenda DATE DEFAULT(GETDATE()),
	ValorTotal DECIMAL(6,2),
	FOREIGN KEY (IdCliente) REFERENCES Cliente(Id) 
);

CREATE TABLE PneuVenda(
	PRIMARY KEY(IdVenda, IdPneu),
	IdVenda INT NOT NULL,
	IdPneu INT NOT NULL,
	Quantidade INT NOT NULL,
	FOREIGN KEY (IdVenda) REFERENCES Venda(Id),
	FOREIGN KEY (IdPneu) REFERENCES Pneu(Id)
);

CREATE TABLE PneuFornecedor(
	PRIMARY KEY (IdPneu, IdFornecedor),
	IdPneu INT NOT NULL,
	IdFornecedor INT NOT NULL,
	PrecoCompra DECIMAL(6,2) NOT NULL,
	FOREIGN KEY (IdPneu) REFERENCES Pneu(Id)
);

ALTER TABLE PneuFornecedor 
ADD CONSTRAINT fk_id_fornecedor
FOREIGN KEY (IdFornecedor) REFERENCES Fornecedor(Id)

INSERT INTO Fornecedor(Nome,CNPJ,Telefone,Email)
VALUES('A', '12345678000199', '(11) 1234-5678','fornecedora@exemplo.com'),
('B', '98765432000188', '(21) 9876-5432', 'fornecedorb@exemplo.com');

INSERT INTO Pneu(Modelo,Marca,Tamanho,PrecoUnitario,Estoque)
VALUES('A1','MarcaX','205/55R16', 300.00, 50),
('B2','MarcaY','225/45R17', 350.00, 30),
('C3','MarcaZ','195/60R15', 280.00, 40);

INSERT INTO Cliente(Nome,Email,Endereco)
VALUES('João Pereira', 'joao.pereira@email.com', 'Rua das Flores, 123, São Paulo, SP');

-- 4 Registre uma venda realizada por João Pereira na data de hoje, no valor total de R$ 950,00, e inclua os pneus "Pneu A1" (2 unidades) e "Pneu B2" (1 unidade).

INSERT INTO Venda(IdCliente,ValorTotal,DataVenda)
VALUES(1, 950.00, GETDATE());

INSERT INTO PneuVenda(IdPneu,IdVenda,Quantidade)
VALUES(1,1,2),
(2,1,1);

-- 5 Atualize o preço unitário do "Pneu C3" para R$ 290,00

UPDATE Pneu
SET PrecoUnitario = 290.00
WHERE Id = 3;

-- 6 Liste todas as vendas realizadas, exibindo: nome do cliente, data da venda, valor total e os modelos dos pneus vendidos.

SELECT DISTINCT C.Nome, V.DataVenda, V.ValorTotal, P.Modelo
	FROM Cliente C
	INNER JOIN Venda V
		ON C.Id = V.IdCliente
	INNER JOIN PneuVenda pv 
		ON PV.IdVenda  = V.Id 
	INNER JOIN Pneu P
		ON P.Id = PV.IdPneu;

-- 7 Liste todos os pneus cujo preço unitário seja superior a R$ 300,00.

SELECT * FROM Pneu
	WHERE PrecoUnitario > 300.00;

-- 8 Exclua o pneu "Pneu B2". (Atenção: só será possível se não houver vendas registradas com esse pneu)

DELETE Pneu 
	WHERE Id = 2;

-- 9 Atualize a venda de João Pereira, alterando o valor total para R$ 1.050,00, já que ele comprou mais uma unidade do "Pneu A1".

UPDATE Venda
 SET ValorTotal = 1050.00
 	WHERE Id = 1;

-- 10 Liste todos os clientes que compraram mais de um pneu em uma única venda.

SELECT C.Nome, PV.Quantidade
	FROM Cliente C
	INNER JOIN Venda V
		ON C.Id = V.IdCliente
	INNER JOIN PneuVenda PV
		ON PV.IdVenda = V.Id
	WHERE PV.Quantidade > 1;

-- 11 Exiba a quantidade total de pneus em estoque na fábrica.

SELECT SUM(P.Estoque) 'Quantidade em estoque'
	FROM Pneu P;

-- 12 Exiba o preço médio dos pneus fornecidos por Fornecedor A.
INSERT INTO PneuFornecedor(IdFornecedor,IdPneu,PrecoCompra)
VALUES(1,1, 300.00);

SELECT AVG(p.PrecoUnitario) 'Media de preço'
	FROM Pneu p
	INNER JOIN PneuFornecedor pf 
		ON p.Id = pf.IdPneu
	INNER JOIN Fornecedor f
		ON pf.IdFornecedor  = f.Id 
	WHERE f.Nome = 'A';

-- 13 Liste cada marca de pneu com a quantidade total de pneus vendidos.
SELECT p.Marca, SUM(pv.Quantidade ) total
 FROM Pneu p
 INNER JOIN PneuVenda pv 
 	ON p.Id = pv.IdPneu
 GROUP BY p.Marca;

-- 14 Exiba o valor total arrecadado com vendas de pneus, excluindo aqueles que ainda não foram pagos.

SELECT SUM(V.ValorTotal) 'Total arrecadado'
	FROM Venda v;

-- 15 Para cada cliente, exiba: nome, total de vendas realizadas e valor total gasto em pneus.
INSERT INTO Venda(IdCliente,ValorTotal,DataVenda)
VALUES(1, 850.00, GETDATE());

SELECT c.Nome, COUNT(v.Id), SUM(v.ValorTotal)
	FROM Cliente c
	INNER JOIN Venda v 
		ON c.Id = v.IdCliente
	GROUP BY c.Nome
	
-- 16 Liste todos os fornecedores que venderam pneus com preço unitário superior a R$ 300,00, e que fornecem mais de um modelo de pneu para a fábrica.
	
SELECT f.Nome
	FROM Fornecedor f
INNER JOIN PneuFornecedor pf 
	ON F.Id = PF.IdFornecedor 
INNER JOIN Pneu p 
	ON p.Id = pf.IdPneu
WHERE p.PrecoUnitario > 300
GROUP BY f.Nome 
HAVING COUNT(p.Modelo) > 1;


-- 17 Liste todos os fornecedores e os pneus que eles fornecem, incluindo aqueles fornecedores que ainda não possuem pneus cadastrados.

SELECT f.Nome
	FROM Pneu p 
	LEFT JOIN PneuFornecedor pf 
		ON p.Id = PF.IdPneu
    LEFT JOIN Fornecedor f 
    	ON f.Id = pf.IdFornecedor 
    	
-- 18 Gere uma lista de combinações entre clientes e fornecedores, mesmo que não exista relação direta entre eles.
--(Dica: utilize CROSS JOIN`)
    	
SELECT *
	FROM Cliente c 
CROSS JOIN Fornecedor f

-- 19 Liste todos os clientes que já realizaram uma compra cujo valor total seja maior que a média de todas as vendas realizadas.
-- (Dica: utilize uma subconsulta correlacionada)

SELECT DISTINCT Nome
	FROM Cliente c
 	INNER JOIN Venda v
 		ON c.Id = v.IdCliente 
 	WHERE v.ValorTotal  > (
 	SELECT AVG(v2.ValorTotal)
 	FROM Venda v2 
 	WHERE v2.IdCliente = c.Id
 	)
 	
-- 20 Exiba os pneus cujo preço unitário seja maior que o preço médio dos pneus da mesma marca.
--  (Dica: utilize uma subconsulta correlacionada)
 	
 SELECT p.Modelo
 	FROM Pneu p
 WHERE p.PrecoUnitario > (
 	SELECT AVG(p2.PrecoUnitario)
 	FROM Pneu p2 
 	WHERE p2.Marca = p.Marca 
 )
	













