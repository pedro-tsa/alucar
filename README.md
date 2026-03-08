# alucar
Projeto universidade São Lucas para banco de dados e programação orientada a objetos
```mermaid
    erDiagram

---
config:
  layout: elk
  look: neo
  theme: neo-dark
---
erDiagram
	direction TB
	CLIENTE {
		string cpf FK ""  
		int cnh  ""  
		int pontos  ""  
		string rank  ""  
	}

	FUNCIONARIO {
		int matricula PK ""  
		string cpf FK ""  
		string cargo  ""  
		float salario  ""  
		date data_contrato  ""  
	}

	VEICULO {
		string placa PK ""  
		string modelo_carro FK ""  
		float valor_diaria  ""  
		int garagem_id FK ""  
		string condicao  ""  
		date revisao  ""  
	}

	MODELOS {
		int modelo_id PK ""  
		string nome  ""  
		int capacidade  ""  
		string categoria  ""  
		string tipo  ""  
	}

	GARAGEM {
		int id_garagem PK ""  
		string localizacao  ""  
		int vagas_disponiveis  ""  
		int vagas_totais  ""  
	}

	PEDIDO {
		int id_pedido PK ""  
		int mat_func FK ""  
		string cpf_cliente FK ""  
		string placa_veiculo FK ""  
		int pagamento_id FK ""  
		date data_inicio  ""  
		date data_fim  ""  
	}

	MOTORISTA {
		serial id PK ""  
		string cpf FK ""  
		string cnh  ""  
	}

	PESSOA {
		string cpf PK ""  
		string nome  ""  
		int data_nasc  ""  
		string telefone  ""  
		string email  ""  
		date data_cadastro  ""  
		string status  ""  
		string endereco  ""  
	}

	Contrato {
		serial id PK ""  
		date data_inicio  ""  
		date data_fim  ""  
		double multa  ""  
		double valor  ""  
		string motorista FK ""  
		string funcionario FK ""  
		int pagamento_id FK ""  
	}

	PAGAMENTO {
		int nf PK ""  
		float valor  ""  
		string forma  ""  
		string pagador FK ""  
	}

	CLIENTE||--o{PEDIDO:"faz"
	FUNCIONARIO||--o{PEDIDO:"provem"
	VEICULO||--o{PEDIDO:"é"
	GARAGEM||--o{VEICULO:"contem"
	MODELOS||--o{VEICULO:"tem"
	PESSOA}|--|{MOTORISTA:"é"
	PAGAMENTO}|--|{PEDIDO:"autoriza"
	MOTORISTA}|--|{Contrato:"assina"
	FUNCIONARIO}|--|{Contrato:"assina"
	PESSOA}|--|{CLIENTE:"  "
	PESSOA}|--|{FUNCIONARIO:"é"
```


