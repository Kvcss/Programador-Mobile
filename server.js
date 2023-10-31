const express = require('express')
const cursoRoutes = require('./src/curso/routes');
const app = express();
const port = 3000; 

app.use(express.json());

app.use("/api/curso", cursoRoutes);

app.listen(port,()=> console.log(`Escutando na porta ${port}`));