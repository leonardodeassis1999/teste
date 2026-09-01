create table log_pedidos (
id_log int auto_increment primary key,
id_pedido int,
data_hora datetime,
mensagem varchar(100));

delimiter //

create trigger trg_log_pedido
after insert on pedidos
for each row
begin
	insert into log_pedidos (id_pedido, data_hora, mensagem)
    values (NEW.id_pedido, now(), 'Novo pedido resgistrado');
end //

delimiter ;

insert into pedidos (id_cliente, data_pedido, quantidade) values ('1', now(),'45.90');
select * from log_pedidos;
