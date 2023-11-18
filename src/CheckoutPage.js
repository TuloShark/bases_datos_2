import React from "react";
import { Container, Typography, TextField, Button, Box } from "@mui/material";
import { useNavigate } from "react-router-dom";

const CheckoutPage = () => {
  const navigate = useNavigate();

  return (
    <Container>
      <Typography variant="h4" gutterBottom>
        Proceso de Pago
      </Typography>

      <Box my={2}>
        <Typography variant="h6" gutterBottom>
          Información de Envío
        </Typography>
        <TextField fullWidth margin="normal" label="Nombre completo" />
        <TextField fullWidth margin="normal" label="Dirección" />
        <TextField fullWidth margin="normal" label="Ciudad" />
        <TextField fullWidth margin="normal" label="Provincia/Estado" />
        <TextField fullWidth margin="normal" label="Código Postal" />
      </Box>

      <Button
        variant="contained"
        color="primary"
        onClick={() => {
          navigate("/confirmation");
        }}
      >
        Confirmar Pago
      </Button>
    </Container>
  );
};

export default CheckoutPage;
