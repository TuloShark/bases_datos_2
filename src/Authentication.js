// En tu archivo de autenticación (por ejemplo, autenticacion.js)
const sql = require("mssql");

const config = {
  // ... (tu configuración de base de datos)
};

async function autenticarUsuario(email, password) {
  try {
    await sql.connect(config);

    const request = new sql.Request();
    request.input("Email", sql.NVarChar(100), email);
    request.input("Password", sql.NVarChar(100), password);

    const result = await request.execute("sp_AuthenticateUser");

    return result;
  } catch (error) {
    console.error("Error al autenticar el usuario:", error);
    throw error;
  } finally {
    await sql.close();
  }
}

module.exports = { autenticarUsuario };
