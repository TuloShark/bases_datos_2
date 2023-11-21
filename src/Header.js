import React from "react";
import { useNavigate } from "react-router-dom";
import { AppBar, Toolbar, Typography, Badge, IconButton, Tooltip } from "@mui/material";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import PeopleIcon from "@mui/icons-material/People";
import HeadsetMicIcon from '@mui/icons-material/HeadsetMic';

function Header({ cartItems }) {
  const navigate = useNavigate();

  return (
    <AppBar position="static">
      <Toolbar style={{ display: "flex", justifyContent: "space-between" }}>
        <Typography variant="h6">Wander Jimenez Calvo</Typography>

        <div>
          {/* Tooltip for Empleados IconButton */}
          <Tooltip title="Employees">
            <IconButton 
              color="inherit"
              onClick={() => navigate("/employees")}
            >
              <PeopleIcon />
            </IconButton>
          </Tooltip>

          {/* Tooltip for ServicioCliente IconButton */}
          <Tooltip title="Customer Service">
            <IconButton 
              color="inherit"
              onClick={() => navigate("/customerservice")}
            >
              <HeadsetMicIcon />
            </IconButton>
          </Tooltip>

          {/* Tooltip for Shopping Cart IconButton */}
          <Tooltip title="Cart">
            <IconButton
              color="inherit"
              onClick={() => navigate("/cart")}
            >
              <Badge badgeContent={cartItems.length} color="secondary">
                <ShoppingCartIcon />
              </Badge>
            </IconButton>
          </Tooltip>
        </div>
      </Toolbar>
    </AppBar>
  );
}

export default Header;
