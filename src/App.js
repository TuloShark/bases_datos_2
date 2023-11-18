import React, { useState } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { CssBaseline, Container } from "@mui/material";
import ProductsPage from "./ProductsPage";
import ProductDetailsPage from "./ProductDetailsPage";
import CartPage from "./CartPage";
import Header from "./Header";
import CheckoutPage from "./CheckoutPage";
import ConfirmationPage from "./ConfirmationPage";
import LoginPage from "./LoginPage";
import RegisterPage from "./RegisterPage";

function App() {
  const [cartItems, setCartItems] = useState([]);

  const addToCart = (product) => {
    setCartItems((prevItems) => {
      const existingItem = prevItems.find((item) => item.id === product.id);

      if (existingItem) {
        return prevItems.map((item) =>
          item.id === product.id
            ? { ...item, quantity: item.quantity + 1 }
            : item
        );
      } else {
        return [...prevItems, { ...product, quantity: 1 }];
      }
    });
  };

  const removeFromCart = (productId) => {
    setCartItems((prevItems) =>
      prevItems.filter((item) => item.id !== productId)
    );
  };

  return (
    <Router>
      <div className="App">
        <CssBaseline />
        <Header cartItems={cartItems} />
        <Container style={{ marginTop: "2rem" }}>
          <Routes>
            <Route path="/login" element={<LoginPage />} />
            <Route
              path="/products"
              element={<ProductsPage addToCart={addToCart} />}
            />
            <Route
              path="/product/:id"
              element={<ProductDetailsPage addToCart={addToCart} />}
            />
            <Route
              path="/cart"
              element={
                <CartPage
                  cartItems={cartItems}
                  removeFromCart={removeFromCart}
                />
              }
            />
            <Route path="/checkout" element={<CheckoutPage />} />
            <Route
              path="/confirmation"
              element={<ConfirmationPage cartItems={cartItems} />}
            />
            <Route path="/" element={<LoginPage />} />
            <Route path="/register" element={<RegisterPage />} />
          </Routes>
        </Container>
      </div>
    </Router>
  );
}

export default App;
