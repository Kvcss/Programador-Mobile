const Pool = require('pg').Pool;

const pool = new Pool({
    user: "kolgdrsr",
    host: "isabelle.db.elephantsql.com",
    database: "kolgdrsr",
    password: "07ciolDX1xdqaOpkeoOf7Hp2FHR0hapO",
    port: 5432
});

module.exports = pool;
