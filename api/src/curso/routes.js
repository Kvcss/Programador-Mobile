const {Router} = require('express');
const controller = require('./controller');
const router = Router();

router.get('/', controller.getCursos);
router.post('/', controller.postCurso);
router.put('/:codigoCurso', controller.putCurso);
router.delete('/:codigoCurso', controller.deleteCurso)

module.exports = router;