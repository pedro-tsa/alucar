CREATE TABLE IF NOT EXISTS pessoa(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	sobrenome VARCHAR(20) NOT NULL,
	data_nascimento DATE NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	email VARCHAR(100),
	data_cadastro DATE NOT NULL,
	status VARCHAR(10) NOT NULL,
	endereco VARCHAR(100),
	cnh VARCHAR(11) UNIQUE NOT NULL,
	pontos INT
)

CREATE TABLE IF NOT EXISTS garagem(
	id SERIAL PRIMARY KEY,
	endereco VARCHAR(100) NOT NULL,
	vagas_disponiveis INT NOT NULL,
	vagas_totais INT NOT NULL
)

CREATE TABLE IF NOT EXISTS modelos(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	capacidade INT,
	categoria VARCHAR(10) 
)

CREATE TABLE IF NOT EXISTS pagamento(
	id SERIAL PRIMARY KEY,
	nota_fiscal INT NOT NULL,
	valor NUMERIC(10,2) NOT NULL,
	forma VARCHAR(10) NOT NULL,
	pagador INT NOT NULL,
	status VARCHAR(10) NOT NULL,
	data_pagamento DATE NOT NULL,

	CONSTRAINT fk_pagador
	FOREIGN KEY (pagador) REFERENCES pessoa(id)
)

CREATE TABLE IF NOT EXISTS motorista_fixo(
	id SERIAL PRIMARY KEY,
	pessoa_id INT UNIQUE NOT NULL,

	CONSTRAINT fk_motorista_pessoa
	FOREIGN KEY(pessoa_id) REFERENCES pessoa(id)
)

CREATE TABLE IF NOT EXISTS funcionario(
	id SERIAL PRIMARY KEY,
	pessoa_id INT UNIQUE NOT NULL,
	cargo VARCHAR(20) NOT NULL,
	salario NUMERIC(10,2) NOT NULL,
	data_contrato DATE NOT NULL,

	CONSTRAINT fk_funcionario_pessoa
	FOREIGN KEY (pessoa_id) REFERENCES pessoa(id)
)

CREATE TABLE IF NOT EXISTS cliente(
	id SERIAL PRIMARY KEY,
	pessoa_id INT UNIQUE NOT NULL,

	CONSTRAINT fk_cliente_pessoa
	FOREIGN KEY(pessoa_id) REFERENCES pessoa(id)
)

CREATE TABLE IF NOT EXISTS veiculo(
	id SERIAL PRIMARY KEY,
	placa VARCHAR(10) UNIQUE NOT NULL,
	modelo INT NOT NULL,
	valor_diaria NUMERIC(6,2) NOT NULL,
	valor_contrato NUMERIC(10,2),
	garagem_id INT NOT NULL,
	condicao VARCHAR(50),
	revisao DATE,
	motorista_id INT NOT NULL,

	CONSTRAINT fk_veiculo_garagem
	FOREIGN KEY (garagem_id) REFERENCES garagem(id),

	CONSTRAINT fk_veiculo_motorista
	FOREIGN KEY (motorista_id) REFERENCES motorista_fixo(id),

	CONSTRAINT fk_veiculo_modelos
	FOREIGN KEY (modelo) REFERENCES modelos(id)
)

CREATE TABLE IF NOT EXISTS contrato_fixo(
	id SERIAL PRIMARY KEY,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	multa_cancelamento NUMERIC(6,2),
	valor NUMERIC(6,2) NOT NULL,
	motorista_id INT NOT NULL,
	pagamento_id INT NOT NULL,

	CONSTRAINT fk_contrato_motorista
	FOREIGN KEY (motorista_id) REFERENCES motorista_fixo(id),

	CONSTRAINT fk_contrato_pagamento
	FOREIGN KEY (pagamento_id) REFERENCES pagamento(id)
)

CREATE TABLE IF NOT EXISTS pedido(
	id SERIAL PRIMARY KEY,
	funcionario_id INT,
	cliente_id INT NOT NULL,
	veiculo_id INT NOT NULL,
	pagamento_id INT NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,

	
	CONSTRAINT fk_pedido_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
	CONSTRAINT fk_pedido_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
	CONSTRAINT fk_pedido_veiculo FOREIGN KEY (veiculo_id) REFERENCES veiculo(id),
	CONSTRAINT fk_pedido_pagamento FOREIGN KEY (pagamento_id) REFERENCES pagamento(id)
)

CREATE TABLE login(
	id SERIAL PRIMARY KEY,
	pessoa_id INT NOT NULL,
	login VARCHAR(50) UNIQUE NOT NULL,
	senha VARCHAR(200) NOT NULL,

	CONSTRAINT fk_login_pessoa FOREIGN KEY (pessoa_id) REFERENCES pessoa(id)
)
