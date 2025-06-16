CREATE DATABASE db_ecommerce;
USE db_ecommerce;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
	quantidade INT,
	preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_produtos(nome, descricao, quantidade, preco) values ("Caderno","Caderno 10 matérias, 200 páginas" , 150, 18.00);
INSERT INTO tb_produtos(nome, descricao, quantidade, preco) VALUES ("Caneta Esferográfica Azul", "Caneta esferográfica azul com tinta gel", 500, 2.50);
INSERT INTO tb_produtos(nome, descricao, quantidade, preco) VALUES ("Lápis Preto", "Lápis preto HB nº2 com borracha", 300, 1.20);
INSERT INTO tb_produtos(nome, descricao, quantidade, preco) VALUES ("Borracha Escolar", "Borracha branca para lápis, tamanho pequeno", 200, 0.90);
INSERT INTO tb_produtos(nome, descricao, quantidade, preco) VALUES ("Apontador Duplo", "Apontador com depósito e dois tamanhos", 120, 3.00);
INSERT INTO tb_produtos(nome, descricao, quantidade, preco) VALUES ("Cola Branca", "Cola branca escolar, 90g", 100, 4.50);
INSERT INTO tb_produtos(nome, descricao, quantidade, preco) VALUES ("Tesoura Escolar", "Tesoura sem ponta, 13cm, colorida", 80, 5.00);
INSERT INTO tb_produtos(nome, descricao, quantidade, preco) VALUES ("Estojo Simples", "Estojo de tecido com zíper, várias cores", 75, 12.00);
INSERT INTO tb_produtos(nome, descricao, quantidade, preco) VALUES ("Mochila Escolar", "Mochila média com alças acolchoadas", 40, 65.00);
INSERT INTO tb_produtos(nome, descricao, quantidade, preco) VALUES ("Régua 30cm", "Régua plástica transparente de 30cm", 180, 2.00);

SELECT * FROM tb_produtos WHERE preco > 500.00;
SELECT * FROM tb_produtos WHERE preco < 500.00;

UPDATE tb_produtos SET quantidade = 250 WHERE id = 3;

SELECT * FROM tb_produtos;