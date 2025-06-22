CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

/* Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave
Primária, relevantes para classificar os personagens do Game Online. */
CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(255) NOT NULL,
    cor VARCHAR(100)
);

/* Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária,
relevantes aos personagens do Game Online.*/
CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    ataque INT NOT NULL,
    defesa INT NOT NULL,
    especial VARCHAR(255)
);

/*  Não esqueça de criar a Foreign Key da tabela tb_classes na tabela
tb_personagens. */
ALTER TABLE tb_personagens ADD tipo_idclasses BIGINT NOT NULL;

ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes
FOREIGN KEY (tipo_idclasses) REFERENCES tb_classes (id);

/* 5 registros na tabela tb_classes */
INSERT INTO tb_classes (tipo, cor) values ("arqueira", "laranja");
INSERT INTO tb_classes (tipo, cor) values ("feiticeira", "vermelho");
INSERT INTO tb_classes (tipo, cor) values ("guerreira", "roxo");
INSERT INTO tb_classes (tipo, cor) values ("estrategista", "azul");
INSERT INTO tb_classes (tipo, cor) values ("ilusionista", "preto");

/* 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira
para criar a relação com a tabela tb_classes */
INSERT INTO tb_personagens (nome, ataque, defesa, especial, tipo_idclasses) VALUES ("Musa", 5000, 2500, "Chuva de Flechas", 1);
INSERT INTO tb_personagens (nome, ataque, defesa, especial, tipo_idclasses) VALUES ("Trix", 7000, 1250, "Super Aura", 2);
INSERT INTO tb_personagens (nome, ataque, defesa, especial, tipo_idclasses) VALUES ("Estelar", 3000, 3000, "Golpe Fatal", 3);
INSERT INTO tb_personagens (nome, ataque, defesa, especial, tipo_idclasses) VALUES ("Ravena", 5000, 2500, "Ataque psíquico", 4);
INSERT INTO tb_personagens (nome, ataque, defesa, especial, tipo_idclasses) VALUES ("Xtrema", 2000, 4000, "Manipulação da Realidade", 5);
INSERT INTO tb_personagens (nome, ataque, defesa, especial, tipo_idclasses) VALUES ("Lyra", 4800, 2200, "Flechas Espectrais", 1);
INSERT INTO tb_personagens (nome, ataque, defesa, especial, tipo_idclasses) VALUES ("Nyx", 2900, 4000, "Distorção Perceptiva", 5);
INSERT INTO tb_personagens (nome, ataque, defesa, especial, tipo_idclasses) VALUES ("Lince", 3500, 3600, "Tempestade de Espectros", 3);

/* SELECT que retorne todes os personagens cujo poder de ataque seja
maior do que 2000 */
SELECT * FROM tb_personagens WHERE ataque > 2000;

/*  SELECT que retorne todes os personagens cujo poder de defesa esteja
no intervalo 1000 e 2000 */
SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

/* SELECT utilizando o operador LIKE, buscando todes os personagens que
possuam a letra C no atributo nome. */
SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

/* SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela
tb_personagens com os dados da tabela tb_classes */
SELECT nome, ataque, defesa, especial, tb_classes.tipo, tb_classes.cor
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.tipo_idclasses = tb_classes.id;

/*  SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela
tb_personagens com os dados da tabela tb_classes, onde traga apenas os
personagens que pertençam a uma classe específica */
SELECT nome, ataque, defesa, especial, tb_classes.tipo, tb_classes.cor
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.tipo_idclasses = tb_classes.id WHERE tb_classes.id = 3;

