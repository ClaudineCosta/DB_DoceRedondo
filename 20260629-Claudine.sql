CREATE DATABASE IF NOT EXISTS doce_redondo;
USE doce_redondo;

-- ------------------------------------------------------------
-- Tabela: Pessoa
-- Representa qualquer entidade humana no sistema
-- (usuário, cliente, colaborador, participante, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa   INT AUTO_INCREMENT PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    email       VARCHAR(150) UNIQUE,
    data_nascimento DATE,
    telefone    VARCHAR(20),
    status_pessoa   VARCHAR(20) DEFAULT 'ativo'
);

-- ------------------------------------------------------------
-- Tabela: Item
-- Representa qualquer recurso, produto ou elemento do sistema
-- (produto, livro, equipamento, serviço, vaga, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS item (
    id_item    INT AUTO_INCREMENT PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    categoria  VARCHAR(50),
    descricao  TEXT,
    valor      DECIMAL(10, 2),
    quantidade_disponivel INT DEFAULT 0
);

-- ------------------------------------------------------------
-- Tabela: Registro
-- Representa uma relação entre Pessoa e Item
-- (compra, empréstimo, inscrição, reserva, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS registro (
    id_registro  INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa    INT NOT NULL,
    id_item      INT NOT NULL,
    data_registro DATE DEFAULT NULL,
    observacao   TEXT,
    status_registro       VARCHAR(20) DEFAULT 'pendente',
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    FOREIGN KEY (id_item)   REFERENCES item(id_item)
);

-- ------------------------------------------------------------
-- Dados
-- Quais outros dados poderiam fazer parte do seu banco?
-- ------------------------------------------------------------

INSERT INTO pessoa (nome, email, data_nascimento, telefone, status_pessoa) VALUES
('João Silva', 'joao.silva@email.com', '1990-05-12', '11987654321', 'cliente'),
('Maria Oliveira', 'maria.oliveira@email.com', '1985-03-22', '11912345678', 'cliente'),
('Carlos Souza', 'carlos.souza@email.com', '1992-07-10', '11923456789', 'cliente'),
('Ana Costa', 'ana.costa@email.com', '1998-11-30', '11934567890', 'cliente'),
('Pedro Santos', 'pedro.santos@email.com', '1980-01-15', '11945678901', 'cliente'),
('Fernanda Lima', 'fernanda.lima@email.com', '1995-09-25', '11956789012', 'cliente'),
('Ricardo Alves', 'ricardo.alves@email.com', '1988-04-18', '11967890123', 'cliente'),
('Juliana Martins', 'juliana.martins@email.com', '1993-12-05', '11978901234', 'cliente'),
('Lucas Ferreira', 'lucas.ferreira@email.com', '2008-06-14', '11989012345', 'cliente'),
('Patrícia Gomes', 'patricia.gomes@email.com', '1987-02-28', '11990123456', 'cliente'),
('Beatriz Carvalho', 'beatriz.carvalho@email.com', '2007-03-03', '11933445566', 'cliente'),
('Felipe Araújo', 'felipe.araujo@email.com', '2009-07-07', '11944556677', 'cliente'),

-- Funcionários
('André Rocha', 'andre.rocha@email.com', '1991-08-09', '11901234567', 'funcionario'), -- gerente
('Camila Ribeiro', 'camila.ribeiro@email.com', '1996-10-21', '11911223344', 'funcionario'), -- vendedor
('Marcelo Pinto', 'marcelo.pinto@email.com', '1983-12-12', '11922334455', 'funcionario'), -- atendente
('Roberta Nunes', 'roberta.nunes@email.com', '1989-09-19', '11955667788', 'funcionario'); -- caixa



INSERT INTO item (nome, categoria, descricao, valor, quantidade_disponivel) VALUES
-- Donuts
('Donut Chocolate', 'Donut', 'Cobertura de chocolate ao leite', 8.50, 20),
('Donut Morango', 'Donut', 'Cobertura de morango com confeitos', 9.00, 15),
('Donut Caramelo', 'Donut', 'Recheado com creme de caramelo', 9.50, 12),
('Donut Baunilha', 'Donut', 'Clássico com glacê de baunilha', 8.00, 18),
('Donut Brigadeiro', 'Donut', 'Recheado e coberto com brigadeiro', 10.00, 10),
('Donut Coco', 'Donut', 'Cobertura de coco ralado', 8.50, 14),
('Donut Limão', 'Donut', 'Glacê de limão siciliano', 9.00, 16),
('Donut Nutella', 'Donut', 'Recheado com creme de avelã', 11.00, 8),
('Donut Red Velvet', 'Donut', 'Inspirado no bolo Red Velvet', 10.50, 9),
('Donut Café', 'Donut', 'Cobertura de café cremoso', 9.50, 11),
('Donut Pistache', 'Donut', 'Cobertura de pistache crocante', 11.00, 7),
('Donut Frutas Vermelhas', 'Donut', 'Cobertura de frutas vermelhas', 9.50, 13),
('Donut Oreo', 'Donut', 'Cobertura com pedaços de Oreo', 10.50, 10),
('Donut Doce de Leite', 'Donut', 'Recheado com doce de leite', 9.50, 12),

-- Bebidas
('Café Expresso', 'Bebida', 'Café expresso curto e intenso', 5.00, 30),
('Cappuccino', 'Bebida', 'Café com leite vaporizado e espuma', 7.00, 25),
('Latte', 'Bebida', 'Café suave com bastante leite', 6.50, 20),
('Suco de Laranja', 'Bebida', 'Suco natural de laranja', 6.00, 18),
('Chá Gelado', 'Bebida', 'Chá preto gelado com limão', 5.50, 22),
('Chocolate Quente', 'Bebida', 'Bebida cremosa de chocolate quente', 7.50, 15);


INSERT INTO registro (id_pessoa, id_item, data_registro, observacao, status_registro) VALUES
(1, 1, '2025-01-10', 'vendedora Camila - cartão crédito', 'concluido'),
(2, 2, '2025-01-11', 'atendente Marcelo - pedido viagem', 'concluido'),
(3, 3, '2025-01-12', 'vendedora Camila - combo café + donut', 'concluido'),
(4, 4, '2025-01-13', 'atendente Marcelo - cliente elogiou', 'concluido'),
(5, 5, '2025-01-14', 'vendedora Camila - pagamento PIX', 'cancelado'),
(6, 6, '2025-01-15', 'atendente Marcelo - desconto fidelidade', 'concluido'),
(7, 7, '2025-01-16', 'vendedora Camila - pedido sem cobertura', 'concluido'),
(8, 8, '2025-01-17', 'atendente Marcelo - pagamento dinheiro', 'cancelado'),
(9, 9, '2025-01-18', 'vendedora Camila - cliente reclamou demora', 'concluido'),
(10, 10, '2025-01-19', 'atendente Marcelo - promoção 2 por 1', 'concluido'),
(11, 11, '2025-01-20', 'vendedora Camila - pedido viagem', 'concluido'),
(1, 12, '2025-01-21', 'atendente Marcelo - cartão débito', 'concluido'),
(2, 13, '2025-01-22', 'vendedora Camila - extra recheio', 'cancelado'),
(3, 14, '2025-01-23', 'atendente Marcelo - turno manhã', 'concluido'),
(4, 15, '2025-01-24', 'vendedora Camila - pagamento PIX', 'concluido'),
(5, 16, '2025-01-25', 'atendente Marcelo - cliente pediu viagem', 'concluido'),
(6, 17, '2025-01-26', 'vendedora Camila - combo latte + donut', 'concluido'),
(7, 18, '2025-01-27', 'atendente Marcelo - pagamento dinheiro', 'cancelado'),
(8, 19, '2025-01-28', 'vendedora Camila - cliente elogiou sabor', 'concluido'),
(9, 20, '2025-01-29', 'atendente Marcelo - promoção fidelidade', 'concluido'),
(10, 1, '2025-01-30', 'vendedora Camila - cartão crédito', 'concluido'),
(11, 2, '2025-01-31', 'atendente Marcelo - pedido viagem', 'cancelado'),
(1, 3, '2025-02-01', 'vendedora Camila - combo café + donut', 'concluido'),
(2, 4, '2025-02-02', 'atendente Marcelo - cliente elogiou', 'concluido'),
(3, 5, '2025-02-03', 'vendedora Camila - pagamento PIX', 'concluido'),
(4, 6, '2025-02-04', 'atendente Marcelo - desconto fidelidade', 'cancelado'),
(5, 7, '2025-02-05', 'vendedora Camila - pedido sem cobertura', 'concluido'),
(6, 8, '2025-02-06', 'atendente Marcelo - pagamento dinheiro', 'concluido'),
(7, 9, '2025-02-07', 'vendedora Camila - cliente reclamou demora', 'concluido'),
(8, 10, '2025-02-08', 'atendente Marcelo - promoção 2 por 1', 'cancelado');

-- ------------------------------------------------------------
-- Agora:
-- 1. Defina o contexto do seu sistema (Fase 1)
-- 2. Gere dados coerentes com esse contexto com IA (Fase 2)
--    e adicione os dados usando INSERT
-- 3. Formule suas perguntas e escreva os comandos abaixo (Fase 3)
-- ------------------------------------------------------------

SELECT * FROM pessoa;
SELECT * FROM item;
SELECT * FROM registro;



-- Pergunta 1 (UPDATE):
-- [escreva aqui uma pergunta que pode ser respondida usando UPDATE]
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]

-- 1 - E se o registro do nome da pessoa foi escrito errado ?
UPDATE pessoa
SET nome = 'Maria Oliveira'
WHERE id_pessoa = 2;

UPDATE pessoa
SET nome = 'Mario Oliveira'
WHERE id_pessoa = 2;



-- Pergunta 2 (DELETE):
-- [escreva aqui uma pergunta que pode ser respondida usando DELETE]
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]

-- e se for preciso deletar um ex-funcionario ?
DELETE FROM pessoa
WHERE id_pessoa = 15;  -- atendente Marcelo



-- Pergunta 3 (ALTER TABLE):
-- [escreva aqui uma pergunta que pode ser respondida usando ALTER TABLE]
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]

-- agora a doceria fara entrega a domicilio e precisa do endereço do cliente

ALTER TABLE pessoa
ADD logradouro VARCHAR(100),
ADD numero VARCHAR(10),
ADD complemento VARCHAR(50),
ADD bairro VARCHAR(50),
ADD cidade VARCHAR(50),
ADD estado VARCHAR(2),
ADD cep VARCHAR(10);

INSERT INTO pessoa (nome, email, data_nascimento, telefone, status_pessoa, logradouro,
 numero, complemento, bairro, cidade, estado, cep) VALUES
('Ana Silva', 'ana.silva@email.com', '1990-05-12', '11988887777', 'cliente', 
'Rua das Flores', '123', 'Apto 45', 'Centro', 'São Paulo', 'SP', '01000-000');

SELECT * FROM pessoa;

