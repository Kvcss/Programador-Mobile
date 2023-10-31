const express = require('express')
const cursoRoutes = require('./src/curso/routes');
const alunoRoutes = require('./src/aluno/routes');
const app = express();
const port = 3000; 

app.use(express.json());

app.use("/api/curso", cursoRoutes);
app.use("/api/aluno", alunoRoutes);

app.listen(port,()=> console.log(`Escutando na porta ${port}`));