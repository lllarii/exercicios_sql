CREATE DATABASE db_colaboradores;
USE db_colaboradores;

CREATE TABLE tb_colaboradores(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(15) NOT NULL,
    datanascimento DATE,
    salario DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_colaboradores(nome, cpf, datanascimento, salario) values ("José da Silva","25795604766", "1980-11-03", 5000.00);
INSERT INTO tb_colaboradores(nome, cpf, datanascimento, salario) VALUES ("Bruno Ferreira", "23819476580", "1998-02-14", 2950.00);
INSERT INTO tb_colaboradores(nome, cpf, datanascimento, salario) VALUES ("Marcelo Nunes", "80673124567", "1975-03-08", 6800.00);
INSERT INTO tb_colaboradores(nome, cpf, datanascimento, salario) VALUES ("Patrícia Gonçalves", "17420593861", "1995-11-25", 4100.00);
INSERT INTO tb_colaboradores(nome, cpf, datanascimento, salario) VALUES ("Camila Andrade", "67012398457", "2000-08-09", 1500.00);
INSERT INTO tb_colaboradores(nome, cpf, datanascimento, salario) VALUES ("Carlos Mendes", "14572836900", "1979-07-22", 4800.00);
INSERT INTO tb_colaboradores(nome, cpf, datanascimento, salario) VALUES ("Ana Paula Costa", "72384916532", "1990-01-10", 5300.00);
INSERT INTO tb_colaboradores(nome, cpf, datanascimento, salario) VALUES ("Eduardo Ramos", "31457920684", "1992-05-27", 2700.00);
INSERT INTO tb_colaboradores(nome, cpf, datanascimento, salario) VALUES ("Juliana Souza", "89045612379", "1996-10-12", 1800.00);

SELECT * FROM tb_colaboradores WHERE salario > 2000.00;
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

UPDATE tb_colaboradores SET salario = 3500 WHERE id = 2;

SELECT * FROM tb_colaboradores;