Create view vw_pizzas_cardapio as select p.nome as nome_pizza, p.sabor as sabor, p.tamanho as tamanho, p.preco as preco, c.nome as nome_categoria 
  from pizza p inner join categoria c on p.id_categoria = p.id_categoria;

select * from vw_pizzas_cardapio;

select * from vw_pizzas_cardapio where nome_categoria = 'Especial';

insert into categoria (nome, descricao) values ('Especial','Pizzas premiun');
insert into pizza (nome, sabor, tamanho, preco, id_categoria) values ('Quatro Queijos','Queijo','Grande','49.90','1');
