INSERT INTO instrutor (id, nome, email, telefone, especialidade, ativo) VALUES
(0, 'Pedro', 'pedrin@gmail.com', '82999345231', 'Pilates', TRUE)
INSERT INTO aluno (id, nome, email, data_nascimento, nivel_cond, instrutor_id) VALUES
(0, 'Jeferson', 'jf@gmail.com', '2002-03-24', 'iniciante', 0),
(1, 'Jeferson', 'jf@gmail.com', '2002-03-24', 'avancado', 0),
(2, 'Jeferson', 'jf@gmail.com', '2002-03-24', 'iniciante', 0),
(3, 'Jeferson', 'jf@gmail.com', '2002-03-24', 'intermediario', 0),
(4, 'Jeferson', 'jf@gmail.com', '2002-03-24', 'iniciante', 0)
INSERT INTO grupo (id, nome, descricao, instrutor_id) VALUES
(0, 'Estudantes IFRN', 'Grupo de estudantes da UFRN', 0),
(1, 'Estudantes IFRN', 'Grupo de estudantes do IFRN', 0)
INSERT INTO plano (id, tipo_periodo, tipo_acomp, valor, descricao, ativo) VALUES
(0, 'mensal', 'individual', 1200, 'Plano Porquinho da Índia', TRUE),
(1, 'mensal', 'grupo', 3500, 'Plano Manada', TRUE),
(2, 'trimestral', 'individual', 2800, 'Plano Lobo', TRUE),
(3, 'trimestral', 'grupo', 8200, 'Plano Alcateia', TRUE),
(4, 'semestral', 'grupo', 8000, 'Plano Falcão', TRUE),
(5, 'semestral', 'individual', 15000, 'Plano Revoada', TRUE)
INSERT INTO contrato (id, aluno_id, plano_id, data_inicio, data_fim, status_contrato) VALUES
(0, 2, 4, '2025-11-25', '2026-11-25', 'ativo'),
(1, 3, 0, '2025-11-25', '2026-11-25', 'ativo'),
(2, 1, 1, '2025-11-25', '2026-11-25', 'ativo'),
(3, 0, 2, '2025-11-25', '2026-11-25', 'encerrado'),
(4, 4, 1, '2025-11-25', '2026-11-25', 'encerrado')
INSERT INTO cronograma (id, semana_ref, meta_km, descricao, grupo_id, aluno_id) VALUES
(1, '2026-02-14', 20, 'treino intenso', 0, 2),
(2, '2026-03-10', 10, 'treino moderado', NULL, 1)
INSERT INTO treino (id, cronograma_id, aluno_id, data_treino, distancia_km, duracao_min, status_treino) VALUES
(0, 0, 4, '2026-02-12', 2, 30, 'pendente'),
(0, 0, 3, '2026-02-11', 8, 150, 'concluido'),
(0, 0, 1, '2026-02-13', 2, 30, 'pendente'),
(0, 0, 2, '2026-02-14', 2, 30, 'pendente'),
(0, 0, 0, '2026-02-17', 6, 120, 'pendente'),
(0, 1, 2, '2026-02-18', 1, 30, 'cancelado'),
(0, 1, 1, '2026-02-12', 4, 50, 'pendente'),
(0, 1, 3, '2026-02-10', 3, 40, 'concluido'),
(0, 1, 4, '2026-02-16', 2, 30, 'pendente'),
(0, 1, 0, '2026-02-19', 2, 30, 'pendente'),
