CREATE TABLE Dim_Filme (
    ID_Filme INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Genero VARCHAR(50),
    Classificacao_Indicativa VARCHAR(10),
    Data_Lancamento DATE
);

CREATE TABLE Dim_Sala (
    ID_Sala INT PRIMARY KEY,
    Nome_Sala VARCHAR(50),
    Tipo_Sala VARCHAR(50),
    Capacidade INT
);

CREATE TABLE Fato_Sessao (
    ID_Sessao INT PRIMARY KEY,
    ID_Filme INT,
    ID_Sala INT,
    Data_Hora_Sessao DATETIME,
    Preco_Base DECIMAL(10, 2),
    FOREIGN KEY (ID_Filme) REFERENCES Dim_Filme(ID_Filme),
    FOREIGN KEY (ID_Sala) REFERENCES Dim_Sala(ID_Sala)
);

CREATE TABLE Fato_Venda_Ingresso (
    ID_Venda_Ingresso INT PRIMARY KEY,
    ID_Sessao INT,
    Tipo_Ingresso VARCHAR(30),
    Canal_Venda VARCHAR(50),
    Data_Venda DATETIME,
    Valor_Pago DECIMAL(10, 2),
    FOREIGN KEY (ID_Sessao) REFERENCES Fato_Sessao(ID_Sessao)
);

CREATE TABLE Fato_Venda_Bomboniere (
    ID_Venda_Bomboniere INT PRIMARY KEY,
    ID_Sessao INT,
    Item_Comprado VARCHAR(100),
    Quantidade INT,
    Valor_Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Sessao) REFERENCES Fato_Sessao(ID_Sessao)
);


/* Inserção de Dados */

-- Inserindo 20 Filmes
INSERT INTO Dim_Filme (ID_Filme, Titulo, Genero, Classificacao_Indicativa, Data_Lancamento) VALUES
(1, 'O Vingador do Futuro', 'Ação', '16 Anos', '2023-11-01'),
(2, 'Estrelas Além do Tempo', 'Drama', 'Livre', '2023-10-15'),
(3, 'Riso Solto', 'Comédia', '12 Anos', '2023-11-10'),
(4, 'O Código Oculto', 'Ficção Científica', '14 Anos', '2023-09-20'),
(5, 'Aventuras na Selva', 'Aventura', 'Livre', '2023-10-05'),
(6, 'Sombras da Noite', 'Terror', '18 Anos', '2023-10-31'),
(7, 'Amor em Paris', 'Romance', '12 Anos', '2023-11-12'),
(8, 'Operação Dinamite', 'Ação', '16 Anos', '2023-08-15'),
(9, 'O Mistério da Ilha', 'Suspense', '14 Anos', '2023-09-10'),
(10, 'Heróis de Galáxia', 'Aventura', 'Livre', '2023-07-20'),
(11, 'Velocidade Máxima', 'Ação', '14 Anos', '2023-11-05'),
(12, 'O Casamento do Ano', 'Comédia', '12 Anos', '2023-10-12'),
(13, 'Grito no Escuro', 'Terror', '18 Anos', '2023-10-25'),
(14, 'Planeta Distante', 'Ficção Científica', '12 Anos', '2023-09-05'),
(15, 'Encontro Inesperado', 'Romance', 'Livre', '2023-08-22'),
(16, 'A Lenda do Cavaleiro', 'Aventura', '10 Anos', '2023-11-01'),
(17, 'Fuga Impossível', 'Ação', '16 Anos', '2023-07-15'),
(18, 'Segredos de Família', 'Drama', '14 Anos', '2023-10-08'),
(19, 'O Palhaço Triste', 'Comédia', '16 Anos', '2023-09-30'),
(20, 'Invasão Alienígena', 'Ficção Científica', '12 Anos', '2023-11-15');

-- Inserindo 20 Salas (Foco nos diferentes tipos de experiência)
INSERT INTO Dim_Sala (ID_Sala, Nome_Sala, Tipo_Sala, Capacidade) VALUES
(1, 'Sala 1', 'Padrão', 150),
(2, 'Sala 2', 'Padrão', 150),
(3, 'Sala 3', 'Padrão', 120),
(4, 'Sala 4', '3D XPLUS', 200),
(5, 'Sala 5', 'VIP', 60),
(6, 'Sala 6', 'Padrão', 150),
(7, 'Sala 7', '3D XPLUS', 200),
(8, 'Sala 8', 'VIP', 60),
(9, 'Sala 9', 'Padrão', 120),
(10, 'Sala 10', 'Padrão', 150),
(11, 'Sala 11', 'IMAX', 250),
(12, 'Sala 12', 'Padrão', 120),
(13, 'Sala 13', '3D XPLUS', 200),
(14, 'Sala 14', 'Padrão', 150),
(15, 'Sala 15', 'VIP', 60),
(16, 'Sala 16', 'Padrão', 120),
(17, 'Sala 17', '3D XPLUS', 200),
(18, 'Sala 18', 'Padrão', 150),
(19, 'Sala 19', 'VIP', 60),
(20, 'Sala 20', 'IMAX', 250);

-- Inserindo 25 Sessões
INSERT INTO Fato_Sessao (ID_Sessao, ID_Filme, ID_Sala, Data_Hora_Sessao, Preco_Base) VALUES
(1, 1, 4, '2023-11-20 20:00:00', 45.00),
(2, 2, 1, '2023-11-20 18:30:00', 30.00),
(3, 3, 2, '2023-11-20 19:00:00', 30.00),
(4, 4, 11, '2023-11-20 21:00:00', 50.00),
(5, 5, 3, '2023-11-20 15:00:00', 30.00),
(6, 6, 7, '2023-11-20 23:00:00', 45.00),
(7, 7, 5, '2023-11-21 20:30:00', 70.00),
(8, 8, 13, '2023-11-21 19:30:00', 45.00),
(9, 9, 6, '2023-11-21 21:15:00', 30.00),
(10, 10, 20, '2023-11-21 16:00:00', 50.00),
(11, 11, 4, '2023-11-22 18:00:00', 45.00),
(12, 12, 1, '2023-11-22 20:00:00', 30.00),
(13, 13, 8, '2023-11-22 22:30:00', 70.00),
(14, 14, 11, '2023-11-22 19:45:00', 50.00),
(15, 15, 2, '2023-11-23 17:30:00', 30.00),
(16, 1, 17, '2023-11-23 21:00:00', 45.00),
(17, 3, 9, '2023-11-23 20:15:00', 30.00),
(18, 5, 15, '2023-11-24 14:00:00', 70.00),
(19, 6, 7, '2023-11-24 23:45:00', 45.00),
(20, 10, 20, '2023-11-24 18:00:00', 50.00),
(21, 2, 5, '2023-11-25 19:00:00', 70.00),
(22, 4, 13, '2023-11-25 21:30:00', 45.00),
(23, 8, 11, '2023-11-25 16:30:00', 50.00),
(24, 12, 1, '2023-11-26 20:00:00', 30.00),
(25, 14, 4, '2023-11-26 18:45:00', 45.00);

-- Inserindo 25 Vendas de Ingressos
INSERT INTO Fato_Venda_Ingresso (ID_Venda_Ingresso, ID_Sessao, Tipo_Ingresso, Canal_Venda, Data_Venda, Valor_Pago) VALUES
(1, 1, 'Inteira', 'Site', '2023-11-19 14:20:00', 45.00),
(2, 1, 'Meia', 'Site', '2023-11-19 14:20:00', 22.50),
(3, 2, 'Inteira', 'Bilheteria', '2023-11-20 18:15:00', 30.00),
(4, 3, 'Meia', 'Aplicativo', '2023-11-18 09:10:00', 15.00),
(5, 4, 'Inteira', 'Site', '2023-11-20 10:00:00', 50.00),
(6, 5, 'Meia', 'Bilheteria', '2023-11-20 14:50:00', 15.00),
(7, 6, 'Inteira', 'Aplicativo', '2023-11-19 22:00:00', 45.00),
(8, 7, 'Inteira', 'Site', '2023-11-20 16:30:00', 70.00),
(9, 7, 'Inteira', 'Site', '2023-11-20 16:30:00', 70.00),
(10, 8, 'Meia', 'Totem', '2023-11-21 19:00:00', 22.50),
(11, 9, 'Inteira', 'Bilheteria', '2023-11-21 21:00:00', 30.00),
(12, 10, 'Meia', 'Aplicativo', '2023-11-21 12:00:00', 25.00),
(13, 11, 'Inteira', 'Site', '2023-11-22 10:45:00', 45.00),
(14, 12, 'Meia', 'Totem', '2023-11-22 19:40:00', 15.00),
(15, 13, 'Inteira', 'Site', '2023-11-22 20:00:00', 70.00),
(16, 14, 'Inteira', 'Aplicativo', '2023-11-22 15:30:00', 50.00),
(17, 15, 'Meia', 'Bilheteria', '2023-11-23 17:15:00', 15.00),
(18, 16, 'Inteira', 'Site', '2023-11-23 18:00:00', 45.00),
(19, 17, 'Inteira', 'Totem', '2023-11-23 20:00:00', 30.00),
(20, 18, 'Meia', 'Site', '2023-11-23 09:00:00', 35.00),
(21, 19, 'Inteira', 'Aplicativo', '2023-11-24 20:00:00', 45.00),
(22, 20, 'Inteira', 'Bilheteria', '2023-11-24 17:45:00', 50.00),
(23, 21, 'Inteira', 'Site', '2023-11-25 14:00:00', 70.00),
(24, 22, 'Meia', 'Aplicativo', '2023-11-25 19:30:00', 22.50),
(25, 23, 'Inteira', 'Totem', '2023-11-25 16:15:00', 50.00);

-- Inserindo 25 Vendas de Bomboniere
INSERT INTO Fato_Venda_Bomboniere (ID_Venda_Bomboniere, ID_Sessao, Item_Comprado, Quantidade, Valor_Total) VALUES
(1, 1, 'Combo Mega (Pipoca G + 2 Refri)', 1, 65.00),
(2, 1, 'Chocolate Barra', 2, 16.00),
(3, 2, 'Pipoca Média', 1, 25.00),
(4, 3, 'Combo Individual (Pipoca M + 1 Refri)', 1, 40.00),
(5, 4, 'Refrigerante Grande', 2, 30.00),
(6, 5, 'Combo Kids', 2, 70.00),
(7, 6, 'Energético', 1, 18.00),
(8, 7, 'Combo VIP (Pipoca Trufada + Vinho)', 1, 95.00),
(9, 8, 'Água Mineral', 3, 15.00),
(10, 9, 'Balde de Pipoca Colecionável', 1, 55.00),
(11, 10, 'Combo Mega (Pipoca G + 2 Refri)', 1, 65.00),
(12, 11, 'Nachos com Queijo', 1, 32.00),
(13, 12, 'Pipoca Pequena', 1, 18.00),
(14, 13, 'Combo VIP (Pipoca Trufada + Vinho)', 1, 95.00),
(15, 14, 'Chocolate Barra', 1, 8.00),
(16, 15, 'Combo Individual (Pipoca M + 1 Refri)', 1, 40.00),
(17, 16, 'Balde de Pipoca Colecionável', 1, 55.00),
(18, 17, 'Refrigerante Médio', 1, 12.00),
(19, 18, 'Combo Kids', 1, 35.00),
(20, 19, 'Energético', 2, 36.00),
(21, 20, 'Combo Mega (Pipoca G + 2 Refri)', 2, 130.00),
(22, 21, 'Porção de Mini Churros', 1, 28.00),
(23, 22, 'Pipoca Grande', 1, 32.00),
(24, 23, 'Água Mineral', 2, 10.00),
(25, 24, 'Nachos com Queijo', 2, 64.00);