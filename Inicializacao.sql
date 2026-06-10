INSERT INTO categoria (nome_categoria)
VALUES ('Tecnologia');

INSERT INTO livro (
    titulo,
    autor,
    isbn,
    ano_publicacao,
    quantidade,
    id_categoria
)
VALUES (
    'Banco de Dados',
    'Carlos Silva',
    '9781234567890',
    2023,
    10,
    1
);

INSERT INTO cliente (
    nome,
    email,
    senha,
    data_nascimento,
    telefone,
    status
)
VALUES (
    'Arthur Gabriel',
    'arthur@gmail.com',
    '123456',
    '2008-05-10',
    '31999999999',
    'Ativo'
);

INSERT INTO plano (
    nome_plano,
    valor,
    descricao
)
VALUES (
    'Premium',
    50.00,
    'Visualização online'
);

INSERT INTO assinatura (
    id_cliente,
    id_plano,
    data_inicio,
    data_fim,
    status
)
VALUES (
    1,
    1,
    '2026-01-01',
    '2026-12-31',
    'Ativo'
);

INSERT INTO pagamento (
    id_assinatura,
    valor,
    forma_pagamento,
    data_pagamento,
    status
)
VALUES (
    1,
    50.00,
    'Cartão de Crédito',
    '2026-01-01',
    'Confirmado'
);