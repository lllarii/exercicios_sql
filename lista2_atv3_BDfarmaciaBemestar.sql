CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

/* Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave
Primária, relevantes para classificar os produtos. */
CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	categoria VARCHAR(50) NOT NULL,
    tarja VARCHAR(50)
);

/* Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária,
relevantes aos produtos da farmácia.*/
CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    desconto DECIMAL(6,2)
);

/*  Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela
tb_produtos. */
ALTER TABLE tb_produtos ADD categoria_id BIGINT NOT NULL;

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categoria
FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id);

/* 5 registros na tabela tb_categorias */
INSERT INTO tb_categorias (categoria, tarja) values ("Medicamento", "Amarela");
INSERT INTO tb_categorias (categoria, tarja) values ("Medicamento", "Vermelha");
INSERT INTO tb_categorias (categoria, tarja) values ("Medicamento", "Sem tarja");
INSERT INTO tb_categorias (categoria, tarja) values ("Higiene", null);
INSERT INTO tb_categorias (categoria, tarja) values ("Cosméticos", null);

/* 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para
criar a relação com a tabela tb_categorias. */
INSERT INTO tb_produtos (nome, descricao, preco, desconto, categoria_id) VALUES ("Soro fisiológico", "Soro fisiológico 500ml", 18.00, null, 4);
INSERT INTO tb_produtos (nome, descricao, preco, desconto, categoria_id) VALUES ("Dipirona comprimido 500 mg", "Analgésico e antitérmico isento de prescrição", 8.00, null, 1);
INSERT INTO tb_produtos (nome, descricao, preco, desconto, categoria_id) VALUES ("Amoxicilina 500 mg", "Antibiótico", 25.00, 7.00, 2);
INSERT INTO tb_produtos (nome, descricao, preco, desconto, categoria_id) VALUES ("Vitamina C ", "Suplemento alimentar", 20.00, 3.00, 3);
INSERT INTO tb_produtos (nome, descricao, preco, desconto, categoria_id) VALUES ("Shampoo", "Shampoo 200 ml", 18.00, null, 4);
INSERT INTO tb_produtos (nome, descricao, preco, desconto, categoria_id) VALUES ("Sabonete Líquido", "Sabonete líquido 250 ml", 10.00, null, 4);
INSERT INTO tb_produtos (nome, descricao, preco, desconto, categoria_id) VALUES ("Enxaguante Bucal", "Enxaguante Bucal 500 ml sabor menta", 14.00, null, 4);
INSERT INTO tb_produtos (nome, descricao, preco, desconto, categoria_id) VALUES ("Perfume ", "Perfume corporal 100 ml", 120.00, 15.00, 5);
INSERT INTO tb_produtos (nome, descricao, preco, desconto, categoria_id) VALUES ("Paracetamol", "Analgésico e antitérmico 20 comprimidos", 15.00, 2.00, 1);

/*  SELECT que retorne todes os produtos cujo valor seja maior do que R$
50,00 */
SELECT * FROM tb_produtos WHERE preco > 50;

/*  SELECT que retorne todes os produtos cujo valor esteja no intervalo R$
5,00 e R$ 60,00 */
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 60;

/*  SELECT utilizando o operador LIKE, buscando todes os produtos que
possuam a letra C no atributo nome*/
SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

/*  SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela
tb_produtos com os dados da tabela tb_categorias. */
SELECT nome, descricao, preco, desconto, tb_categorias.categoria,  tb_categorias.tarja
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

/* SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela
tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos
que pertençam a uma categoria específica (Exemplo: Todes os produtos que
pertencem a categoria cosméticos).*/
SELECT nome, descricao, preco, desconto, tb_categorias.categoria,  tb_categorias.tarja
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id WHERE tb_categorias.categoria = "Cosméticos";
