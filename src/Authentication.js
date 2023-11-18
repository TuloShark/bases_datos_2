const sql = require("mssql");

const config = {
  user: "sa",
  password: "1234",
  server: "Wander",
  database: "ProyectoBD2",
  options: {
    encrypt: false, // Si estás en un entorno de producción, considera establecerlo en true
    trustServerCertificate: true,
  },
};

async function autenticarUsuario(email, password) {
  try {
    // Establecer la conexión
    await sql.connect(config);

    // Crear un objeto de solicitud
    const request = new sql.Request();

    // Añadir parámetros al procedimiento almacenado
    request.input("Email", sql.NVarChar(100), email);
    request.input("Password", sql.NVarChar(100), password);

    // Ejecutar el procedimiento almacenado
    const result = await request.execute("sp_AuthenticateUser");

    // Imprimir el resultado devuelto por el procedimiento almacenado
    console.log(result);
  } catch (error) {
    console.error("Error al autenticar el usuario:", error);
  } finally {
    // Cerrar la conexión
    await sql.close();
  }
}

// Llamar a la función para autenticar al usuario (proporciona el correo electrónico y la contraseña correctos)
autenticarUsuario("wander.tulo.jimenez@gmail.com", "wanderjose2");
