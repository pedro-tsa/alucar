# alucar
Projeto universidade São Lucas para banco de dados e programação orientada a objetos

erDiagram

PESSOA {
    string cpf PK
    string nome
    int data_nasc
}

CLIENTE {
    string cpf PK
    int rank FK
}

FUNCIONARIO {
    int matricula PK
    string cpf FK
}

VEICULO {
    string placa PK
    int id_modelo FK
    float valor_diaria
    int id_garagem FK
    string status
    int revisao
}

MODELOS {
    int id_modelo PK
    string nome
}

GARAGEM {
    int id_garagem PK
    string localizacao
    int vagas
}

RANKING {
    int id_ranking PK
    int desconto
    float requisito
}

PAGAMENTO {
    int nf PK
    float valor
    string forma
}

PEDIDO {
    int id_pedido PK
    int mat_func FK
    string cpf_cliente FK
    string placa_veiculo FK
    int pagamento_id FK
    date data_inicio
    date data_fim
}

PESSOA ||--|| CLIENTE : "é"
PESSOA ||--|| FUNCIONARIO : "é"

GARAGEM ||--o{ VEICULO : contem
MODELOS ||--o{ VEICULO : tem

CLIENTE ||--o{ PEDIDO : realiza
FUNCIONARIO ||--o{ PEDIDO : provem
VEICULO ||--o{ PEDIDO : aluga

RANKING ||--o{ CLIENTE : possui
PAGAMENTO ||--|| PEDIDO : autoriza
