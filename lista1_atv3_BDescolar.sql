CREATE DATABASE db_escolar;
USE db_escolar;

CREATE TABLE tb_alunos(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    turma VARCHAR(50) NOT NULL,
	disciplina VARCHAR(50) NOT NULL,
	nota1bimestre DECIMAL(6,2),
    nota2bimestre DECIMAL(6,2),
    nota3bimestre DECIMAL(6,2),
    nota4bimestre DECIMAL(6,2),
    medianotas DECIMAL (6,2),
    PRIMARY KEY (id)
);

INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) values ("Carlos Henrique", "T03", "Matemática", 8.00, 9.5, 7.0, 9.0, 8.4);
INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) VALUES ("Ana Paula Soares", "T03", "Matemática", 6.5, 7.0, 8.0, 7.5, 7.3);
INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) VALUES ("João Pedro Lima", "T03", "Matemática", 9.0, 8.5, 9.5, 9.0, 9.0);
INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) VALUES ("Mariana Oliveira", "T03", "Matemática", 7.5, 7.0, 6.5, 8.0, 7.3);
INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) VALUES ("Lucas Martins", "T03", "Matemática", 5.5, 6.0, 6.5, 6.0, 6.0);
INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) VALUES ("Fernanda Ribeiro", "T03", "Matemática", 8.5, 9.0, 8.0, 8.5, 8.5);
INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) VALUES ("Bruno Fernandes", "T03", "Matemática", 6.0, 5.5, 7.0, 6.5, 6.3);
INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) VALUES ("Juliana Costa", "T03", "Matemática", 9.5, 9.0, 10.0, 9.5, 9.5);
INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) VALUES ("Rafael Santos", "T03", "Matemática", 7.0, 6.5, 7.5, 8.0, 7.3);
INSERT INTO tb_alunos(nome, turma, disciplina, nota1bimestre, nota2bimestre, nota3bimestre, nota4bimestre, medianotas) VALUES ("Isabela Nogueira", "T03", "Matemática", 10.0, 9.5, 10.0, 10.0, 9.9);

SELECT * FROM tb_alunos WHERE medianotas > 7.0;
SELECT * FROM tb_alunos WHERE medianotas < 7.0;

UPDATE tb_alunos SET nota2bimestre = 9 WHERE id = 9;
UPDATE tb_alunos SET medianotas = 7.8 WHERE id = 9;

SELECT * FROM tb_alunos;
