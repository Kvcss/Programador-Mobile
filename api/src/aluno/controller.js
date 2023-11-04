const pool = require('../../db');
const queries = require('./queries');

const getAlunos = (req, res)=>{pool.query(queries.getAluno, (error, results)=>{
    if(error) throw error;
    res.status(200).json(results.rows);

});
}

const postAluno = (req, res) => {
    const {nome} = req.body;

    pool.query(queries.postAluno, [nome], (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
        } else {
            res.status(201).send({ message: 'Aluno cadastrado' });
        }
    });
};

const putAluno = (req, res) => {
    const {nome} = req.body;
    const codigoAluno = req.params.codigoAluno; // Obtém o código do curso da URL

    pool.query(
        queries.putAluno,[nome,codigoAluno],
        (error, results) => {
            if (error) {
                res.status(500).json({ error: error.message });
            } else {
                if (results.rowCount === 0) {
                    res.status(404).json({ message: 'Aluno não cadastrado' });
                } else {
                    res.status(200).send({ message: 'Informações atualizadas!' });
                }
            }
        }
    );
};
const getAlunosECursos = async () => {
    const query = `
      SELECT 
        a.codigo AS codigo_aluno,
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
  
    try {
      const result = await pool.query(query);
      return result.rows;
    } catch (error) {
      throw error;
    }
  };
  


const getAlunosByLetter = (req, res) => {
    const { letra } = req.params;

    pool.query(
        `SELECT 
            a.codigo AS codigo_aluno, 
            a.nome AS nome_aluno, 
            COALESCE(c.nome_curso, 'Sem curso') AS nome_curso 
        FROM 
            aluno a 
        LEFT JOIN 
            curso_aluno ca ON a.codigo = ca.codigo_aluno 
        LEFT JOIN 
            curso c ON ca.codigo_curso = c.codigo
        WHERE LOWER(SUBSTRING(a.nome FROM 1 FOR 1)) = LOWER($1);`,
        [letra],
        (error, results) => {
            if (error) {
                throw error;
            }
            res.status(200).json(results.rows);
        }
    );
};


const deleteAluno = (req, res) => {
    const {id} = req.params; // Supondo que o ID do aluno seja passado como parâmetro na rota

    pool.query(
        queries.deleteAluno,
        [id],
        (error, results) => {
            if (error) {
                throw error;
            }
            res.status(200).send({message:"Aluno excluído com sucesso.}"});
        }
    );
};

const postCursoAluno = (req, res) => {
    const { codigo_aluno, codigo_curso } = req.body;

    pool.query(queries.postAlunoCurso, [codigo_aluno, codigo_curso], (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
        } else {
            res.status(201).send({ message: 'Vínculo entre curso e aluno cadastrado' });
        }
    });
};

const deleteCursoAluno = (req, res) => {
    const { codigo_aluno, codigo_curso } = req.body;

    pool.query(queries.deleteAlunoCurso, [codigo_aluno, codigo_curso], (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
        } else {
            res.status(200).send({ message: 'Vínculo entre curso e aluno removido' });
        }
    });
};


module.exports = {
    getAlunos,
    postAluno,
    putAluno,
    getAlunosECursos,
    getAlunosByLetter,
    deleteAluno,
    postCursoAluno,
    deleteCursoAluno
}