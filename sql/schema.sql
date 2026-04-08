CREATE TYPE nivel_cond AS ENUM ('iniciante', 'intermediario', 'avancado');
CREATE TYPE tipo_per AS ENUM ('mensal', 'trimestral', 'semestral');
CREATE TYPE tipo_acomp AS ENUM ('individual', 'grupo');
CREATE TYPE status_cont AS ENUM ('ativo', 'encerrado', 'cancelado');
CREATE TYPE status_trei AS ENUM ('pendente', 'concluido', 'cancelado');
--CREATE TYPE cronogramas AS ENUM ();

CREATE TABLE instrutor(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    especialidade VARCHAR(80),
    criado_em TIMESTAMP DEFAULT now(),
    ativo BOOLEAN DEFAULT true
);

CREATE TABLE aluno(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    data_nascimento DATE,
    nivel_condicionamento nivel_cond NOT NULL,
    instrutor_id INT NOT NULL,
    FOREIGN KEY (instrutor_id) REFERENCES instrutor(id) ON DELETE CASCADE,
    criado_em TIMESTAMP DEFAULT now(),
);

CREATE TABLE grupo(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    instrutor_id INT NOT NULL,
    FOREIGN KEY (instrutor_id) REFERENCES instrutor(id) ON DELETE CASCADE,
    criado_em TIMESTAMP DEFAULT now()
);

CREATE TABLE aluno_grupo(
    aluno_id INT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES aluno(id) ON DELETE CASCADE,
    grupo_id INT NOT NULL,
    FOREIGN KEY (grupo_id) REFERENCES grupo(id) ON DELETE CASCADE,
    PRIMARY KEY (aluno_id, grupo_id),
    data_entrada DATE NOT NULL,
    ativo BOOLEAN DEFAULT true
);

CREATE TABLE plano(
    id SERIAL PRIMARY KEY,
    tipo_periodo tipo_per,
    tipo_acompanhamento tipo_acomp NOT NULL,
    valor NUMERIC(8, 2) CHECK (valor > 0),
    descricao TEXT,
    ativo BOOLEAN DEFAULT true
    
);

CREATE TABLE contrato(
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES aluno(id) ON DELETE CASCADE,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano(id) ON DELETE CASCADE,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    CHECK (data_fim >= data_inicio),
    status_contrato status_cont NOT NULL,
);

CREATE TABLE cronograma(
    id SERIAL PRIMARY KEY,
    semana_ref DATE NOT NULL,
    meta_km NUMERIC(6, 2) NOT NULL,
    descricao TEXT,
    grupo_id INT,
    FOREIGN KEY (grupo_id) REFERENCES grupo(id) ON DELETE CASCADE,
    aluno_id INT,
    CHECK (grupo_id IS NOT NULL OR aluno_id IS NOT NULL),
    FOREIGN KEY (aluno_id) REFERENCES aluno(id) ON DELETE CASCADE,
    criado_em TIMESTAMP DEFAULT now()
    
);

CREATE TABLE treino(
    id SERIAL PRIMARY KEY,
    cronograma_id INT NOT NULL,
    FOREIGN KEY (cronograma_id) REFERENCES cronograma(id) ON DELETE CASCADE,
    aluno_id INT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES aluno(id) ON DELETE CASCADE,
    data_treino DATE NOT NULL,
    distancia_km NUMERIC(6, 2) CHECK (distancia_km >= 0),
    duracao_min INT CHECK (duracao_min > 0),
    status_treino status_trei NOT NULL,
    criado_em TIMESTAMP DEFAULT now()
    
);