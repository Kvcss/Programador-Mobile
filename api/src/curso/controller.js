const pool = require('../../db');
const queries = require('./queries');

const getCursos = (req, res)=>{pool.query(queries.getCursos, (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);

});
}

module.exports = {
    getCursos
}