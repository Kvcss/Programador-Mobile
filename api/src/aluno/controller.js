const pool = require('../../db');
const queries = require('./queries');

const getAlunos = (req, res)=>{pool.query(queries.getAluno, (error, results)=>{
    if(error) throw error;
    res.status(200).json(results.rows);

});
}
const postAluno = (req, res) => {
    const { nome } = req.body;

    pool.query(queries.postAluno, [nome], (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
        } else {
            pool.query('SELECT codigo FROM aluno ORDER BY codigo DESC LIMIT 1', (err, rows) => {
                if (err) {
                    res.status(500).json({ error: err.message });
                } else {
                    if (rows.rows.length > 0 && rows.rows[0].codigo) {
                        const codigoAluno = rows.rows[0].codigo;
                        res.status(201).send({ message: 'Aluno cadastrado', codigo: codigoAluno });
                    } else {
                        res.status(500).json({ error: "Nenhum código de aluno retornado." });
                    }
                }
            });
        }
    });
};







const putAluno = (req, res) => {
    const {nome} = req.body;
    const codigoAluno = req.params.codigoAluno; 

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
  
    try {
      const result = await pool.query(queries.getAlunoCurso);
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
    const { id } = req.params; 

    pool.query(
        queries.deleteAluno,
        [id],
        (error, results) => {
            if (error) {
                return res.status(500).send({ message: "Erro ao excluir o aluno." });
            }

            if (results.affectedRows === 0 && results.warningStatus === 0) {
                res.status(404).send({ message: "Não foi possível encontrar o aluno para exclusão." });
            } else {
                res.status(200).send({ message: "Aluno excluído com sucesso." });
            }
        }
    );
};



const postMatricula = (req, res) => {
    const { codigo_aluno, codigo_curso } = req.body;

    pool.query(queries.postMatricula, [codigo_aluno, codigo_curso], (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
        } else {
            res.status(201).send({ message: 'Vínculo entre curso e aluno cadastrado' });
        }
    });
};

const deleteMatricula = (req, res) => {
    const {codigo} = req.params;

    pool.query(queries.deleteMatricula, [codigo], (error, results) => {
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
    postMatricula,
    deleteMatricula
}