const pool = require('../../db');
const queries = require('./queries');

const getCursos = (req, res)=>{pool.query(queries.getCursos, (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);

});
}

const postCurso = (req, res) => {
    const { descricao, ementa, nome_curso } = req.body;

    pool.query(queries.postCursos, [descricao, ementa, nome_curso], (error, results) => {
        if (error) {
            res.status(500).json({ error: error.message });
        } else {
            res.status(201).send({ message: 'Curso criado' });
        }
    });
};

const putCurso = (req, res) => {
    const { descricao, ementa, nome_curso } = req.body;
    const codigoCurso = req.params.codigoCurso; // Obtém o código do curso da URL

    pool.query(
        queries.putCursos,[descricao, ementa, nome_curso, codigoCurso],
        (error, results) => {
            if (error) {
                res.status(500).json({ error: error.message });
            } else {
                if (results.rowCount === 0) {
                    res.status(404).json({ message: 'Curso não encontrado' });
                } else {
                    res.status(200).send({ message: 'Curso atualizado' });
                }
            }
        }
    );
};
const deleteCurso = (req, res) => {
    const codigoCurso = req.params.codigoCurso;

    pool.query(
        queries.deleteCursos, [codigoCurso],
        (error, results) => {
            if (error) {
                res.status(500).json({ error: error.message });
            } else {
                if (results.rowCount === 0) {
                    res.status(404).json({ message: 'Existe alunos vinculados a este curso' });
                } else if (results.rowCount > 0) {
                    res.status(200).json({ message: 'Curso excluído' });
                }
            }
        }
    );
};




module.exports = {
    getCursos,
    postCurso,
    putCurso,
    deleteCurso
}