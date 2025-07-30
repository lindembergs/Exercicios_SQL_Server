create database Teste;

CREATE TABLE Cliente (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Data_Nascimento DATE
);

INSERT INTO Cliente (Nome, Data_Nascimento) VALUES
('Ana', '1995-04-12'),
('Bruno', '1988-09-25'),
('Carla', '2000-01-03'),
('Daniel', '1992-07-19'),
('Eduarda', '1985-12-31');

CREATE TABLE Venda (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Id_Cliente INT,
    Data_Venda DATE,
    Valor DECIMAL(10,2),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id)
);

INSERT INTO Venda (Id_Cliente, Data_Venda, Valor) VALUES
(1, '2024-07-01', 250.00),
(2, '2024-07-15', 120.50),
(3, '2024-06-20', 75.90),
(1, '2024-07-20', 180.00),
(4, '2024-07-10', 300.00),
(5, '2024-05-05', 210.00);

SELECT * FROM dbo.Cliente;
SELECT * FROM DBO.Venda;
-- 1 Liste o nome dos clientes e o ano de nascimento de cada um.
SELECT  C.Nome, YEAR(C.Data_Nascimento) Ano
FROM Cliente C;
-- 2 Mostre o nome dos clientes e quantos anos eles completam em 2025.
SELECT C.Nome, 2025 - YEAR(C.Data_Nascimento) [Ano completado]
FROM Cliente C;

SELECT * FROM CLIENTE;
-- 3 Liste os clientes que fazem aniversário no segundo semestre do ano.
SELECT * 
FROM Cliente
WHERE MONTH(Data_Nascimento) > 6;

-- Exiba todas as vendas realizadas no mês atual.
SELECT *
FROM Venda V
WHERE month(V.Data_Venda) = year(GETDATE())
-- Mostre todas as vendas que aconteceram antes do dia 15 de julho de 2024.
select * 
from venda V
WHERE v.Data_Venda < '2024-07-15'

/* 

Liste o nome do cliente e a data da sua última compra.

Exiba todas as vendas feitas por clientes que nasceram após o ano 1990.

Calcule o valor total vendido por mês (considere apenas o mês e ano).

Liste os clientes com mais de 30 anos de idade.

Mostre o nome dos clientes e quantos dias faltam para o próximo aniversário de cada um.
*/
