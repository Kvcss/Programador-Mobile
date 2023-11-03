const getCursos = "SELECT * FROM curso";
const postCursos = "INSERT INTO curso (descricao, ementa, nome_curso) VALUES ($1, $2, $3)"
const putCursos = "UPDATE curso SET descricao = $1, ementa = $2, nome_curso = $3 WHERE codigo = $4";
const deleteCursos = "DELETE FROM curso WHERE codigo = $1 AND NOT EXISTS (SELECT 1 FROM curso_aluno WHERE curso_aluno.codigo_curso = curso.codigo)";

module.exports = {
    getCursos,
    postCursos,
    putCursos,
    deleteCursos
};