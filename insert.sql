INSERT INTO pessoa (cpf, nome, data_nasc, telefone, email) VALUES
('11111111111', 'Pedro Almeida', '1998-04-12', '69999999901', 'pedro@email.com'),
('22222222222', 'Lucas Ferreira', '1995-07-21', '69999999902', 'lucas@email.com'),
('33333333333', 'Marcos Souza', '2000-01-10', '69999999903', 'marcos@email.com'),
('44444444444', 'Ana Costa', '1992-09-03', '69999999904', 'ana@email.com'),
('55555555555', 'Carlos Mendes', '1988-11-30', '69999999905', 'carlos@email.com');

INSERT INTO cliente (cpf, pontos, status_cliente, cnh) VALUES
('11111111111', 120, 'ativo', '12345678901'),
('22222222222', 50, 'ativo', '23456789012'),
('33333333333', 10, 'inativo', '34567890123');

INSERT INTO funcionario (cpf, cargo, salario, data_contrato) VALUES
('44444444444', 'gerente', 5500.00, '2022-03-01'),
('55555555555', 'atendente', 2500.00, '2023-06-15');

INSERT INTO garagem (localizacao, vagas_disponiveis, vagas_totais) VALUES
('Centro', 10, 20),
('Zona Sul', 5, 15);

INSERT INTO modelos (nome, capacidade, categoria, tipo) VALUES
('Onix', 5, 'economico', 'hatch'),
('Corolla', 5, 'luxo', 'sedan'),
('Strada', 2, 'utilitario', 'pickup');

INSERT INTO veiculo (placa, valor_diaria, garagem_id, condicao, revisao, modelo_id) VALUES
('ABC1A23', 120.00, 1, 'disponivel', '2026-01-10', 1),
('DEF4B56', 250.00, 1, 'disponivel', '2026-02-15', 2),
('GHI7C89', 180.00, 2, 'manutencao', '2026-03-01', 3);

INSERT INTO pagamento (nf, valor, forma) VALUES
(1001, 360.00, 'credito'),
(1002, 240.00, 'debito');

INSERT INTO pedido (matric_func, cpf_cliente, placa_veiculo, pagamento_id, data_inicio, date_final) VALUES
(1, '11111111111', 'ABC1A23', 1001, '2026-02-10', '2026-02-13'),
(2, '22222222222', 'DEF4B56', 1002, '2026-02-20', '2026-02-22');
