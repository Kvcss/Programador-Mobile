const getCursos = "SELECT * FROM curso";
const postCursos = "INSERT INTO curso (descricao, ementa, nome_curso) VALUES ($1, $2, $3)"
const putCursos = "UPDATE curso SET descricao = $1, ementa = $2, nome_curso = $3 WHERE codigo = $4";
const deleteCursos = "DELETE FROM curso WHERE codigo = $1 AND NOT EXISTS (SELECT 1 FROM curso_aluno WHERE curso_aluno.codigo_curso = curso.codigo)";
const getCursosByLetter = "SELECT nome_curso FROM curso WHERE LOWER(SUBSTRING(nome_curso FROM 1 FOR 1)) = LOWER($1)"
module.exports = {
    getCursos,
    postCursos,
    putCursos,
    deleteCursos,
    getCursosByLetter
};