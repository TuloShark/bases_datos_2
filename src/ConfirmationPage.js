import React from "react";
import {
  Container,
  Typography,
  Box,
  List,
  ListItem,
  ListItemText,
} from "@mui/material";

const ConfirmationPage = ({ cartItems }) => {
  return (
    <Container>
      <Typography variant="h4" gutterBottom align="center">
        ¡Gracias por tu compra!
      </Typography>

      <Box my={3} textAlign="center">
        <Typography variant="h6" gutterBottom>
          Resumen de la Orden
        </Typography>

        <List>
          {cartItems.map((item) => (
            <ListItem key={item.id}>
              <ListItemText
                primary={item.name}
                secondary={`Cantidad: ${item.quantity}`}
              />
            </ListItem>
          ))}
        </List>

        <Typography
          variant="subtitle1"
          gutterBottom
          style={{ marginTop: "1rem" }}
        >
          Tu pedido está siendo procesado y será enviado pronto. Te enviaremos
          un email con los detalles de tu compra.
        </Typography>
      </Box>

      <Box textAlign="center">
        <Typography variant="body2" color="textSecondary">
          Si tienes alguna pregunta sobre tu orden, no dudes en contactarnos.
        </Typography>
      </Box>
    </Container>
  );
};

export default ConfirmationPage;
