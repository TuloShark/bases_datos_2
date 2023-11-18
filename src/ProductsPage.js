import React, { useState } from "react";
import {
  Container,
  Typography,
  TextField,
  Card,
  CardContent,
  Grid,
  Button,
  Box,
} from "@mui/material";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";

const ProductsPage = () => {
  const navigate = useNavigate();

  const [searchTerm, setSearchTerm] = useState("");

  const [products, setProducts] = useState([]);

  const allProducts = [
    {
      id: 1,
      name: "Computadora Portátil",
      description: "Laptop con procesador i7 y 16GB RAM.",
    },
    {
      id: 2,
      name: "Teléfono Móvil",
      description: "Smartphone de 6 pulgadas, cámara de 20MP.",
    },
    {
      id: 3,
      name: "Audífonos Bluetooth",
      description: "Audífonos inalámbricos con cancelación de ruido.",
    },
    {
      id: 4,
      name: "Reloj Inteligente",
      description: "Con monitor de ritmo cardíaco y GPS integrado.",
    },
  ];

  const handleSearch = () => {
    if (searchTerm.trim() === "") {
      setProducts(allProducts);
    } else {
      const filteredProducts = allProducts.filter((product) =>
        product.name.toLowerCase().includes(searchTerm.toLowerCase())
      );
      setProducts(filteredProducts);
    }
  };

  return (
    <Container>
      <Typography variant="h4" gutterBottom>
        Búsqueda de Productos
      </Typography>

      <Box mt={5} mb={3} display="flex" justifyContent="space-between">
        <TextField
          label="Buscar producto..."
          variant="outlined"
          fullWidth
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          style={{ marginRight: "1rem" }}
          margin="normal"
        />

        <Button
          variant="contained"
          color="primary"
          style={{ marginRight: "10px" }}
          onClick={() => navigate("/login")}
        >
          Volver
        </Button>

        <Button
          variant="contained"
          color="primary"
          style={{ marginRight: "10px" }}
          onClick={handleSearch}
        >
          Buscar
        </Button>
      </Box>

      <Grid container spacing={3}>
        {products.map((product) => (
          <Grid item xs={12} sm={6} md={4} lg={3} key={product.id}>
            <Link
              to={`/product/${product.id}`}
              style={{ textDecoration: "none" }}
            >
              <Card>
                <CardContent>
                  <Typography variant="h6" gutterBottom>
                    {product.name}
                  </Typography>

                  <Typography>{product.description}</Typography>
                </CardContent>
              </Card>
            </Link>
          </Grid>
        ))}
      </Grid>
    </Container>
  );
};

export default ProductsPage;
