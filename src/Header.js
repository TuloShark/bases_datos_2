import React from "react";
import { useNavigate } from "react-router-dom";
import { AppBar, Toolbar, Typography, Badge, IconButton } from "@mui/material";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";

function Header({ cartItems }) {
  const navigate = useNavigate();

  return (
    <AppBar position="static">
      <Toolbar style={{ display: "flex", justifyContent: "space-between" }}>
        <Typography variant="h6">Wander Jimenez Calvo</Typography>
        <IconButton
          color="inherit"
          edge="end"
          onClick={() => navigate("/cart")}
        >
          <Badge badgeContent={cartItems.length} color="secondary">
            <ShoppingCartIcon />
          </Badge>
        </IconButton>
      </Toolbar>
    </AppBar>
  );
}

export default Header;
