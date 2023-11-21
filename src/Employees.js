import React, { useState, useEffect } from 'react';
import { 
  Container, 
  Typography, 
  Table, 
  TableBody, 
  TableCell, 
  TableContainer, 
  TableHead, 
  TableRow, 
  Paper,
  Button,
  Grid
} from "@mui/material";

function Employees() {
    const [employees, setEmployees] = useState([]);
    const [showTable, setShowTable] = useState(false);
    const [payroll, setPayroll] = useState([]);
    const [showTablePayroll, setShowTablePayroll] = useState(false);
    const [performance, setPerformance] = useState([]);
    const [showTablePerformance, setShowTablePerformance] = useState(false);

  const buttonStyle = { 
    margin: '10px 10px 10px 0' 
  };

  const cellStyles = {
    minWidth: 150, // Adjust the minimum width as needed
  };

  const fetchEmployees = () => {
    fetch('http://localhost:8081/employees')
      .then(res => res.json())
      .then(data => {
        setEmployees(data);
        setShowTablePayroll(false);
        setShowTablePerformance(false);
        setShowTable(true); // Show table after data is fetched
      })
      .catch(err => console.log(err));
  };

  const handlePayrollCostReport = () => {
    fetch('http://localhost:8081/payroll')
      .then(res => res.json())
      .then(data => {
        setPayroll(data);
        setShowTable(false);
        setShowTablePerformance(false);
        setShowTablePayroll(true); // Show table after data is fetched
      })
      .catch(err => console.log(err));
  };

  const handlePerformanceReport = () => {
    fetch('http://localhost:8081/performance')
      .then(res => res.json())
      .then(data => {
        setPerformance(data);
        setShowTablePayroll(false);
        setShowTable(false);
        setShowTablePerformance(true); // Show table after data is fetched
      })
      .catch(err => console.log(err));
  };

  return (
    <Container>
      <Typography variant="h4" style={{ margin: '20px 0' }}>Employees Administration</Typography>
      
      <Grid container spacing={2} style={{ marginBottom: '20px' }}>
        <Grid item>
          <Button 
            variant="contained" 
            color="primary" 
            onClick={fetchEmployees}
            style={buttonStyle}
          >
            Consult Employees
          </Button>
        </Grid>
        <Grid item>
          <Button 
            variant="contained" 
            color="primary"  
            onClick={handlePayrollCostReport}
            style={buttonStyle}
          >
            Payroll Cost Report
          </Button>
        </Grid>
        <Grid item>
          <Button 
            variant="contained" 
            color="primary" 
            onClick={handlePerformanceReport}
            style={buttonStyle}
          >
            Performance Report
          </Button>
        </Grid>
      </Grid>

      {showTable && (
        <TableContainer component={Paper} style={{ maxHeight: 440 }}>
        <Table stickyHeader aria-label="employees table">
        <TableHead>
          <TableRow>
            <TableCell style={cellStyles}>Nombre</TableCell>
            <TableCell style={cellStyles}>Rol</TableCell>
            <TableCell style={cellStyles}>País</TableCell>
            <TableCell style={cellStyles}>Fecha Inicio</TableCell>
            <TableCell style={cellStyles}>Salario</TableCell>
            <TableCell style={cellStyles}>Fecha de Creación</TableCell>
            <TableCell style={cellStyles}>Fecha de Actualización</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {employees.map((d, i) => (
            <TableRow key={i}>
              <TableCell style={cellStyles}>{d.nombre}</TableCell>
              <TableCell style={cellStyles}>{d.nombreRol}</TableCell>
              <TableCell style={cellStyles}>{d.nombrePais}</TableCell>
              <TableCell style={cellStyles}>{d.fechaInicio}</TableCell>
              <TableCell style={cellStyles}>{d.salario}</TableCell>
              <TableCell style={cellStyles}>{d.fechaCreacion}</TableCell>
              <TableCell style={cellStyles}>{d.fechaActualizacion}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
      </TableContainer>
      )}
      {showTablePayroll && (
        <TableContainer component={Paper} style={{ maxHeight: 440 }}>
        <Table stickyHeader aria-label="payroll table">
        <TableHead>
          <TableRow>
            <TableCell style={cellStyles}>Empleado</TableCell>
            <TableCell style={cellStyles}>Country</TableCell>
            <TableCell style={cellStyles}>Role</TableCell>
            <TableCell style={cellStyles}>Salary Inicio</TableCell>
            <TableCell style={cellStyles}>Social Charge Percentage</TableCell>
            <TableCell style={cellStyles}>Social Charge Amount</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {payroll.map((d, i) => (
            <TableRow key={i}>
              <TableCell style={cellStyles}>{d.EmployeeName}</TableCell>
              <TableCell style={cellStyles}>{d.Country}</TableCell>
              <TableCell style={cellStyles}>{d.Role}</TableCell>
              <TableCell style={cellStyles}>{d.Salary}</TableCell>
              <TableCell style={cellStyles}>{d.SocialChargePercentage}</TableCell>
              <TableCell style={cellStyles}>{d.SocialChargeAmount}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
      </TableContainer>
      )}
      {showTablePerformance && (
        <TableContainer component={Paper} style={{ maxHeight: 440 }}>
        <Table stickyHeader aria-label="performance table">
        <TableHead>
          <TableRow>
            <TableCell style={cellStyles}>Employee</TableCell>
            <TableCell style={cellStyles}>Role</TableCell>
            <TableCell style={cellStyles}>Date</TableCell>
            <TableCell style={cellStyles}>Score</TableCell>
            <TableCell style={cellStyles}>Comments</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {performance.map((d, i) => (
            <TableRow key={i}>
              <TableCell style={cellStyles}>{d.EmployeeName}</TableCell>
              <TableCell style={cellStyles}>{d.Role}</TableCell>
              <TableCell style={cellStyles}>{d.ReviewDate}</TableCell>
              <TableCell style={cellStyles}>{d.Score}</TableCell>
              <TableCell style={cellStyles}>{d.Comments}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
      </TableContainer>
      )}
    </Container>
  );
}

export default Employees;
