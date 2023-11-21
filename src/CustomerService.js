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
  Paper
} from "@mui/material";

function CustomerService() {
  const cellStyles = {
    minWidth: 150,
  };

  const [consultas, setConsultas] = useState([]);
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    fetch('http://localhost:8082/consultas')
      .then(res => res.json())
      .then(data => setConsultas(data))
      .catch(err => console.log(err));

    fetch('http://localhost:8082/orders')
      .then(res => res.json())
      .then(data => setOrders(data))
      .catch(err => console.log(err));
  }, []);

  return (
    <Container>
      <Typography variant="h4" style={{ marginBottom: 20 }}>Customer Service</Typography>

      {/* Consultas Table Title */}
      <Typography variant="h5" style={{ marginBottom: 10 }}>Consultas</Typography>
      <TableContainer component={Paper} style={{ maxHeight: 440, marginBottom: 20 }}>
        <Table stickyHeader aria-label="consultas table">
        <TableHead>
            <TableRow>
              <TableCell style={cellStyles}>Nombre del cliente</TableCell>
              <TableCell style={cellStyles}>Nombre del empleado encargado</TableCell>
              <TableCell style={cellStyles}>Fecha y hora</TableCell>
              <TableCell style={cellStyles}>Motivo</TableCell>
              <TableCell style={cellStyles}>Detalles</TableCell>
              <TableCell style={cellStyles}>Estado</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {consultas.map((consulta, i) => (
              <TableRow key={i}>
                <TableCell style={cellStyles}>{consulta.clientenombre}</TableCell>
                <TableCell style={cellStyles}>{consulta.empleadonombre}</TableCell>
                <TableCell style={cellStyles}>{consulta.fechahora}</TableCell>
                <TableCell style={cellStyles}>{consulta.tipoconsulta}</TableCell>
                <TableCell style={cellStyles}>{consulta.detalle}</TableCell>
                <TableCell style={cellStyles}>{consulta.estado}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>

      {/* Orders Table Title */}
      <Typography variant="h5" style={{ marginBottom: 10 }}>Orders</Typography>
      <TableContainer component={Paper} style={{ maxHeight: 440 }}>
        <Table stickyHeader aria-label="orders table">
        <TableHead>
            <TableRow>
              <TableCell style={cellStyles}>Order ID</TableCell>
              <TableCell style={cellStyles}>Nombre del cliente</TableCell>
              <TableCell style={cellStyles}>Fecha de la orden</TableCell>
              <TableCell style={cellStyles}>Estado del envío</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {orders.map((order, i) => (
              <TableRow key={i}>
                <TableCell style={cellStyles}>{order.orderid}</TableCell>
                <TableCell style={cellStyles}>{order.clientename}</TableCell>
                <TableCell style={cellStyles}>{order.orderdate}</TableCell>
                <TableCell style={cellStyles}>{order.shippingstatus}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </Container>
  );
}

export default CustomerService;

