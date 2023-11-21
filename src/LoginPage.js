import React, { useState } from "react";
import { Container, Typography, TextField, Button, Box } from "@mui/material";
import { useNavigate } from "react-router-dom";

const LoginPage = () => {
  const navigate = useNavigate();

  const [credentials, setCredentials] = useState({
    email: "",
    password: "",
  });

  const handleChange = (e) => {
    setCredentials({
      ...credentials,
      [e.target.name]: e.target.value,
    });
  };

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch("/api/auth", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(credentials),
      });

      const data = await response.json();

      if (response.ok) {
        console.log("Autenticación exitosa:", data.resultado);
        navigate("/products");
      } else {
        console.log("Error de autenticación:", data.error);
      }
    } catch (error) {
      console.error("Error en la solicitud:", error);
    }
  };

  const goToRegister = () => {
    navigate("/register");
  };

  return (
    <Container>
      <Typography variant="h4" gutterBottom>
        Inicio de Sesión
      </Typography>
      <Box mt={3}>
        <form onSubmit={handleLogin}>
          <TextField
            fullWidth
            label="Correo Electrónico"
            variant="outlined"
            name="email"
            value={credentials.email}
            onChange={handleChange}
            margin="normal"
          />
          <TextField
            fullWidth
            type="password"
            label="Contraseña"
            variant="outlined"
            name="password"
            value={credentials.password}
            onChange={handleChange}
            margin="normal"
          />
          <Box mt={2} display="flex" justifyContent="space-between">
            <Button
              type="submit"
              variant="contained"
              color="primary"
              style={{ width: "48%" }}
            >
              Iniciar Sesión
            </Button>
            <Button
              variant="contained"
              color="primary"
              style={{ width: "48%" }}
              onClick={goToRegister}
            >
              Registrarse
            </Button>
          </Box>
        </form>
      </Box>
    </Container>
  );
};

export default LoginPage;
