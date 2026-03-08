CREATE TABLE pessoa (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nasc DATE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_cadastro DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE cliente (
    cpf VARCHAR(11) PRIMARY KEY,
    cnh VARCHAR(20),
    pontos INT DEFAULT 0,
    rank VARCHAR(20),

    CONSTRAINT fk_cliente_pessoa
        FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE funcionario (
    matricula SERIAL PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE,
    cargo VARCHAR(50),
    salario NUMERIC(10,2),
    data_contrato DATE,

    CONSTRAINT fk_funcionario_pessoa
        FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE motorista (
    id SERIAL PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE,
    cnh VARCHAR(20),

    CONSTRAINT fk_motorista_pessoa
        FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE garagem (
    id_garagem SERIAL PRIMARY KEY,
    localizacao VARCHAR(150),
    vagas_disponiveis INT,
    vagas_totais INT
);

CREATE TABLE modelos (
    modelo_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    capacidade INT,
    categoria VARCHAR(50),
    tipo VARCHAR(50)
);

CREATE TABLE veiculo (
    placa VARCHAR(10) PRIMARY KEY,
    modelo_id INT,
    valor_diaria NUMERIC(10,2),
    garagem_id INT,
    condicao VARCHAR(50),
    revisao DATE,

    CONSTRAINT fk_veiculo_modelo
        FOREIGN KEY (modelo_id) REFERENCES modelos(modelo_id),

    CONSTRAINT fk_veiculo_garagem
        FOREIGN KEY (garagem_id) REFERENCES garagem(id_garagem)
);

CREATE TABLE pagamento (
    nf SERIAL PRIMARY KEY,
    valor NUMERIC(10,2),
    forma VARCHAR(50),
    pagador VARCHAR(11),

    CONSTRAINT fk_pagador
        FOREIGN KEY (pagador) REFERENCES pessoa(cpf)
);

CREATE TABLE pedido (
    id_pedido SERIAL PRIMARY KEY,
    mat_func INT,
    cpf_cliente VARCHAR(11),
    placa_veiculo VARCHAR(10),
    pagamento_id INT,
    data_inicio DATE,
    data_fim DATE,

    CONSTRAINT fk_pedido_funcionario
        FOREIGN KEY (mat_func) REFERENCES funcionario(matricula),

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf),

    CONSTRAINT fk_pedido_veiculo
        FOREIGN KEY (placa_veiculo) REFERENCES veiculo(placa),

    CONSTRAINT fk_pedido_pagamento
        FOREIGN KEY (pagamento_id) REFERENCES pagamento(nf)
);

CREATE TABLE contrato (
    id SERIAL PRIMARY KEY,
    motorista_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    pagamento_id INT,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor_mensal NUMERIC(10,2),
    multa NUMERIC(10,2),

    CONSTRAINT fk_contrato_motorista
        FOREIGN KEY (motorista_id) REFERENCES motorista(id),

    CONSTRAINT fk_contrato_funcionario
        FOREIGN KEY (funcionario_id) REFERENCES funcionario(matricula),

    CONSTRAINT fk_contrato_pagamento
        FOREIGN KEY (pagamento_id) REFERENCES pagamento(nf),

    CONSTRAINT contrato_duracao_minima
        CHECK (data_fim >= data_inicio + INTERVAL '1 month')
);
