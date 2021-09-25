create database clubeSquad

use clubeSquad

create table tb_clube(
	id int not null primary key identity(1,1),
	nome varchar(255) not null
)

create table tb_funcionario(
	id int not null primary key identity(1,1),
	nome varchar(255) not null,
	id_clube int not null references tb_clube(id)
)

create table tb_cliente(
	id int not null primary key identity(1,1),
	nome varchar(255) not null,
	id_clube int not null references tb_clube(id)
)

create table tb_passeio(
	id int not null primary key identity(1,1),
	nome varchar(255) not null, 
	preco decimal(10,2) not null default(0),
	duracao int not null
)

create table tb_pacote(
	id int not null primary key identity(1,1),
	id_cliente int not null references tb_cliente(id),
	id_passeio int not null references tb_passeio(id)
)

create table tb_quarto(
	id int not null primary key identity(1,1),
	descricao varchar(255) not null,
	valor decimal(10,2) not null default(0),
)

create table tb_reserva(
	id int not null primary key identity(1,1),
	descricao varchar(255) not null,
	data_entrada datetime not null,
	data_saida datetime not null,
	id_cliente int not null references tb_cliente(id),
	id_quarto int not null references tb_quarto(id)
)

create table tb_restaurante(
	id int not null primary key identity(1,1),
	descricao varchar(255) not null
)

create table tb_produto_restaurante(
	id int not null primary key identity(1,1),
	descricao varchar(255) not null,
	valor decimal(10,2) not null default(0),
	quantidade int not null default(0),
	validade date not null,
	id_restaurante int not null references tb_restaurante(id)
)

create table tb_pedido_restaurante(
	id int not null primary key identity(1,1),
	descricao varchar(255) not null,
	id_produto_restaurante int not null references tb_produto_restaurante(id),
	id_quarto int not null references tb_quarto(id)
)

create table tb_loja(
	id int not null primary key identity(1,1),
	descricao varchar(255) not null
)

create table tb_produto_loja(
	id int not null primary key identity(1,1),
	descricao varchar(255) not null,
	valor decimal(10,2) not null default(0),
	quantidade int not null default(0),
	id_loja int not null references tb_loja(id)
)

create table tb_pedido_loja(
	id int not null primary key identity(1,1),
	descricao varchar(255) not null,
	id_produto_loja int not null references tb_produto_loja(id),
	id_quarto int not null references tb_quarto(id)
)

insert tb_clube(nome) values ('Squad Club')

insert tb_funcionario(nome, id_clube) values ('Jose Pedro', 1)
insert tb_funcionario(nome, id_clube) values ('Paulo Silva', 1)
insert tb_funcionario(nome, id_clube) values ('Joao Oliveira', 1)
insert tb_funcionario(nome, id_clube) values ('Juliana Pereira', 1)
insert tb_funcionario(nome, id_clube) values ('Isabela Andrade', 1)
insert tb_funcionario(nome, id_clube) values ('Marcus Rolim', 1)
insert tb_funcionario(nome, id_clube) values ('Thiago Marinho ', 1)
insert tb_funcionario(nome, id_clube) values ('Lucas Soares', 1)
insert tb_funcionario(nome, id_clube) values ('Emerson Nobre', 1)
insert tb_funcionario(nome, id_clube) values ('Misael', 1)

insert tb_cliente(nome, id_clube) values ('Rodrigo Xaves', 1)
insert tb_cliente(nome, id_clube) values ('Maria Flores', 1)

insert tb_passeio(nome, preco, duracao) values ('Passeio a cavalo', 50, 1)
insert tb_passeio(nome, preco, duracao) values ('Mergulho nascente rio XXX', 250, 3)
insert tb_passeio(nome, preco, duracao) values ('Escalada montanha YYY', 350, 5)
insert tb_passeio(nome, preco, duracao) values ('Trilha de bike KKK', 150, 3)

insert tb_pacote(id_cliente, id_passeio) values (1,2)
insert tb_pacote(id_cliente, id_passeio) values (1,3)
insert tb_pacote(id_cliente, id_passeio) values (2,1)
insert tb_pacote(id_cliente, id_passeio) values (2,1)
insert tb_pacote(id_cliente, id_passeio) values (2,4)

insert tb_quarto(descricao, valor) values ('A001', 250)
insert tb_quarto(descricao, valor) values ('A002', 250)
insert tb_quarto(descricao, valor) values ('A003', 250)
insert tb_quarto(descricao, valor) values ('B001', 350)
insert tb_quarto(descricao, valor) values ('B002', 350)
insert tb_quarto(descricao, valor) values ('B003', 350)

insert tb_loja(descricao) values ('Campo mais perto')

insert tb_produto_loja(descricao, valor, quantidade, id_loja) values ('Chap?u', 55, 20, 1)
insert tb_produto_loja(descricao, valor, quantidade, id_loja) values ('Cantil', 24, 10, 1)
insert tb_produto_loja(descricao, valor, quantidade, id_loja) values ('Barraca', 590, 5, 1)
insert tb_produto_loja(descricao, valor, quantidade, id_loja) values ('?culos', 160, 10, 1)
insert tb_produto_loja(descricao, valor, quantidade, id_loja) values ('Postal', 7, 40, 1)

insert tb_pedido_loja(descricao, id_produto_loja, id_quarto) values ('Dinheiro', 1, 1)
insert tb_pedido_loja(descricao, id_produto_loja, id_quarto) values ('Dinheiro', 3, 4)
insert tb_pedido_loja(descricao, id_produto_loja, id_quarto) values ('Cart?o ed Cr?dito', 5, 2)

insert tb_restaurante(descricao) values ('Del?cias do campo')

insert tb_produto_restaurante(descricao, valor, quantidade, validade, id_restaurante) values ('Pamonha', 6, 25, '18-11-2021', 1)
insert tb_produto_restaurante(descricao, valor, quantidade, validade, id_restaurante) values ('Galinhada', 27, 40, '20-02-2021', 1)
insert tb_produto_restaurante(descricao, valor, quantidade, validade, id_restaurante) values ('Arroz Carreteiro', 35, 10, '23-12-2021', 1)

insert tb_pedido_restaurante(descricao, id_produto_restaurante, id_quarto) values ('Almoco', 3, 1)
insert tb_pedido_restaurante(descricao, id_produto_restaurante, id_quarto) values ('Madrugada', 1, 3)
insert tb_pedido_restaurante(descricao, id_produto_restaurante, id_quarto) values ('Almoco', 2, 2)

insert tb_reserva(descricao, data_entrada, data_saida, id_cliente, id_quarto) values ('Familia 2 filhos menores', '20-08-2021', '25-08-2021', 1, 1)
insert tb_reserva(descricao, data_entrada, data_saida, id_cliente, id_quarto) values ('Familia 2 filhos maiores, 2 menores', '28-08-2021', '03-09-2021', 2, 2)

select * from tb_clube
select * from tb_funcionario
select * from tb_cliente
select * from tb_passeio
select * from tb_pacote
select * from tb_quarto
select * from tb_loja
select * from tb_produto_loja
select * from tb_pedido_loja
select * from tb_pedido_restaurante
select * from tb_produto_restaurante
select * from tb_restaurante
select * from tb_reserva
