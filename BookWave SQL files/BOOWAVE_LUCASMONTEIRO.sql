-- 1. Scripts SQL de INSERT
INSERT INTO Categoria (NomeCategoria, Descricao) VALUES
('Tecnologia', 'Livros sobre tecnologia e computação'),
('Ficção', 'Livros de ficção e narrativas'),
('História', 'Livros históricos e documentais');
INSERT INTO Usuario (Nome, Email, SenhaHash, Perfil) VALUES
('Ana Silva', 'ana@gmail.com', 'hash123', 'Leitor'),
('Carlos Santos', 'carlos@gmail.com', 'hash456', 'Leitor'),
('Mariana Lima', 'mariana@gmail.com', 'hash789', 'Bibliotecario');
INSERT INTO Livro (Titulo, Autor, AnoPublicacao, ISBN, URLArquivo, CategoriaID) VALUES
('Introdução à Programação', 'João Ferreira', 2020, '9780001112223', 'http://bookwave.com/prog.pdf', 1),
('A Guerra dos Mundos', 'H. G. Wells', 1898, '9780451528551', 'http://bookwave.com/guerra.pdf', 2),
('História do Brasil', 'Bóris Fausto', 2015, '9788535925441', 'http://bookwave.com/hist_brasil.pdf', 3);
INSERT INTO Emprestimo (LivroID, UsuarioID, DataEmprestimo, DataDevolucaoPrevista, Status) VALUES
(1, 1, '2025-01-10', '2025-01-20', 'Em andamento'),
(2, 2, '2025-01-11', '2025-01-21', 'Em andamento'),
(3, 1, '2025-01-12', '2025-01-22', 'Em andamento');
-- 2. Consultas SELECT
-- 1. Livros com categorias
SELECT Livro.Titulo, Categoria.NomeCategoria
FROM Livro
JOIN Categoria ON Livro.CategoriaID = Categoria.CategoriaID;
-- 2. Buscar livros por palavra-chave
SELECT * FROM Livro
WHERE Titulo LIKE '%Hist%';
-- 3. Empréstimos com usuário e livro
SELECT E.EmprestimoID, U.Nome, L.Titulo, E.DataEmprestimo
FROM Emprestimo E
JOIN Usuario U ON E.UsuarioID = U.UsuarioID
JOIN Livro L ON E.LivroID = L.LivroID;
-- 4. Top usuários com mais empréstimos
SELECT UsuarioID, COUNT(*) AS Total
FROM Emprestimo
GROUP BY UsuarioID
ORDER BY Total DESC
LIMIT 5;
-- 5. Livros ordenados por ano
SELECT * FROM Livro ORDER BY AnoPublicacao DESC;
-- 3. Comandos UPDATE
UPDATE Emprestimo
SET Status = 'Concluído'
WHERE EmprestimoID = 1;
UPDATE Usuario
SET Email = 'ana.silva@novoemail.com'
WHERE UsuarioID = 1;
UPDATE Livro
SET AnoPublicacao = 2021
WHERE LivroID = 1;
-- 4. Comandos DELETE
DELETE FROM Emprestimo
WHERE Status = 'Concluído';
DELETE FROM Usuario
WHERE UsuarioID = 2;
DELETE FROM Categoria
WHERE CategoriaID = 3;