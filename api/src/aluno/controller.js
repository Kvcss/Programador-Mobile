const pool = require('../../db');
const queries = require('./queries');

const getAlunos = (req, res)=>{pool.query(queries.getAlunos, (error, results)=>{
    if(error) throw error;
    res.status(200).json(results.rows);

});
}

module.exports = {
    getAlunos
}