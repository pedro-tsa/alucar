```mermaid
---
config:
  layout: elk
  look: neo
  theme: neo-dark
---
erDiagram
    PESSOA {
        int id PK
        string nome
        string cpf UNIQUE
        string sobrenome
        date data_nascimento
        string telefone
        string email
        date data_cadastro
        string status
        string endereco
        string cnh UNIQUE
    }

    GARAGEM {
        int id PK
        string endereco
        int vagas_disponiveis
        int vagas_totais
    }

    MODELOS {
        int id PK
        string nome
        int capacidade
        string categoria
    }

    PAGAMENTO {
        int id PK
        int nota_fiscal
        decimal valor
        string forma
        int pagador FK
        string status
        date data_pagamento
    }

    MOTORISTA_FIXO {
        int id PK
        int pessoa_id FK UNIQUE
        int pontos
    }

    FUNCIONARIO {
        int id PK
        int pessoa_id FK UNIQUE
        string cargo
        decimal salario
        date data_contrato
    }

    CLIENTE {
        int id PK
        int pessoa_id FK UNIQUE
        int pontos
    }

    VEICULO {
        int id PK
        string placa UNIQUE
        int modelo FK
        decimal valor_diaria
        decimal valor_contrato
        int garagem_id FK
        string condicao
        date revisao
        int motorista_id FK
    }

    CONTRATO_FIXO {
        int id PK
        date data_inicio
        date data_fim
        decimal multa_cancelamento
        decimal valor
        int motorista_id FK
        int pagamento_id FK
    }

    PEDIDO {
        int id PK
        int funcionario_id FK
        int cliente_id FK
        int veiculo_id FK
        int pagamento_id FK
        date data_inicio
        date data_fim
    }

    LOGIN {
        int id PK
        int pessoa_id FK
        string login UNIQUE
        string senha
    }

    %% RELACIONAMENTOS

    PESSOA ||--o{ PAGAMENTO : "id -> pagador"
    PESSOA ||--|| MOTORISTA_FIXO : "id -> pessoa_id"
    PESSOA ||--|| FUNCIONARIO : "id -> pessoa_id"
    PESSOA ||--|| CLIENTE : "id -> pessoa_id"
    PESSOA ||--o{ LOGIN : "id -> pessoa_id"

    GARAGEM ||--o{ VEICULO : "id -> garagem_id"
    MODELOS ||--o{ VEICULO : "id -> modelo"

    MOTORISTA_FIXO ||--o{ VEICULO : "id -> motorista_id"
    MOTORISTA_FIXO ||--o{ CONTRATO_FIXO : "id -> motorista_id"

    PAGAMENTO ||--o{ CONTRATO_FIXO : "id -> pagamento_id"
    PAGAMENTO ||--o{ PEDIDO : "id -> pagamento_id"

    FUNCIONARIO ||--o{ PEDIDO : "id -> funcionario_id"
    CLIENTE ||--o{ PEDIDO : "id -> cliente_id"
    VEICULO ||--o{ PEDIDO : "id -> veiculo_id"
```
