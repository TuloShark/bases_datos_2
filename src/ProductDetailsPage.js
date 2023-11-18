import React from "react";
import { useParams } from "react-router-dom";
import {
  Container,
  Typography,
  Card,
  CardMedia,
  CardContent,
  Button,
} from "@mui/material";
import { useNavigate } from "react-router-dom";

const allProducts = [
  {
    id: 1,
    name: "Computadora Portátil",
    description: "Laptop con procesador i7 y 16GB RAM.",
    imageUrl: "/Imagenes/LaptopPrueba.webp",
  },
  {
    id: 2,
    name: "Teléfono Móvil",
    description: "Smartphone de 6 pulgadas, cámara de 20MP.",
    imageUrl: "/Imagenes/IphonePrueba.webp",
  },
  {
    id: 3,
    name: "Audífonos Bluetooth",
    description: "Audífonos inalámbricos con cancelación de ruido.",
    imageUrl: "/Imagenes/AirpodsPrueba.webp",
  },
  {
    id: 4,
    name: "Reloj Inteligente",
    description: "Con monitor de ritmo cardíaco y GPS integrado.",
    imageUrl: "/Imagenes/RelojPrueba.webp",
  },
];

const ProductDetailsPage = ({ addToCart }) => {
  const { id } = useParams();
  const navigate = useNavigate();

  const product = allProducts.find((prod) => prod.id === parseInt(id));

  if (!product) {
    return <Typography variant="h4">Producto no encontrado</Typography>;
  }

  return (
    <Container>
      <Card
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
        }}
      >
        <CardMedia
          component="img"
          alt={product.name}
          style={{ width: "250px", height: "250px", objectFit: "contain" }}
          image={product.imageUrl}
          title={product.name}
        />
        <CardContent>
          <Typography variant="h4" gutterBottom>
            {product.name}
          </Typography>
          <Typography variant="body1" paragraph>
            {product.description}
          </Typography>
          <Button
            variant="contained"
            color="primary"
            style={{ margin: "10px" }}
            onClick={() => navigate("/")}
          >
            Regresar
          </Button>
          <Button
            variant="contained"
            color="primary"
            style={{ margin: "10px" }}
            onClick={() => addToCart(product)}
          >
            Añadir al carrito
          </Button>
        </CardContent>
      </Card>
    </Container>
  );
};

export default ProductDetailsPage;
