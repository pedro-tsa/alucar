-- PESSOA
INSERT INTO pessoa (nome, cpf, sobrenome, data_nascimento, telefone, email, data_cadastro, status, endereco, cnh) VALUES
('João', '11111111111', 'Silva', '1990-05-10', '69999999999', 'joao@email.com', CURRENT_DATE, 'ativo', 'Rua A', '12345678901'),
('Maria', '22222222222', 'Souza', '1995-08-20', '69988888888', 'maria@email.com', CURRENT_DATE, 'ativo', 'Rua B', '12345678902'),
('Carlos', '33333333333', 'Oliveira', '1988-02-15', '69977777777', 'carlos@email.com', CURRENT_DATE, 'ativo', 'Rua C', '12345678903');

-- GARAGEM
INSERT INTO garagem (endereco, vagas_disponiveis, vagas_totais) VALUES
('Centro', 10, 20),
('Zona Sul', 5, 10);

-- MODELOS
INSERT INTO modelos (nome, capacidade, categoria) VALUES
('Sedan', 5, 'A'),
('SUV', 7, 'B');

-- MOTORISTA_FIXO
INSERT INTO motorista_fixo (pessoa_id, pontos) VALUES
(1, 10);

-- FUNCIONARIO
INSERT INTO funcionario (pessoa_id, cargo, salario, data_contrato) VALUES
(2, 'Atendente', 2500.00, CURRENT_DATE);

-- CLIENTE
INSERT INTO cliente (pessoa_id, pontos) VALUES
(3, 100);

-- VEICULO
INSERT INTO veiculo (placa, modelo, valor_diaria, valor_contrato, garagem_id, condicao, revisao, motorista_id) VALUES
('ABC1234', 1, 150.00, 3000.00, 1, 'bom', CURRENT_DATE, 1),
('XYZ5678', 2, 200.00, 4000.00, 2, 'ótimo', CURRENT_DATE, 1);

-- PAGAMENTO
INSERT INTO pagamento (nota_fiscal, valor, forma, pagador, status, data_pagamento) VALUES
(1001, 500.00, 'pix', 3, 'pago', CURRENT_DATE),
(1002, 800.00, 'cartao', 3, 'pago', CURRENT_DATE);

-- CONTRATO_FIXO
INSERT INTO contrato_fixo (data_inicio, data_fim, multa_cancelamento, valor, motorista_id, pagamento_id) VALUES
(CURRENT_DATE, CURRENT_DATE + INTERVAL '30 days', 200.00, 3000.00, 1, 1);

-- PEDIDO
INSERT INTO pedido (funcionario_id, cliente_id, veiculo_id, pagamento_id, data_inicio, data_fim) VALUES
(1, 1, 1, 1, CURRENT_DATE, CURRENT_DATE + INTERVAL '5 days'),
(1, 1, 2, 2, CURRENT_DATE, CURRENT_DATE + INTERVAL '3 days');

-- LOGIN
INSERT INTO login (pessoa_id, login, senha) VALUES
(1, 'joao123', 'senha_hash_1'),
(2, 'maria123', 'senha_hash_2'),
(3, 'carlos123', 'senha_hash_3');
