import React from "react";
import {
  Container,
  Typography,
  List,
  ListItem,
  ListItemText,
  ListItemAvatar,
  Avatar,
  IconButton,
  Button,
  Box,
} from "@mui/material";
import DeleteIcon from "@mui/icons-material/Delete";
import { useNavigate } from "react-router-dom";

const CartPage = ({ cartItems, removeFromCart }) => {
  const navigate = useNavigate();

  return (
    <Container>
      <Box
        display="flex"
        justifyContent="space-between"
        alignItems="center"
        marginBottom="1rem"
      >
        <Typography variant="h4">Carrito de Compras</Typography>
        <Button
          variant="contained"
          color="primary"
          onClick={() => navigate("/")}
        >
          Regresar a Productos
        </Button>
        <Button
          variant="contained"
          color="primary"
          onClick={() => navigate("/checkout")}
        >
          Procesar
        </Button>
      </Box>
      <List>
        {cartItems.map((item) => (
          <ListItem key={item.id}>
            <ListItemAvatar>
              <Avatar src={item.imageUrl} />
            </ListItemAvatar>
            <ListItemText
              primary={item.name}
              secondary={`Descripción: ${item.description}`}
            />
            <IconButton
              edge="end"
              aria-label="delete"
              onClick={() => removeFromCart(item.id)}
            >
              <DeleteIcon />
            </IconButton>
          </ListItem>
        ))}
      </List>
    </Container>
  );
};

export default CartPage;
