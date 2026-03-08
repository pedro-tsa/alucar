INSERT INTO pessoa VALUES
('11111111111','Pedro Silva','2000-05-10','69999990001','pedro@email.com',CURRENT_DATE,'ativo','Rua A 120'),
('22222222222','Marcos Souza','1995-03-21','69999990002','marcos@email.com',CURRENT_DATE,'ativo','Rua B 45'),
('33333333333','Ana Oliveira','1998-11-02','69999990003','ana@email.com',CURRENT_DATE,'ativo','Rua C 78'),
('44444444444','Carlos Lima','1988-07-15','69999990004','carlos@email.com',CURRENT_DATE,'ativo','Rua D 33'),
('55555555555','Fernanda Rocha','1992-01-30','69999990005','fernanda@email.com',CURRENT_DATE,'ativo','Rua E 90'),
('66666666666','Ricardo Alves','1993-04-18','69999990006','ricardo@email.com',CURRENT_DATE,'ativo','Rua F 20');

INSERT INTO cliente VALUES
('11111111111','12345678901',5,'prata'),
('22222222222','98765432100',0,'bronze');


INSERT INTO funcionario (cpf,cargo,salario,data_contrato) VALUES
('44444444444','Atendente',2500.00,'2023-05-01'),
('55555555555','Gerente',4500.00,'2022-03-10');


INSERT INTO motorista (cpf,cnh) VALUES
('33333333333','AB123456'),
('66666666666','CD987654');


INSERT INTO garagem (localizacao,vagas_disponiveis,vagas_totais) VALUES
('Centro',20,30),
('Aeroporto',10,15);


INSERT INTO modelos (nome,capacidade,categoria,tipo) VALUES
('Onix',5,'econômico','hatch'),
('Corolla',5,'sedan','luxo'),
('Spin',7,'familia','van'),
('HB20',5,'econômico','hatch');


INSERT INTO veiculo VALUES
('ABC1234',1,120.00,1,'disponivel','2025-12-01'),
('DEF5678',2,220.00,1,'disponivel','2025-10-10'),
('GHI9012',3,180.00,2,'disponivel','2025-09-15'),
('JKL3456',4,110.00,2,'disponivel','2025-11-20');


INSERT INTO pagamento (valor,forma,pagador) VALUES
(360.00,'cartao','11111111111'),
(220.00,'pix','22222222222'),
(1800.00,'pix','33333333333'),
(1800.00,'pix','66666666666');


INSERT INTO pedido
(mat_func,cpf_cliente,placa_veiculo,pagamento_id,data_inicio,data_fim)
VALUES
(1,'11111111111','ABC1234',1,'2026-03-01','2026-03-04'),
(1,'22222222222','DEF5678',2,'2026-03-05','2026-03-06');


INSERT INTO contrato
(motorista_id,funcionario_id,pagamento_id,data_inicio,data_fim,valor_mensal,multa)
VALUES
(1,2,3,'2026-03-01','2026-09-01',1800.00,300),
(2,2,4,'2026-02-01','2026-08-01',1800.00,300);
