create database redesocial; 
use redesocial;
create table usuario(
id int primary key not null auto_increment, 
nome varchar(100) not null,
email varchar(100) unique not null,
senha varchar(45) not null,
data_de_criacao int
);

create table postagem(
id int primary key not null auto_increment,
texto varchar(255),
data_de_criacao int not null,
imagem varchar(100),
usuario_id int not null,
foreign key (usuario_id) references usuario (id)

);

create table comentario(
id int primary key not null auto_increment,
texto varchar (255),
usuario_id int not null,
postagem_idpostagem int not null,
foreign key (usuario_id) references usuario (id),
foreign key (postagem_idpostagem) references postagem (id)
);

create table curtida_postagem(
usuario_id int not null ,
postagem_idpostagem int not null,
primary key (usuario_id, postagem_idpostagem),
foreign key (usuario_id) references usuario(id),
foreign key (postagem_idpostagem) references postagem (id)
);
select * from usuario;

insert into usuario(nome, email, senha, data_de_criacao) 
values ('joão', 'joao@gauxo.com', '12345678', '2008');

insert into usuario(nome, email, senha, data_de_criacao) 
values ('Eduardo ', 'edu@carioca.com', '12345678', '2006');

insert into usuario(nome, email, senha, data_de_criacao) 
values ('antonio', 'antoinio0@LGBT.com', '123987', '2014');

insert into usuario(nome, email, senha, data_de_criacao) 
values ('beatriz', 'bia@docopao.com', '1264884', '2010');

insert into usuario(nome, email, senha, data_de_criacao) 
values ('maria eduarda', 'maria@mouse.com', '17102007', '2007');

insert into postagem (usuario_id, texto, data_de_criacao) 
values ('1', 'nossa meu Deus todos uincriveis ', '2007');

insert into postagem (usuario_id, texto, data_de_criacao, imagem) 
values ('1', 'incrivel mundo de gumble', '2024', '/foto/ilha.jpg');

insert into postagem (usuario_id, texto, data_de_criacao) 
values ('1', 'nplenet outlet  ', '2021');

insert into postagem (usuario_id, texto, data_de_criacao) 
values ('1', 'jefferson do 9 mata namorado gustavo   ', '2020');

insert into postagem (usuario_id, texto, data_de_criacao, imagem) 
values ('1', 'antonio tira machado do dedo ', '2021', '/foto/eu.jpg');


