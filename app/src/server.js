const { createServer } = require('node:http');

const handler = (req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('¡Hola Mundo!');
};

const server = createServer(handler);

if (require.main === module) {
  server.listen(3000, '0.0.0.0', () => {
    console.log('Server running...');
  });
}

module.exports = { server, handler }; 