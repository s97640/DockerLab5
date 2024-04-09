const express = require('express');
const os = require('os');

const app = express();
const port = process.env.PORT || 3000;
const version = process.env.APP_VERSION || '1.0.0';

app.get('/', (req, res) => {
  const serverIp = req.ip;
  const serverHostname = os.hostname();
  res.send(`Adres IP serwera: ${serverIp}\nNazwa serwera: ${serverHostname}\nWersja aplikacji: ${version}`);
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});

