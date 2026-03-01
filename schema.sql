CREATE TABLE pessoa(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    data_nasc DATE,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE cliente(
    cpf VARCHAR(11) PRIMARY KEY,
    pontos INT DEFAULT 0,
    status_cliente VARCHAR(10),
	cnh VARCHAR(11),


    FOREIGN KEY(cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE funcionario(
    matricula SERIAL PRIMARY KEY,
    cpf VARCHAR(11),
    cargo VARCHAR(20),
    salario NUMERIC(10,2),
    data_contrato DATE,

    FOREIGN KEY(cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE garagem(
    id_garagem SERIAL PRIMARY KEY,
    localizacao VARCHAR(100),
    vagas_disponiveis INT,
    vagas_totais INT
);

CREATE TABLE modelos(
    id_modelo SERIAL PRIMARY KEY,
    nome VARCHAR(20),
    capacidade INT,
    categoria VARCHAR(10),
    tipo VARCHAR(10)
);
/* 
CREATE TABLE veiculo(
    placa VARCHAR(10) PRIMARY KEY,
    valor_diaria NUMERIC(5,2),
    garagem_id INT,
    condicao VARCHAR(10),
    revisao DATE,
    FOREIGN KEY(garagem_id) REFERENCES garagem(id_garagem)
);

CREATE TABLE pagamento(
    nf INT PRIMARY KEY,
    valor NUMERIC(10,2),
    forma VARCHAR(10)
);

CREATE TABLE pedido(
    id_pedido SERIAL PRIMARY KEY,
    matric_func INT,
    cpf_cliente VARCHAR(11),
    placa_veiculo VARCHAR(10),
    pagamento_id INT,
    data_inicio DATE,
    date_final DATE,
    CONSTRAINT fk_cliente FOREIGN KEY(cpf_cliente) REFERENCES cliente(cpf),
    CONSTRAINT fk_veiculo FOREIGN KEY(placa_veiculo) REFERENCES veiculo(placa),
    CONSTRAINT fk_pagamento FOREIGN KEY(pagamento_id) REFERENCES pagamento(nf)
);
*/
