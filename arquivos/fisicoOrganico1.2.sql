/* logicoOrganico1.2: */

CREATE TABLE USUARIO (
    nome varchar(255),
    status varchar(255),
    cpf int,
    id int not null auto_increment PRIMARY KEY,
    cep int,
    n_casa int,
    complemento varchar(255)
);

CREATE TABLE PRODUTO (
    id serial PRIMARY KEY,
    nome varchar(255),
    preco float,
    validade date,
    qtd int,
    FK_MARCA_id int,
    FK_CATEGORIA_id int
);

CREATE TABLE MARCA (
    id int not null auto_increment PRIMARY KEY,
    nome varchar(255)
);

CREATE TABLE COMPRA (
    id int not null auto_increment PRIMARY KEY,
    data date,
    status varchar(255),
    FK_USUARIO_id int
);

CREATE TABLE CATEGORIA (
    id int not null auto_increment PRIMARY KEY,
    nome varchar(255)
);

CREATE TABLE RESTRICAO (
    id int not null auto_increment PRIMARY KEY,
    tipo varchar(255)
);

CREATE TABLE CONTATO (
    id int not null auto_increment PRIMARY KEY,
    contato varchar(255),
    FK_USUARIO_id int,
    FK_TIPO_CONT_id int
);

CREATE TABLE TIPO_CONT (
    id int not null auto_increment PRIMARY KEY,
    tipo varchar(255)
);

CREATE TABLE FORNECEDOR (
    id int not null auto_increment PRIMARY KEY,
    cep int,
    complemneto varchar(80),
    n_casa int,
    info varchar(255),
    certificado varchar(255),
    FK_PRODUTO_id int
);

CREATE TABLE comentario (
    fk_PRODUTO_id int,
    fk_USUARIO_id int,
    id int not null auto_increment PRIMARY KEY,
    descricao varchar(100)
);

CREATE TABLE prod_restricao (
    fk_RESTRICAO_id int,
    fk_PRODUTO_id int,
    id_prod_restricao int not null auto_increment PRIMARY KEY
);

CREATE TABLE item_prod (
    fk_PRODUTO_id int,
    fk_COMPRA_id int,
    qtd int,
    id_item_comprado int not null auto_increment PRIMARY KEY
);
 
ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_2
    FOREIGN KEY (FK_MARCA_id)
    REFERENCES MARCA (id)
    ON DELETE RESTRICT;
 
ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_3
    FOREIGN KEY (FK_CATEGORIA_id)
    REFERENCES CATEGORIA (id)
    ON DELETE RESTRICT;
 
ALTER TABLE COMPRA ADD CONSTRAINT FK_COMPRA_2
    FOREIGN KEY (FK_USUARIO_id)
    REFERENCES USUARIO (id)
    ON DELETE CASCADE;
 
ALTER TABLE CONTATO ADD CONSTRAINT FK_CONTATO_2
    FOREIGN KEY (FK_USUARIO_id)
    REFERENCES USUARIO (id)
    ON DELETE RESTRICT;
 
ALTER TABLE CONTATO ADD CONSTRAINT FK_CONTATO_3
    FOREIGN KEY (FK_TIPO_CONT_id)
    REFERENCES TIPO_CONT (id)
    ON DELETE RESTRICT;
 
ALTER TABLE FORNECEDOR ADD CONSTRAINT FK_FORNECEDOR_2
    FOREIGN KEY (FK_PRODUTO_id)
    REFERENCES PRODUTO (id)
    ON DELETE RESTRICT;
 
ALTER TABLE comentario ADD CONSTRAINT FK_comentario_2
    FOREIGN KEY (fk_PRODUTO_id)
    REFERENCES PRODUTO (id)
    ON DELETE SET NULL;
 
ALTER TABLE comentario ADD CONSTRAINT FK_comentario_3
    FOREIGN KEY (fk_USUARIO_id)
    REFERENCES USUARIO (id)
    ON DELETE SET NULL;
 
ALTER TABLE prod_restricao ADD CONSTRAINT FK_prod_restricao_2
    FOREIGN KEY (fk_RESTRICAO_id)
    REFERENCES RESTRICAO (id)
    ON DELETE RESTRICT;
 
ALTER TABLE prod_restricao ADD CONSTRAINT FK_prod_restricao_3
    FOREIGN KEY (fk_PRODUTO_id)
    REFERENCES PRODUTO (id)
    ON DELETE RESTRICT;
 
ALTER TABLE item_prod ADD CONSTRAINT FK_item_prod_2
    FOREIGN KEY (fk_PRODUTO_id)
    REFERENCES PRODUTO (id)
    ON DELETE RESTRICT;
 
ALTER TABLE item_prod ADD CONSTRAINT FK_item_prod_3
    FOREIGN KEY (fk_COMPRA_id)
    REFERENCES COMPRA (id)
    ON DELETE SET NULL;
