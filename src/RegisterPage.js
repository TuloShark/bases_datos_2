import React, { useState } from "react";
import { Container, Typography, TextField, Box, Button } from "@mui/material";
import { useNavigate } from "react-router-dom";

const RegisterPage = () => {
  const [registerData, setRegisterData] = useState({
    email: "",
    password: "",
    confirmPassword: "",
  });
  const navigate = useNavigate();

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    setRegisterData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    // Aquí puedes agregar la lógica para registrarse, como enviar los datos al servidor
    console.log("Register data submitted: ", registerData);

    // Si el registro es exitoso, redirecciona a la página de inicio de sesión
    navigate("/login");
  };

  return (
    <Container maxWidth="xs">
      <Box my={8}>
        <Typography variant="h4" gutterBottom>
          Registrarse
        </Typography>

        <form onSubmit={handleSubmit}>
          <TextField
            variant="outlined"
            margin="normal"
            required
            fullWidth
            id="email"
            label="Correo Electrónico"
            name="email"
            autoFocus
            value={registerData.email}
            onChange={handleInputChange}
          />
          <TextField
            variant="outlined"
            margin="normal"
            required
            fullWidth
            name="password"
            label="Contraseña"
            type="password"
            id="password"
            value={registerData.password}
            onChange={handleInputChange}
          />
          <TextField
            variant="outlined"
            margin="normal"
            required
            fullWidth
            name="confirmPassword"
            label="Confirmar Contraseña"
            type="password"
            id="confirmPassword"
            value={registerData.confirmPassword}
            onChange={handleInputChange}
          />

          <Box mt={2}>
            <Button type="submit" fullWidth variant="contained" color="primary">
              Registrarse
            </Button>
          </Box>
        </form>
      </Box>
    </Container>
  );
};

export default RegisterPage;
