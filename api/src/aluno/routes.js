const {Router} = require('express');
const controller = require('./controller');
const router = Router();

router.get('/', controller.getAlunos);
router.post('/', controller.postAluno)
router.put('/', controller.putAluno)
router.delete('/:id', controller.delete)
router.get('/alunoCurso/:letra', controller.getAlunosByLetter)
router.get('/alunoCurso', controller.getAlunosECursos)
router.post('/alunoCurso', controller.postCursoAluno)
router.delete('/alunoCurso', controller.deleteCursoAluno)



module.exports = router;