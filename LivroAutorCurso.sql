CREATE DATABASE GerenciamentoCurso;
GO

USE GerenciamentoCurso;
GO

CREATE TABLE StatusLivro(
	Id INT PRIMARY KEY IDENTITY(1,1),
	NomeStatus VARCHAR(45) NOT NULL
);

CREATE TABLE Curso(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(45) NOT NULL
)

CREATE TABLE Aluno(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdCurso INT,
	Nome VARCHAR(45) NOT NULL,
	Email VARCHAR(45) UNIQUE NOT NULL,
	Telefone CHAR(11) NOT NULL
	FOREIGN KEY(IdCurso) REFERENCES Curso(Id)
);

CREATE TABLE Emprestimo(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdAluno INT NOT NULL,
	IdStatusLivro INT NOT NULL,
	DataEmprestimo DATETIME2 NOT NULL,
	DataDevolucao DATETIME2
	FOREIGN KEY(IdAluno) REFERENCES Aluno(Id),
	FOREIGN KEY(IdStatusLivro) REFERENCES StatusLivro(Id)
);

CREATE TABLE Autor(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Livro(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Titulo VARCHAR(45) NOT NULL,
	IdAutor INT NOT NULL,
	AnoPublicacao DATE NOT NULL,
	Preco DECIMAL(10,2) NOT NULL,
	Estoque INT NOT NULL
	FOREIGN KEY(IdAutor) REFERENCES Autor(Id)
);

CREATE TABLE LivroEmprestimo(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdEmprestimo INT NOT NULL,
	IdLivro INT NOT NULL,
	Quantidade INT NOT NULL
);

CREATE TABLE Editora(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(50) NOT NULL,
	CNPJ CHAR(14) UNIQUE NOT NULL,
	Telefone CHAR(11) NOT NULL,
	Email VARCHAR(45) UNIQUE NULL
);

CREATE TABLE LivroEditora(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdLivro INT NOT NULL,
	IdEditora INT NOT NULL,
	PrecoCompra DECIMAL(10,2) NOT NULL
);
INSERT INTO Autor
VALUES('BergMon');

INSERT INTO Curso
VALUES('Engenharia de Software');

INSERT INTO Aluno(Nome,IdCurso,Telefone,Email)
VALUES('Lindemberg', 1, '83993088753', 'berg@email.com'),
('Lindemberg3', 1, '83993088756', 'berg3@email.com');

INSERT INTO StatusLivro
VALUES('Pendente');

INSERT INTO Emprestimo(IdAluno,IdStatusLivro,DataEmprestimo,DataDevolucao)
VALUES(1, 1, GETDATE(), DATEADD(DAY, 3, GETDATE()));

INSERT INTO Livro(Titulo,IdAutor,AnoPublicacao,Preco,Estoque)
VALUES ('Casa de cera', 1, '2025', 20.99, 1000),
('Casa de cera2', 1, '2026', 20.99, 1000);

INSERT INTO LivroEmprestimo(IdEmprestimo,IdLivro,Quantidade)
VALUES(1, 1, 32);

INSERT INTO Editora(Nome,CNPJ,Telefone, Email)
VALUES('larry editor', '12345678912369', '83993082753', 'larryEditora@gmail.com.br');

INSERT INTO LivroEditora(IdLivro,IdEditora,PrecoCompra)
VALUES(1, 1, 671.68);
INSERT INTO LivroEditora(IdLivro,IdEditora,PrecoCompra)
VALUES(1, 1, 670.68);
-- 1 Liste o nome de cada aluno e a quantidade de emprestimos, incluindo alunos que nunca pegaram livros.
SELECT A.Nome, ISNULL(LE.Quantidade, 0) Quantidade
	FROM Aluno A
	LEFT JOIN Emprestimo E
		ON A.Id = E.IdAluno
	LEFT JOIN LivroEmprestimo LE
		ON E.Id = LE.IdEmprestimo;

-- 2 Liste todos os empréstimos com o nome do aluno, a data do empréstimo e os títulos dos livros emprestados.
SELECT A.Nome, FORMAT(E.DataEmprestimo, 'dd-MM-yyyy') [Data do Emprestimo], L.Titulo
	FROM Aluno A
	INNER JOIN Emprestimo E
		ON A.Id = E.IdAluno
	INNER JOIN LivroEmprestimo LE
		ON E.Id = LE.IdEmprestimo
	INNER JOIN Livro L 
		ON LE.IdLivro = L.Id;

-- 3 Liste o nome das editoras que fornecem livros com preço de compra superior ao preço de venda atual do livro.
 SELECT E.Nome
	FROM Editora E
	INNER JOIN LivroEditora LE
		ON E.Id = LE.IdLivro
	INNER JOIN Livro L
		ON L.Id = LE.IdLivro
	WHERE LE.PrecoCompra > L.Preco;

-- 4 Mostre todos os alunos que não possuem empréstimos registrados.
 SELECT A.Nome
	FROM Aluno A
	LEFT JOIN Emprestimo E
		ON A.Id = E.IdAluno
	LEFT JOIN LivroEmprestimo LE
		ON E.Id = LE.IdEmprestimo
	LEFT JOIN Livro L 
		ON LE.IdLivro = L.Id
		WHERE E.Id IS NULL;

-- 5 Liste todos os livros e, ao lado, mostre a quantidade total de vezes que cada um foi emprestado, mesmo que nunca tenha sido emprestado.

SELECT L.Titulo, COUNT(LE.IdEmprestimo) QuantidadeEmprestimos
	FROM Livro L
	LEFT JOIN LivroEmprestimo LE
		ON L.Id = LE.IdLivro
	GROUP BY L.Titulo

-- 6 Liste as 3 editoras que mais faturaram considerando o preço de venda dos livros emprestados.
 
 SELECT TOP 3 E.Nome, LE.PrecoCompra
	FROM Editora E
	INNER JOIN LivroEditora LE
		ON E.Id = LE.IdLivro
	INNER JOIN Livro L
		ON LE.IdLivro = L.Id
	ORDER BY LE.PrecoCompra DESC;

-- 7 Mostre o nome do aluno, o título do livro e a data de devolução para todos os empréstimos cujo status seja "Pendente", mesmo que o livro não tenha data de devolução definida.
SELECT A.Nome, L.Titulo, FORMAT(E.DataDevolucao, 'dd-MM-yyyy') [Data de devolucao]
	FROM Aluno A
	INNER JOIN Emprestimo E
		ON A.Id = E.IdAluno
	INNER JOIN LivroEmprestimo LE
		ON LE.IdEmprestimo = E.Id
	INNER JOIN Livro L
		ON L.Id = LE.IdLivro
	WHERE E.IdStatusLivro = (
			SELECT 1
			FROM StatusLivro WHERE NomeStatus = 'Pendente' 
	);
-- 8 Liste, para cada aluno, o total de livros emprestados e o valor total equivalente 
-- considerando o preço atual do livro, mas somente para alunos que pegaram livros de mais de um autor.
SELECT 
	A.Nome Aluno,SUM(LE.Quantidade) TotalLivrosEmprestados,SUM(LE.Quantidade * L.Preco) ValorTotal
	FROM Aluno A
	INNER JOIN Emprestimo E 
		ON A.Id = E.IdAluno
	INNER JOIN LivroEmprestimo LE ON E.Id = LE.IdEmprestimo
	INNER JOIN Livro L 
		ON L.Id = LE.IdLivro
	INNER JOIN Autor Au 
		ON Au.Id = L.IdAutor
GROUP BY A.Nome
HAVING COUNT(DISTINCT L.IdAutor) > 1;

-- 9 Mostre todos os empréstimos realizados por alunos do curso Engenharia de Software que contêm pelo menos um livro com estoque menor que 5 unidades.
SELECT DISTINCT 
	A.Nome 'Aluno',C.Nome 'Curso',E.Id 'IdEmprestimo',E.DataEmprestimo
FROM Emprestimo E
	INNER JOIN Aluno A 
		ON A.Id = E.IdAluno
	INNER JOIN Curso C 
		ON C.Id = A.IdCurso
	INNER JOIN LivroEmprestimo LE 
		ON LE.IdEmprestimo = E.Id
	INNER JOIN Livro L 
		ON L.Id = LE.IdLivro
WHERE C.Nome = 'Engenharia de Software'
  AND L.Estoque < 5;

-- 10 Liste os livros cujo preço esteja **entre R$ 50,00 e R$ 100,00** e que sejam de autores cujo nome **INICIE** a letra “A”
SELECT L.Titulo,L.Preco,
Au.Nome 'Autor'
	FROM Livro L
INNER JOIN Autor Au 
	ON Au.Id = L.IdAutor
	WHERE L.Preco BETWEEN 50.00 AND 100.00
  AND Au.Nome LIKE 'A%';












