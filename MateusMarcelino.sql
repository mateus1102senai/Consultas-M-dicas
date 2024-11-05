CREATE DATABASE clínica;

CREATE TABLE pacientes (
id_pacientes SERIAL PRIMARY KEY,
nome VARCHAR (100) NOT NULL,
idade INTEGER,
email VARCHAR(100) UNIQUE NOT NULL
);

SELECT * FROM pacientes;

CREATE TABLE medicos (
id_medico SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
especialidade VARCHAR(140) UNIQUE NOT NULL
);

SELECT * FROM medicos;

CREATE TABLE consultas (
id_consulta SERIAL PRIMARY KEY,
data_consulta DATE NOT NULL DEFAULT CURRENT_DATE,
id_pacientes INT NOT NULL,
id_medico INT NOT NULL,
CONSTRAINT fk_pacientes FOREIGN KEY (id_pacientes) REFERENCES pacientes(id_pacientes),
CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

SELECT * FROM consultas;

INSERT INTO pacientes (nome, idade, email) VALUES
('Mateus Marcelino', '23', 'mateuscosta@gmail.com'),
('Murilo Leal', '19', 'muriloleal12@gmail.com'),
('Bruno Pires', '30', 'brunopires564@gmail.com'),
('Marcos Souza', '45', 'marcos2020@gmail.com'),
('Lucas Mali', '20', 'lucasmali@gmail.com'),
('Mariana Ferreira', '18', 'marianaferreira21@gmail.com');

SELECT * FROM pacientes;

INSERT INTO medicos (nome, especialidade) VALUES
('Lindomar Souza', 'Cardiologista'),
('Kleber Lima', 'Dermatologista'),
('Luis Ferreira', 'Endocrinologista'),
('Marcos Pereira', 'Gastroenterologista'),
('Maura Santos', 'Geriatra'),
('Pedro Moura', 'Infectologista');

SELECT * FROM medicos;

INSERT INTO consultas (data_consulta, id_pacientes, id_medico)VALUES ('2024-11-05', 2, 5);
INSERT INTO consultas (data_consulta, id_pacientes, id_medico)VALUES ('2024-05-11', 5, 4);
INSERT INTO consultas (data_consulta, id_pacientes, id_medico)VALUES ('2024-12-06', 3, 6);

SELECT * FROM consultas;

SELECT
c.id_consulta,
p.nome AS nome_pacientes,
p.idade,
p.email,
m.nome AS nome_medico,
m.especialidade,
c.data_consulta
FROM
 consultas c
JOIN
 pacientes p ON c.id_pacientes = p.id_pacientes
JOIN
 medicos m ON c.id_medico = m.id_medico
WHERE c.data_consulta <= '2024-11-05';

SELECT
c.id_consulta,
p.nome AS nome_pacientes,
p.idade,
p.email,
c.data_consulta
FROM
 consultas c
JOIN
 pacientes p ON c.id_pacientes = p.id_pacientes
WHERE c.data_consulta > '2024-05-11';

SELECT
c.id_consulta,
m.nome AS nome_medico,
m.especialidade,
c.data_consulta
FROM
 consultas c
JOIN
 medicos m ON c.id_medico = m.id_medico
WHERE c.data_consulta > '2024-12-06';
