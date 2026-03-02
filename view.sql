CREATE VIEW vw_clientes AS
SELECT
    p.cpf,
    p.nome,
    p.data_nasc,
    p.telefone,
    p.email,
    c.cnh,
    c.pontos,
    c.status_cliente
FROM cliente c
JOIN pessoa p ON p.cpf = c.cpf;

CREATE VIEW vw_veiculos AS
SELECT
    v.placa,
    m.nome AS modelo,
    m.categoria,
    m.tipo,
    v.valor_diaria,
    v.condicao,
    v.revisao,
    g.localizacao AS garagem
FROM veiculo v
JOIN modelos m ON m.id_modelo = v.modelo_id
JOIN garagem g ON g.id_garagem = v.garagem_id;

CREATE VIEW vw_pedidos AS
SELECT
    ped.id_pedido,
    cli.nome AS cliente,
    fun.nome AS funcionario,
    ped.placa_veiculo,
    pag.valor,
    pag.forma,
    ped.data_inicio,
    ped.date_final
FROM pedido ped
JOIN pagamento pag ON pag.nf = ped.pagamento_id
JOIN vw_clientes cli ON cli.cpf = ped.cpf_cliente
JOIN vw_funcionarios fun ON fun.matricula = ped.matric_func;

CREATE VIEW vw_pedidos AS
SELECT
    ped.id_pedido,
    cli.nome AS cliente,
    fun.nome AS funcionario,
    ped.placa_veiculo,
    pag.valor,
    pag.forma,
    ped.data_inicio,
    ped.date_final
FROM pedido ped
JOIN pagamento pag ON pag.nf = ped.pagamento_id
JOIN vw_clientes cli ON cli.cpf = ped.cpf_cliente
JOIN vw_funcionarios fun ON fun.matricula = ped.matric_func;

CREATE VIEW vw_veiculos_disponiveis AS
SELECT *
FROM vw_veiculos
WHERE condicao = 'disponivel';
