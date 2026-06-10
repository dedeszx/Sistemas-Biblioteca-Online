CREATE TABLE categoria (
    id_categoria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE livro (
    id_livro INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    ano_publicacao INT,
    quantidade INT NOT NULL,
    id_categoria INT,
    CONSTRAINT fk_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
);

CREATE TABLE cliente (
    id_cliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(20),
    status VARCHAR(20)
);

CREATE TABLE emprestimo (
    id_emprestimo INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE,
    multa NUMERIC(10,2),

    CONSTRAINT fk_cliente_emprestimo
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    CONSTRAINT fk_livro_emprestimo
        FOREIGN KEY (id_livro)
        REFERENCES livro(id_livro)
);

CREATE TABLE reserva (
    id_reserva INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_livro INT NOT NULL,
    data_reserva DATE NOT NULL,
    status VARCHAR(20),

    CONSTRAINT fk_cliente_reserva
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    CONSTRAINT fk_livro_reserva
        FOREIGN KEY (id_livro)
        REFERENCES livro(id_livro)
);

CREATE TABLE plano (
    id_plano INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_plano VARCHAR(100) NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    descricao TEXT
);

CREATE TABLE assinatura (
    id_assinatura INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    status VARCHAR(20),

    CONSTRAINT fk_cliente_assinatura
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    CONSTRAINT fk_plano_assinatura
        FOREIGN KEY (id_plano)
        REFERENCES plano(id_plano)
);

CREATE TABLE pagamento (
    id_pagamento INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_assinatura INT NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    forma_pagamento VARCHAR(50),
    data_pagamento DATE,
    status VARCHAR(20),

    CONSTRAINT fk_assinatura_pagamento
        FOREIGN KEY (id_assinatura)
        REFERENCES assinatura(id_assinatura)
);
