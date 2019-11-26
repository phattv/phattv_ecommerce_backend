module.exports = app => {
  app.get('/', (req, res) =>
    res
      .status(200)
      .send(
        'phattv_ecommerce API server, environment: ' + process.env.NODE_ENV,
      ),
  );
};
