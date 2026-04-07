--CREATES 


CREATE TABLE Clientes (
    Id_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR(100),
    Cidade VARCHAR(50),
    Estado VARCHAR(2),
    Segmento VARCHAR(50)
);


CREATE TABLE Produtos (
    Id_Produto INT PRIMARY KEY,
    Nome_Produto VARCHAR(100),
    Categoria VARCHAR(50),
    Preco DECIMAL(10,2)
);


CREATE TABLE Vendas (
    Id_Venda INT PRIMARY KEY,
    Id_Cliente INT,
    Id_Produto INT,
    Data_Venda DATE,
    Quantidade INT,
    Receita DECIMAL(10,2),

    FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Id_Cliente),
    FOREIGN KEY (Id_Produto) REFERENCES Produtos(Id_Produto)
);


--Primary e Foreign Key(Referencias)


ALTER TABLE Clientes
ADD CONSTRAINT PK_Clientes PRIMARY KEY (id_cliente);

ALTER TABLE Produtos
ADD CONSTRAINT PK_Produtos PRIMARY KEY (id_produto);

ALTER TABLE Vendas
ADD CONSTRAINT PK_Vendas PRIMARY KEY (id_venda);


ALTER TABLE Vendas
ADD CONSTRAINT FKK_Vendas_Clientes
FOREIGN KEY (id_cliente)
REFERENCES Clientes(id_cliente);

ALTER TABLE Vendas
ADD CONSTRAINT FKK_Vendas_Produtos
FOREIGN KEY (id_produto)
REFERENCES Produtos(id_produto);
