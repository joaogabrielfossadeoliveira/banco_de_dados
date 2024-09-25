drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

alter table pizzas add column custo decimal(15,2);
use pizzaria;
update pizzas set custo = valor * 0.60;

-- cndiçao where 
-- selecionar todas as pizzzas com valor superior a 17
select * from pizzas where valor > 17;
-- selecionar todas as pizzzas com valor inferior a 17
select * from pizzas where valor < 17;
-- selecionar todas as pizzzas com valor igual ou inferior a 17
select * from pizzas where valor <= 17;
-- selecionar todas as pizzzas com valor igual a 17
select * from pizzas where valor = 17;
-- selecionar todas as pizzzas com valor diferentes a 17
select * from pizzas where valor <> 17;
select * from pizzas where valor != 17;

-- selecionar todas as pizzzas com a coluna valor nula
select* from pizzas where valor <=> null;
select* from pizzas where valor is null;
-- para criar uma expressao logica , utilizam-se os operadores logicos 
-- E (AND ou &&), OU (OR OU ||)  (E NOT OU!)
-- selecionar todas as pizzzas com valor entre 15 e 20
select * from pizzas where valor > 15 and valor <20;
select * from pizzas where valor between 16 and 19;

-- selecionar todas as pizzas com valor maior ou menores que R$17
select * from pizzas where valor < 17 or valor <20;

-- selecionar todas as pizzas com valores menores ou maiores do que 17
select * from pizzas where (valor < 17 or valor <17);

-- selecionar todas as pizzas com na faixa de 17 a 20
select * from pizzas where valor >= 17 or valor <= 17;
select * from pizzas where valor between 17 and 20;

-- selecionar todas as pizzas com valores fora da faixa entre 17 e 20
select * from pizzas where valor < 17 and valor > 17;
select * from pizzas where valor not between 17 and 20;
select * from pizzas where not (valor >=17 and valor <=20);

-- selecionar todas as pizzas com valores iguais a 15 e 20
select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15,20);

-- selecinar todas as pizzas com valores diferentes entre 15 e 20

select * from pizzas where valor != 20 or valor != 20;
select * from pizzas where valor  not in (15,20);

-- selecionartodas as pizza com valores nao nulos 
select * from pizzas where valor is not null; 

-- selecionar todas as pizzas que comecem com a letra E
select * from pizzas where nome like 'e%';

-- selecionar todas as pizzas que terminam com a letra A
select * from pizzas where nome like '%a';


-- selecionar todas as pizzas com nomes que tenham as letras "esa"
select * from pizzas where nome like '%esa%';

-- ar todas as colunas em ordem alfabetica 
 select * from pizzas order by nome;
 
 -- listar o nome e o valor da pizza em ordem decrescente de
 select *  from pizzas order by valor desc, nom asc;
 
 /*restrigir o numero de linhas retornadas pelo comando selct*/
 select * from pizzas valor < 17 limit 2;
 
 
 select distinct valor from pizzas order by valor;











