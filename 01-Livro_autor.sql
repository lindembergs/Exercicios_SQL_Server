CREATE DATABASE Biblioteca;
GO

USE Biblioteca;
GO

CREATE TABLE Nacionalidade (
    Id INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100) NOT NULL
);

INSERT INTO Nacionalidade(Nome)
VALUES('Brasileiro'),('Britânico'),('Inglês');

SELECT * FROM Nacionalidade;

CREATE TABLE Autor (
    Id INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100) NOT NULL,
    Id_Nacionalidade INT NOT NULL,
    CONSTRAINT FK_Autor_Nacionalidade FOREIGN KEY (Id_Nacionalidade)
        REFERENCES Nacionalidade (Id)
);
-- Consulta simples do autor
SELECT * FROM Autor;

-- 1
INSERT INTO Autor(Nome, Id_Nacionalidade)
VALUES('Machado de Assis', 1);

-- Criação da tabela livro

CREATE TABLE Livro
(
Id INT PRIMARY KEY IDENTITY,
Titulo VARCHAR(200) NOT NULL,
Id_Autor INT,
Ano_Publicacao INT,
Preco DECIMAL(10,2),

CONSTRAINT FK_Id_Autor FOREIGN KEY (Id_Autor)
  REFERENCES Autor (Id)
)
-- Consulta simples dos livros

SELECT * FROM Livro;

-- 2
INSERT INTO Livro(Titulo, Ano_Publicacao, Preco, Id_Autor)
Values('Dom Casmurro', 1899, 29.90, 1),
('Memórias Póstumas de Brás Cubas', 1881, 24.50, 1)

-- Consulta da tabela autor com a nacionalidade
SELECT 
    Autor.Id,
    Autor.Nome AS 'Nome do autor',
    Nacionalidade.Nome AS Nacionalidade
FROM Autor
INNER JOIN Nacionalidade ON Autor.Id_Nacionalidade = Nacionalidade.Id;

-- 3 Atualizar preço do livro 'Dom Casmurro'
-- SELECT * FROM Livro;

UPDATE Livro
SET Preco = 34.90
WHERE Livro.Id = 1;

-- 4 Excluir o livro Memorias Póstumas de Brás Cubas

DELETE Livro 
WHERE Livro.Id = 2;

-- 5 Consulta dos livros com a FK do autor
SELECT 
Livro.Id,
Livro.Titulo,
Livro.Ano_Publicacao,
Livro.Preco,
Autor.Nome AS 'Nome do autor'
FROM Livro
INNER JOIN Autor ON Id_Autor = Autor.Id;

-- 6 Inserir novo autor
SELECT * FROM Autor;
INSERT INTO Autor(Nome, Id_Nacionalidade)
VALUES('George Orwell', 2);

-- 7 Inserir Livro
INSERT INTO Livro(Titulo, Ano_Publicacao, Preco, Id_Autor)
VALUES('1984',1949, 39.90, 2)



-- consulta com a nacionalidade mais acima



-- 8 Atualizar a nacionalidade de um autor
UPDATE Autor
SET Id_Nacionalidade = 3
WHERE Autor.Id = 2;

-- 9 Exibir livros com o preço maior que 30 R$

SELECT * FROM Livro
WHERE Livro.Preco > 30.00

-- 10

DELETE Autor
WHERE Autor.Id = 2




