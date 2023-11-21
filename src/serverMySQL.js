const express = require('express');
const mysql = require('mysql')
const cors = require('cors');

const app = express()
app.use(cors())

app.get('/', (re,res) => {
    return res.json("From Backend Side");
})

const db = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"(Nemesta151005)",
    database:"recursoshumanos",
    connectTimeout:10
})

app.get('/employees',(req,res)=>{
    const sql = "SELECT ip.nombre, r.nombreRol, p.nombrePais, il.fechaInicio, il.salario, il.fechaCreacion, il.fechaActualizacion FROM InfoLaboral il INNER JOIN InfoPersonal ip ON il.empleadoId = ip.empleadoId INNER JOIN Roles r ON il.rolId = r.rolId INNER JOIN Paises p ON il.paisId = p.paisId";
    db.query(sql, (err,data)=>{
        if (err) return res.json(err);
        return res.json(data);
    })
})

app.get('/payroll',(req,res)=>{
    const sql = "SELECT e.nombre AS EmployeeName, p.nombrePais AS Country, r.nombreRol AS Role, il.salario AS Salary, csp.porcentaje AS SocialChargePercentage, (il.salario * csp.porcentaje / 100) AS SocialChargeAmount FROM InfoPersonal e JOIN InfoLaboral il ON e.empleadoId = il.empleadoId JOIN Paises p ON il.paisId = p.paisId JOIN Roles r ON il.rolId = r.rolId JOIN CargasSocialesPorPais csp ON p.paisId = csp.paisId;";
    db.query(sql, (err,data)=>{
        if (err) return res.json(err);
        return res.json(data);
    })
})

app.get('/performance',(req,res)=>{
    const sql = "SELECT ip.nombre AS EmployeeName, r.nombreRol AS Role, pr.fechaReview AS ReviewDate, pr.puntuacion AS Score, pr.comentarios AS Comments FROM InfoPersonal ip JOIN InfoLaboral il ON ip.empleadoId = il.empleadoId JOIN Roles r ON il.rolId = r.rolId JOIN PerformanceReviews pr ON ip.empleadoId = pr.empleadoId ORDER BY pr.fechaReview DESC, pr.puntuacion DESC";
    db.query(sql, (err,data)=>{
        if (err) return res.json(err);
        return res.json(data);
    })
})

app.listen(8081, ()=>{
    console.log("Listening...")
})