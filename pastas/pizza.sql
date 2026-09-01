create table categoria(
id_categoria int primary key auto_increment,
nome varchar (80),
descricao varchar (200));

create table cliente(
id_cliente int primary key auto_increment,
nome varchar(100),
telefone varchar (20),
email varchar (100),
cidade varchar (80));

create table pizza(
id_pizza int primary key auto_increment,
id_categoria int,
nome varchar (100),
sabor varchar (80),
tamanho varchar (20),
preco decimal (8,2),
foreign key(id_categoria) references categoria(id_categoria));

create table endereco(
id_endereco int primary key auto_increment,
id_cliente int,
rua varchar (150),
numero varchar (10),
bairro varchar (80),
foreign key(id_cliente) references cliente(id_cliente));

create table pedidos(
id_pedido int primary key auto_increment,
id_cliente int,
id_pizza int,
data_pedido date,
quantidade int,
status_pedidos varchar (30),
foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_pizza) references pizza(id_pizza));

insert into categoria (nome, descricao) values ('Tradicional','Pizzas clássicas do cardápio'), ('Especial','Pizzas premiun com ingredientes diferenciados'), ('Doce','Pizzas com recheio doce');
insert into cliente (nome, telefone, email, cidade) values ('Ana Souza ','(49)9111-2233','ana@email.com','Videira'),('Bruno Lima','(49)9444-5566','bruno@email.com','Caçador'),('Carla melo','(49)9777-8899','carla@email.com','Videira'),('Diego Costa','(49)9000-1122','diego@email.com','Videira');
insert into endereco (id_cliente, rua, numero, bairro) values ('1','Rua das Flores','123','Centro'),('2','Av. Brasil','456','São Cristovão'),('3','Rua XV de Novembro','789','Centro'),('4','Rua Tiradentes','321','Vila Nova');
insert into pizza (id_categoria, nome, sabor, tamanho, preco) values ('1','Margherita','Queijo e Tomate','M','35.90'),('1','Portuguesa','Presunto e Ovos','G','49.90'),('2','Frango BBQ','Frango e Barbecue','G','54.90'),('3','Chocolate','Nutella e Morango','M','42.00');
insert into pedidos (id_cliente, id_pizza, data_pedido, quantidade, status_pedidos) values ('1','2','2024-10-01','1','Entregue'),('2','1','2024-10-03','2','Entregue'),('3','3','2024-20-05','1','Aguardando'),('1','1','2024-10-07','3','Em preparo'),('4','4','2024-10-10','1','Aguardando');

select nome, email, cidade from cliente where cidade = 'Videira';
select c.nome, e.rua, e.numero, e.bairro from cliente inner join e on c.id = e.id_cliente;