const { handler } = require('../server');
const httpMocks = require('node-mocks-http');

test('handler returns ¡Hola Mundo!', () => {
  const req = httpMocks.createRequest();
  const res = httpMocks.createResponse();

  handler(req, res);

  expect(res.statusCode).toBe(200);
  expect(res._getData()).toBe('¡Hola Mundo!');
});