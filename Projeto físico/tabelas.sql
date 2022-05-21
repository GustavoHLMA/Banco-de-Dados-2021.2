CREATE TABLE pessoa (
  cpf INT,
  endereço VARCHAR(255) NOT NULL,
  PRIMARY KEY (cpf)
);

CREATE TABLE telefone (
  cpf INT,
  num_tel INT,
  PRIMARY KEY (cpf, num_tel),
  FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE veiculo ( 
  chassi VARCHAR(255), 
  modelo VARCHAR(255) NOT NULL, 
  marca VARCHAR(255) NOT NULL, 
  preco INT NOT NULL, 
  ano INT NOT NULL, 
  PRIMARY KEY (chassi) 
);

CREATE TABLE vendedor (
  cpf INT,
  num_previdencia INT NOT NULL,
  PRIMARY KEY (cpf),
  FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE cliente (
  cpf INT,
  cpf_padrinho INT,
  PRIMARY KEY (cpf),
  FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE cartao (
  num_cartao INT,
  nome_cartao VARCHAR(255) NOT NULL,
  venc_cartao INT NOT NULL,
  cvv INT NOT NULL,
  cpf INT NOT NULL,
  PRIMARY KEY (num_cartao),
  FOREIGN KEY (cpf) REFERENCES cliente(cpf)
);  

CREATE TABLE venda (
  cpf_vendedor INT,
  cpf_cliente INT,
  chassi VARCHAR(255),
  avaliacao INT,
  num_pedido INT NOT NULL,
  PRIMARY KEY (cpf_vendedor, cpf_cliente, chassi),
  FOREIGN KEY (cpf_vendedor) REFERENCES vendedor(cpf),
  FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf),
  FOREIGN KEY (chassi) REFERENCES veiculo(chassi)
);

CREATE TABLE seguro ( 
  chassi VARCHAR(255), 
  tipo VARCHAR(255) NOT NULL, 
  valor INT NOT NULL, 
  data_inicio INT NOT NULL, 
  date_fim INT NOT NULL, 
  PRIMARY KEY (chassi), 
  FOREIGN KEY (chassi) REFERENCES veiculo(chassi) 
)
