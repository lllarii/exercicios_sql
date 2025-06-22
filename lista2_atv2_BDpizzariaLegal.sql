CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

/* Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave
Primária, relevantes para classificar as pizzas. */
CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	categoria VARCHAR(50) NOT NULL,
    obs VARCHAR(255)
);

/*tabela extra sobre tamanhos dos produtos vendidos */
CREATE TABLE tb_tamanho(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	tamanho VARCHAR(100) NOT NULL
);

/* Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária,
relevantes aos produtos da pizzaria.*/
CREATE TABLE tb_pizzas (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    borda_recheada BOOLEAN,
    preco DECIMAL(6,2) NOT NULL
);

/*  Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela
tb_pizzas. */
ALTER TABLE tb_pizzas ADD categoria_id BIGINT NOT NULL;
ALTER TABLE tb_pizzas ADD tamanho_id BIGINT NOT NULL;

ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categoria
FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id);

ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_tamanho
FOREIGN KEY (tamanho_id) REFERENCES tb_tamanho (id);

/* 5 registros na tabela tb_categorias */
INSERT INTO tb_categorias (categoria, obs) values ("Pizza Clássica", "Contém glúten");
INSERT INTO tb_categorias (categoria, obs) values ("Pizza Especial", "");
INSERT INTO tb_categorias (categoria, obs) values ("Pizza Doce", "Alto teor de açúcar");
INSERT INTO tb_categorias (categoria, obs) values ("Pizza com massa fina", "Sem bordas recheadas");
INSERT INTO tb_categorias (categoria, obs) values ("Pizza com massa grossa", "Com bordas recheadas");

/* registros extras na tabela tamanho */
INSERT INTO tb_tamanho (tamanho) values ("Broto");
INSERT INTO tb_tamanho (tamanho) values ("Normal");
INSERT INTO tb_tamanho (tamanho) values ("Família");
INSERT INTO tb_tamanho (tamanho) values ("Broto e Normal");
INSERT INTO tb_tamanho (tamanho) values ("Broto, Normal e Família");

/* a 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar
a relação com a tabela tb_categorias. */
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Calabresa", "Linguiça calabresa e cebola", 0, 40.00, 1, 4);
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Portuguesa", "Presunto, ovo, cebola, azeitona e pimentão", 1, 42.00, 1, 2);
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Frango com Catupiry", "Frango e catupiry ", 1, 45.00, 2, 5);
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Marguerita", "Tomate, manjericão e queijo", 0, 40.00, 1, 2);
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Carne Seca com Catupiry ", "Carne Seca e catupiry", 1, 45.00, 2, 2);
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Chocolate com Morango ", "Chocolate e morango", 1, 50.00, 3, 2);
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Banana com Canela  ", "Banana e canela", 1, 48.00, 3, 2);
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Romeu e Julieta ", "Goiabada e queijo", 1, 52.00, 3, 2);
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Quatro Queijos com Catupiry", "Molho de tomate, muçarela, parmesão, gorgonzola, provolone e catupiry", 0, 49.50, 4, 2);
INSERT INTO tb_pizzas (nome, ingredientes, borda_recheada, preco, categoria_id, tamanho_id) VALUES ("Atum", "Molho de tomate, muçarela, atum, cebola, azeitonas", 1, 42.00, 5, 2);

/*  SELECT que retorne todas as pizzas cujo valor seja maior do que R$
45,00. */
SELECT * FROM tb_pizzas WHERE preco > 45;

/*  SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$
50,00 e R$ 100,00. */
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

/*  SELECT utilizando o operador LIKE, buscando todas as pizzas que
possuam a letra M no atributo nome */
SELECT * FROM tb_pizzass WHERE nome LIKE "%m%";

/* SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela
tb_pizzas com os dados da tabela tb_categorias. */
SELECT nome, ingredientes, borda_recheada, preco, tb_categorias.categoria,  tb_categorias.obs
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoria_id = tb_categorias.id;

/*  SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela
tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que
pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce)*/
SELECT nome, ingredientes, borda_recheada, preco, tb_categorias.categoria,  tb_categorias.obs
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoria_id = tb_categorias.id WHERE tb_categorias.id = 3;

/* SELECT extra unindo três tabelas */
SELECT nome, ingredientes, borda_recheada, preco, tb_categorias.categoria, tb_tamanho.tamanho
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoria_id = tb_categorias.id
INNER JOIN tb_tamanho
ON tb_pizzas.tamanho_id = tb_tamanho.id;

/* SELECT extra unindo três tabelas com filtro */
SELECT nome, ingredientes, borda_recheada, preco, tb_categorias.categoria, tb_tamanho.tamanho
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoria_id = tb_categorias.id 
INNER JOIN tb_tamanho
ON tb_pizzas.tamanho_id = tb_tamanho.id WHERE tb_tamanho.id = 4;