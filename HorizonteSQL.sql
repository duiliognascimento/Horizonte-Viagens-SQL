CREATE DATABASE Horizonte;
USE Horizonte;
CREATE TABLE cliente (
id_cliente int primary key identity(1,1),
nome varchar(100) NOT NULL,
cpf varchar(20) NOT NULL,
cep int NULL,
rua varchar(100) NULL,
bairro varchar(20) NULL,
cidade varchar(20) NULL,
email varchar(50) NOT NULL,
senha varchar(20) NOT NULL,
);
CREATE TABLE hotel (
id_hotel int primary key identity(1,1),
nome varchar(100) NOT NULL,
endereco varchar(100) NOT NULL,
classificacao varchar (20) NULL,
);

CREATE TABLE telefone_cliente (
id_telefone int primary key identity(1,1),
numero_telefone int NOT NULL,
cliente_id int,
 foreign key(cliente_id)  references cliente(id_cliente)
);


CREATE TABLE telefone_hotel (
id_telefone int primary key identity(1,1),
numero_telefone int NOT NULL,
hotel_id int,
 foreign key(hotel_id)  references hotel(id_hotel)
);

CREATE TABLE voo (
id_voo int primary key identity(1,1),
cidade_partida varchar(20) NOT NULL,
hora_partida int NOT NULL,
cidade_chegada varchar(20) NOT NULL,
hora_chegada int NOT NULL,
);
CREATE TABLE passagens (
id_passagem int primary key identity(1,1),
classe varchar(10) NOT NULL,
assento int NOT NULL,
data_ida int NOT NULL,
data_volta int NOT NULL,
voo_id int,
foreign key(voo_id) references voo(id_voo)
);
CREATE TABLE reserva_quarto(
id_quarto int primary key identity(1,1),
numero_quarto int NOT NULL,
tipo varchar(20) NOT NULL,
data_checkin int NOT NULL,
data_checkout int NOT NULL,
hotel_id int,
foreign key(hotel_id) references hotel(id_hotel)
);

CREATE TABLE combo (
id_combo int primary key identity(1,1),
valor decimal NOT NULL,
);
CREATE TABLE compra (
combo_id int,
foreign key (combo_id) references combo(id_combo),
cliente_id int,
foreign key (cliente_id) references cliente(id_cliente),
valor decimal NOT NULL,
);
CREATE TABLE passeio (
id_passeio int primary key identity(1,1),
lugar varchar(20) NOT NULL,
horario int NOT NULL,
capacidade int NOT NULL,
);
CREATE TABLE incluso_combo (
quarto_id int,
foreign key (quarto_id) references reserva_quarto(id_quarto),
combo_id int,
foreign key (combo_id) references combo(id_combo),
passagem_id int,
foreign key (passagem_id) references passagens(id_passagem),
passeio_id int,
foreign key (passeio_id) references passeio(id_passeio),
);

INSERT INTO cliente (nome, email, cpf, senha) VALUES
('Duilio Galindo', 'duiliogalindo@gmail.com', '111.111.111-11', '123456'),
('Lucas Boa sorte', 'luqinha.sem.azar777@gmail.com', '222.222.222-22', '546987'),
('Lucas Kasahara', 'lucas.kasahara@gmail.com', '333.333.333-33', '789123'),
('Vitor Sales', 'vitor.sales@gmail.com', '444.444.444-44', '159753'),
('Vinicius Burato', 'vinicius.calvo@gmail.com', '555.555.555-55', '666333'),
('Ruan Takashi', 'ruan.takashi@gmail.com', '666.666.666-66', '741369'),
('Joao Carvalho', 'joao.carvalho@gmail.com', '777.777.777-77', '456258'),
('Diego Elias', 'diego.viajante@gmail.com', '888.888.888-88', '423698'),
('Alysson Nathan', 'alysson.pigmeu@gmail.com', '999.999.999-99', '2547896');
