CREATE DATABASE RpgResposta2;

USE RpgResposta2;

CREATE TABLE Usuarios
(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Email VARCHAR(150) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL
);

CREATE TABLE Classes
(
	ClasseId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(150) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
);

CREATE TABLE Habilidades
(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(150) UNIQUE NOT NULL,
);

CREATE TABLE Personagens
(
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(30) UNIQUE NOT NULL,
	UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT UNIQUE FOREIGN KEY REFERENCES Classes(ClasseId)
);

CREATE TABLE ClassesHabilidades
(
	ClasseId INT UNIQUE FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadeId INT UNIQUE FOREIGN KEY REFERENCES Habilidades(HabilidadeId)

);

--inserção de dados

INSERT INTO Usuarios VALUES ('Danos','Senha1234');
INSERT INTO Classes VALUES ('Monge','Descrição do Monge');
INSERT INTO Habilidades VALUES ('Recuperar Vida');
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('kiwi',1,1);
INSERT INTO ClassesHabilidades (ClasseId, HabilidadeId) VALUES (1,1);

--exclusão de dados
DELETE FROM Usuarios WHERE UsuarioId = 2;

--alteração de dados
UPDATE Usuarios SET Email = 'Danox' WHERE Email = 'Danos'
UPDATE Habilidades SET Nome = 'Pular 5 metros' WHERE HabilidadeId = 1;

--consulta de dados
SELECT * FROM Usuarios;
SELECT ClasseId, Nome, Descricao FROM Classes;
SELECT * FROM Habilidades;
SELECT * FROM ClassesHabilidades;
SELECT * FROM Personagens;