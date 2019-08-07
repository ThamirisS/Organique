/* logicoOrganico1.2: */

CREATE TABLE USUARIO (
    nome varchar(255),
    status varchar(255),
    cpf int,
    id serial PRIMARY KEY,
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
    FK_MARCA_id serial,
    FK_CATEGORIA_id serial
);

CREATE TABLE MARCA (
    id serial PRIMARY KEY,
    nome varchar(255)
);

CREATE TABLE COMPRA (
    id serial PRIMARY KEY,
    data date,
    status varchar(255),
    FK_USUARIO_id serial
);

CREATE TABLE CATEGORIA (
    id serial PRIMARY KEY,
    nome varchar(255)
);

CREATE TABLE RESTRICAO (
    id serial PRIMARY KEY,
    tipo varchar(255)
);

CREATE TABLE CONTATO (
    id serial PRIMARY KEY,
    contato varchar(255),
    FK_USUARIO_id serial,
    FK_TIPO_CONT_id serial
);

CREATE TABLE TIPO_CONT (
    id serial PRIMARY KEY,
    tipo varchar(255)
);

CREATE TABLE FORNECEDOR (
    id serial PRIMARY KEY,
    cep int,
    complemneto varchar(80),
    n_casa int,
    info varchar(255),
    certificado varchar(255),
    FK_PRODUTO_id serial
);

CREATE TABLE comentario (
    fk_PRODUTO_id serial,
    fk_USUARIO_id serial,
    id serial PRIMARY KEY,
    descricao varchar(100),
    id_prod int,
    id_usu int
);

CREATE TABLE prod_restricao (
    fk_RESTRICAO_id serial,
    fk_PRODUTO_id serial,
    id_prod_restricao serial PRIMARY KEY
);

CREATE TABLE item_prod (
    fk_PRODUTO_id serial,
    fk_COMPRA_id serial,
    qtd int,
    id_item_comprado serial PRIMARY KEY
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