select * from carros;
select * from pessoas;
select * from funcionario;
select * from servico;
select * from atendimento;
alter table carros change `COL 1` marca text;
alter table carros change `COL 2` placa text;
alter table carros change `COL 3` modelo text;
alter table carros add column id int not null auto_increment primary key first;
delete from carros where id = 1;
alter table pessoas change `COL 1` nome text;
alter table pessoas change `COL 2` cpf text;
alter table pessoas change `COL 3` idade text;
alter table pessoas change `COL 4` genero text;
alter table pessoas add column id int not null auto_increment primary key first;
delete from pessoas where id = 1;

create table funcionario(
	matricula int auto_increment primary key,
    nome varchar(45) not null,
    data_nascimento date not null,
    cargo varchar(45) not null
    );
    
create table servico(
	id_servico int auto_increment primary key,
    descricao varchar(45),
    valor_servico varchar(45) not null,
    matricula_funcionario int,
    foreign key (matricula_funcionario) references funcionario (matricula));
    
create table atendimento(
	id_atendimento int auto_increment primary key,
    descricao varchar(45),
    tipo_de_atendimento varchar(45) not null,
    foreign key (id_atendimento) references servico (id_servico));
    
insert into funcionario(matricula, nome, data_nascimento, cargo)
values('F001', 'An Silva', '1985-03-15', 'Gerente'),
	  ('F002', 'Bruno Souza', '1990-07-22', 'Analista'),
      ('F003', 'Carla Oliveira', '1995-11-02', 'Desenvolvedor'),
      ('F004', 'Diego Santos', '2002-01-10', 'Estagiário'),
      ('F005', 'Elaine Costa', '1988-05-30', 'Coordenador');

insert into servico(id_servico, descricao, valor_servico, matricula_funcionario)
values (11, 'Troca de óleo e filtro', 150.00, 1),
	   (12, 'Consultoria técnica presencial - 2h', 300.00, 2),
       (13, 'Higienização interna completa', 250.00, 3),
       (14, 'Instalação de kit de segurança', 450.50, 4),
       (15, 'Check-up geral de itens de segurança', 80.00, 5);

insert into atendimento(id_atendimento, descricao, tipo_de_atendimento)
values(11, 'Cliente relatou lentidão no sistema após a última atualização.', 'Técnico'),
      (12, 'Solicitação de orçamento para 50 licenças do software PRO.', 'Comercial'),
      (13, 'Cliente solicitando a segunda via do boleto vencido em 01/10.', 'Financeiro'),
      (14, 'Dúvida sobre o prazo de entrega para a região norte.', 'Dúvida'),
      (15, 'Reclamação sobre atraso na prestação de serviço técnico.', 'Reclamação');