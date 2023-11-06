const {Router} = require('express');
const controller = require('./controller');
const router = Router();
const { getAlunosECursos } = require('./controller');

router.get('/', controller.getAlunos);
router.post('/', controller.postAluno)
router.put('/:codigoAluno', controller.putAluno)
router.delete('/:codigoAluno', controller.deleteAluno)
router.get('/alunoCurso/:letra', controller.getAlunosByLetter)
//router.get('/alunoCurso', controller.getAlunosECursos)
router.post('/alunoCurso', controller.postMatricula)
router.delete('/alunoCurso/:codigo', controller.deleteMatricula)

router.get('/alunoCurso', async (req, res) => {
    try {
      const result = await getAlunosECursos();
      res.status(200).json(result);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });


module.exports = router;