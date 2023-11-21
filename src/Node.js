// En tu servidor Node.js (backend)
const express = require("express");
const router = express.Router();

// Importa la función de autenticación
const {
  autenticarUsuario,
} = require("C:UserswandeOneDriveEscritorioproyecto-bases-2srcAuthentication.js");

// Ruta para autenticar usuario
router.post("/auth", async (req, res) => {
  const { email, password } = req.body;

  try {
    const resultado = await autenticarUsuario(email, password);

    // Envia el resultado como respuesta al frontend
    res.json({ resultado });
  } catch (error) {
    // Maneja los errores
    console.error(error);
    res.status(500).json({ error: "Error en la autenticación" });
  }
});

module.exports = router;
