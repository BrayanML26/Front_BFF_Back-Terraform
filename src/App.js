import React, { useState, useEffect } from "react";
import { Container, TextField, Button, Typography, Box, Alert, List, ListItem, ListItemText } from "@mui/material";

const App = () => {
  const [message, setMessage] = useState("");
  const [messages, setMessages] = useState([]);
  const [response, setResponse] = useState("");
  const [error, setError] = useState("");

  useEffect(() => {
    fetch("/messages.json")
      .then((response) => response.json())
      .then((data) => setMessages(data.messages))
      .catch((error) => console.error("Error loading messages:", error));
  }, []);

  const sendMessage = () => {
    const newMessage = { id: messages.length + 1, content: message };
    setMessages([...messages, newMessage]);
    setResponse("Message received");
    setError("");
  };

  return (
    <Container maxWidth="sm">
      <Box my={4}>
        <Typography variant="h4" component="h1" gutterBottom>
          Send a Message
        </Typography>
        <TextField
          label="Message"
          multiline
          rows={4}
          variant="outlined"
          fullWidth
          value={message}
          onChange={(e) => setMessage(e.target.value)}
        />
        <Box mt={2}>
          <Button variant="contained" color="primary" onClick={sendMessage}>
            Send
          </Button>
        </Box>
        {response && (
          <Box mt={2}>
            <Alert severity="success">{response}</Alert>
          </Box>
        )}
        {error && (
          <Box mt={2}>
            <Alert severity="error">{error}</Alert>
          </Box>
        )}
        <Box mt={4}>
          <Typography variant="h5" component="h2" gutterBottom>
            Messages
          </Typography>
          <List>
            {messages.map((msg) => (
              <ListItem key={msg.id}>
                <ListItemText primary={msg.content} />
              </ListItem>
            ))}
          </List>
        </Box>
      </Box>
    </Container>
  );
};

export default App;
