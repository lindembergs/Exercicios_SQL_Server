CREATE DATABASE Hotelaria;
GO
USE Hotelaria;
GO
CREATE TABLE Servico_Extra
(
Id INT PRIMARY KEY IDENTITY,
Descricao VARCHAR(100) NOT NULL,
Valor DECIMAL(7,2)
)

-- Inserir dados na Servico Extra
INSERT INTO Servico_Extra (Descricao, Valor)
VALUES ('Manobrista', 100.00), ('Massagem Relaxante', 120.00);

INSERT INTO Servico_Extra (Descricao, Valor)
VALUES ('Frigobar', 120.00);

SELECT * FROM Servico_Extra;

CREATE TABLE Hospede
(
Id INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(100) NOT NULL,
CPF VARCHAR(14) NOT NULL UNIQUE,
Email VARCHAR(100) NOT NULL,
DataNascimento DATE NOT NULL
)

-- Inserir dados no Hospede
INSERT INTO HOSPEDE (Nome, CPF, Email, DataNascimento)
VALUES ('BERG', '70394344405','lindemberg@email', '09/09/1996'),
('BERG2', '70394344406','lindemberg2@email', '09/09/1997'),
('BERG3', '70394344407','lindemberg3@email', '09/09/1998');

INSERT INTO Hospede (Nome, CPF, Email, DataNascimento)
VALUES('Fernanda Souza','11111111111', 'fernanda@email', '03/08/2000');

INSERT INTO Hospede (Nome, CPF, Email, DataNascimento)
VALUES('Fernanda Souza','11111111113', 'fernanda@gmail.com', '03/08/2000');

SELECT * FROM Hospede;


CREATE TABLE Tipo_Quarto
(
Id INT PRIMARY KEY IDENTITY(1,1),
Tipo VARCHAR(50)
)

-- Inserir dados no tipo quarto
INSERT INTO Tipo_Quarto (Tipo)
VALUES('Simples'),('Luxo'),('Suíte');
INSERT INTO Tipo_Quarto (Tipo)
VALUES('Executivo');

SELECT * FROM Tipo_Quarto;

CREATE TABLE Quarto
(
Id INT PRIMARY KEY IDENTITY,
Id_Tipo INT NOT NULL,
Numero VARCHAR(10) NOT NULL,
Preco_Diaria DECIMAL(7,2)

FOREIGN KEY(Id_Tipo) REFERENCES Tipo_Quarto (Id)
)

-- Inserir dados no Quarto
INSERT INTO Quarto (Id_Tipo, Numero, Preco_Diaria)
VALUES(1, '1', 100.00),(2, '2', 200.00),(3,'3', 300.00);

INSERT INTO Quarto (Id_Tipo, Numero, Preco_Diaria)
VALUES(3, 202, 300.00);

INSERT INTO Quarto (Id_Tipo, Numero, Preco_Diaria)
VALUES(3, 203, 910.00);

SELECT * FROM Quarto;

CREATE TABLE Reserva
(
Id INT PRIMARY KEY IDENTITY,
Id_Hospede INT NOT NULL,
Id_Quarto INT NOT NULL,
Data_Checkin DATE NOT NULL,
Data_Checkout DATE NOT NULL
FOREIGN KEY (Id_Hospede) REFERENCES Hospede (Id),
FOREIGN KEY (Id_Quarto) REFERENCES Quarto (Id),
)

SELECT * FROM Hospede;
SELECT * FROM Quarto;

-- Inserir dados na Reserva
INSERT INTO Reserva (Id_Hospede, Id_Quarto, Data_Checkin, Data_Checkout)
VALUES (1, 1, '10/07/2025', '11/07/2025'),
(2, 2, '12/07/2025', '13/07/2025'),
(3, 3, '14/07/2025', '15/07/2025');

INSERT INTO Reserva (Id_Hospede, Id_Quarto, Data_Checkin, Data_Checkout)
VALUES (1, 1, '28/12/2018', '30/01/2019');

INSERT INTO Reserva (Id_Hospede, Id_Quarto, Data_Checkin, Data_Checkout)
VALUES (4, 1, CONVERT(date, GETDATE()), DATEADD(DAY, 2, GETDATE()));

SELECT * FROM Reserva;

CREATE TABLE Reserva_Servico
(
Id_Reserva	INT NOT NULL,
Id_Servico_Extra INT
PRIMARY KEY ( Id_Reserva, Id_Servico_Extra )

FOREIGN KEY (Id_Reserva) REFERENCES Reserva (Id),
FOREIGN KEY (Id_Servico_Extra) REFERENCES Servico_Extra (Id)
)

-- Inserir servico na Reserva
INSERT INTO Reserva_Servico (Id_Reserva, Id_Servico_Extra)
VALUES(1, 2), (3, 2);

INSERT INTO Reserva_Servico (Id_Reserva, Id_Servico_Extra)
VALUES(3, 1), (3, 3);


SELECT * FROM Reserva_Servico;

CREATE TABLE Forma_Pagamento
(
Id INT PRIMARY KEY IDENTITY,
Forma VARCHAR(50) NOT NULL
)

-- Inserir dador FORMA pagamento
INSERT INTO Forma_Pagamento (Forma)
VALUES('Cartão'),('Pix'),('Dinheiro');

SELECT * FROM Forma_Pagamento;

CREATE TABLE Pagamento
(
Id INT PRIMARY KEY IDENTITY,
Id_Reserva INT,
Id_Forma_Pagamento INT NOT NULL,
Data_Pagamento DATE NOT NULL,
Valor DECIMAL(8,2)

FOREIGN KEY (Id_Reserva) REFERENCES Reserva (Id),
FOREIGN KEY (Id_Forma_Pagamento) REFERENCES Forma_Pagamento (Id)
)


-- Inserir pagamento na reserva
INSERT INTO Pagamento(Id_Reserva, Id_Forma_Pagamento, Data_Pagamento, Valor)
VALUES(1, 1, '11/07/2025', 100.00 + 120.00);

SELECT * FROM Reserva_Servico;
SELECT * FROM Quarto;
SELECT * FROM Servico_Extra;
SELECT * FROM Pagamento;

-- 1 Liste o nome dos hóspedes e a quantidade de reservas realizadas por cada um.
/* inserir mais uma reserva para teste 
INSERT INTO Reserva (Id_Hospede, Id_Quarto, Data_Checkin, Data_Checkout)
VALUES (1, 3, '25/07/2025', '27/07/2025'); */

SELECT * FROM Reserva;
SELECT Nome, COUNT(R.Id) 'Quantidade de reservas'
FROM Reserva R
INNER JOIN Hospede H ON R.Id_Hospede = H.Id
GROUP BY Nome;

-- 2 Exiba os quartos que já foram reservados por mais de um hóspede diferente.

SELECT * FROM Reserva;
SELECT * FROM Quarto;

SELECT Q.Numero 'Numero do quarto', COUNT(H.Id) 'Quantidade de reservas'
FROM Reserva R
INNER JOIN Quarto Q ON R.Id_Quarto = Q.Id
INNER JOIN Hospede H ON R.Id_Hospede = H.Id
GROUP BY Q.Numero
HAVING COUNT(H.Id) > 1;

-- 3 Liste as reservas que não possuem nenhum pagamento registrado EU DEVERIA COLOCAR O ID DO PAGAMENTO NA RESERVA PARA FACILITAR A LÓGICA.

SELECT R.Id, R.Id_Hospede, R.Id_Quarto, R.Data_Checkin, R.Data_Checkout
FROM Reserva R
LEFT JOIN Pagamento P ON R.Id = P.Id_Reserva
WHERE P.Id IS NULL;

-- 4 Exiba o total pago por cada reserva, somando o valor do pagamento e dos serviços extras utilizados.

SELECT R.Id 'Id da reserva', SUM(S.Valor + Q.Preco_Diaria) 'Soma valor + Preco diária'
FROM Reserva R
INNER JOIN Servico_Extra S
ON R.Id = S.Id
INNER JOIN Quarto Q 
ON R.Id_Quarto = Q.Id
GROUP BY R.Id;

-- 5 Atualize a forma de pagamento da reserva do hóspede "Fernanda Souza" para "Pix", considerando a reserva mais recente.
INSERT INTO Pagamento(Id_Reserva, Id_Forma_Pagamento,Valor,Data_Pagamento)
VALUES(5, 1, 100.00, CONVERT(DATE, GETDATE()))

UPDATE Pagamento 
SET Id_Forma_Pagamento = 2
WHERE Id_Reserva = 5

SELECT * FROM Pagamento;

-- 6 Liste o nome dos hóspedes que já utilizaram três ou mais tipos diferentes de serviços extras.
SELECT H.Nome, COUNT(RS.Id_Servico_Extra) 'Numero de servicos'
FROM Hospede H
INNER JOIN Reserva R ON H.Id = R.Id_Hospede
INNER JOIN Reserva_Servico RS ON R.Id = RS.Id_Reserva
GROUP BY H.Nome
HAVING COUNT(RS.Id_Servico_Extra) >= 3;

-- 7 Remova todas as reservas com data de check-out anterior a 1º de janeiro de 2020.

DELETE Reserva
WHERE Data_Checkout < '01/01/2020'

SELECT * FROM Reserva;

-- 8 Liste todos os serviços extras utilizados em reservas no quarto número "202".

SELECT Q.Numero 'Numero do quarto', SE.Descricao  'Servico utilizado'
FROM Reserva R
INNER JOIN Quarto Q ON R.Id_Quarto = Q.Id
INNER JOIN Reserva_Servico RS ON R.Id = RS.Id_Reserva
INNER JOIN Servico_Extra SE ON RS.Id_Servico_Extra = SE.Id
WHERE Q.Numero = '202';

-- 9 Mostre os hóspedes que usaram o serviço "Massagem Relaxante" ao menos uma vez.

SELECT H.Nome, SE.Descricao
FROM Reserva R
INNER JOIN Hospede H
ON R.Id_Hospede = H.Id
INNER JOIN Servico_Extra SE
ON R.Id = SE.Id
WHERE SE.Id = 2

-- 10 Altere o tipo de todos os quartos com diária superior a R$ 800,00 para "Executivo".
UPDATE Quarto
SET Id_Tipo = 4
WHERE Quarto.Preco_Diaria > 800

-- 11 Para cada quarto que já foi reservado, exiba o número do quarto, o tipo, o nome do hóspede e a data de check-in..

SELECT Q.Numero, TQ.Tipo, H.Nome, R.Data_Checkin
FROM Reserva R
INNER JOIN Quarto Q	
ON R.Id_Quarto = Q.Id
INNER JOIN Hospede H
ON R.Id_Hospede = H.Id
INNER JOIN Tipo_Quarto TQ
ON Q.Id_Tipo = TQ.Id

-- 12 Exiba os 5 hóspedes mais recentes (com base na data da última reserva).

SELECT TOP 5 Nome 
FROM Hospede H
INNER JOIN Reserva R
ON R.Id_Hospede = H.Id
ORDER BY R.Data_Checkin DESC

-- 13 Mostre todos os pagamentos realizados, exibindo: nome do hóspede, número do quarto, valor do pagamento e forma de pagamento..

SELECT H.Nome, Q.Numero 'Numero do quarto', P.Valor, FP.Forma
FROM Reserva R
INNER JOIN Hospede H
ON R.Id_Hospede = H.Id
INNER JOIN Quarto Q
ON R.Id_Quarto = Q.Id
INNER JOIN Pagamento P
ON R.Id = P.Id_Reserva
INNER JOIN Forma_Pagamento FP
ON P.Id = FP.Id

-- 14 Exiba a média de dias de estadia por tipo de quarto.
SELECT AVG(DATEDIFF(DAY, R.Data_Checkin, R.Data_Checkout)) 'Média de dias de Estadia'
FROM Reserva R
INNER JOIN Quarto Q
ON R.Id_Quarto = Q.Id
INNER JOIN Tipo_Quarto TQ
ON Q.Id_Tipo = TQ.Id

-- 15 Liste os hóspedes que possuem e-mail com domínio "@gmail.com" e que já realizaram ao menos uma reserva.
SELECT * 
FROM Hospede
WHERE Email LIKE '%@gmail.com';

select * from Hospede

-- verificar as questões e diminuir os inserts









