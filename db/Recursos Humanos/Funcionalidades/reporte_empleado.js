//reporte de empleado tomando en cuenta filtros (opcionales viendo el poco tiempo que nos queda) pero en general sería, ID, nombre, país, rol, rangos de fecha y salario.

function getEmployeeReports({ startDate, endDate, countryId, roleId }, callback) {
  let query = `
    SELECT 
      e.empleadoId,
      e.nombre,
      p.nombrePais,
      r.nombreRol,
      il.fechaInicio,
      il.salario
    FROM 
      InfoPersonal e
      JOIN InfoLaboral il ON e.empleadoId = il.empleadoId
      JOIN Paises p ON il.paisId = p.paisId
      JOIN Roles r ON il.rolId = r.rolId
  `;

  let conditions = [];
  let params = [];

  if (startDate && endDate) {
    conditions.push("il.fechaInicio BETWEEN ? AND ?");
    params.push(startDate, endDate);
  }

  if (countryId) {
    conditions.push("il.paisId = ?");
    params.push(countryId);
  }

  if (roleId) {
    conditions.push("il.rolId = ?");
    params.push(roleId);
  }

  if (conditions.length) {
    query += " WHERE " + conditions.join(" AND ");
  }

  connection.query(query, params, (error, results) => {
    if (error) return callback(error, null);
    callback(null, results);
  });
}
