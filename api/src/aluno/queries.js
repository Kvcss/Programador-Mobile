const getAluno = "SELECT *  FROM aluno";
const postAluno = "INSERT INTO aluno (nome) VALUES ($1)"
const putAluno = "UPDATE aluno SET nome = $1 WHERE codigo = $2"
const deleteAluno = "DELETE FROM aluno WHERE codigo = $1 AND NOT EXISTS (SELECT 1 FROM curso_aluno WHERE curso_aluno.codigo_aluno = aluno.codigo)"
const getAlunoCurso = `
SELECT 
    a.nome AS nome_aluno, 
    CASE  
        WHEN c.nome_curso IS NOT NULL THEN c.nome_curso  
        ELSE 'Sem curso' 
    END AS nome_curso 
FROM 
    aluno a 
LEFT JOIN 
    curso_aluno ca ON a.codigo = ca.codigo_aluno 
LEFT JOIN 
    curso c ON ca.codigo_curso = c.codigo;
`;
const postAlunoCurso = "INSERT INTO curso_aluno (codigo_aluno, codigo_curso) VALUES ($1, $2)"
const deleteAlunoCurso = "DELETE FROM curso_aluno WHERE codigo_aluno = $1 AND codigo_curso = $2"

module.exports = {
    getAluno,
    postAluno,
    putAluno,
    deleteAluno,
    getAlunoCurso,
    postAlunoCurso,
    deleteAlunoCurso

};