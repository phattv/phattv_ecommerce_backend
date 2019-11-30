const Knex = require('knex');
const psqlConfigs = require('./config');
const knex = connect();

const { configListingsApis } = require('./routes/listings');

function connect() {
  const isProduction = process.env.NODE_ENV === 'production';
  const config = {
    user: process.env.SQL_USER || psqlConfigs.SQL_USER,
    password: process.env.SQL_PASSWORD || psqlConfigs.SQL_PASSWORD,
    database: process.env.SQL_DATABASE || psqlConfigs.SQL_DATABASE,
    host: isProduction ? '10.148.0.3' : '127.0.0.1',
  };

  // Connect to the database
  return Knex({
    client: 'pg',
    connection: config,
    debug: !isProduction,
  });
}
module.exports = app => {
  app.get('/', (req, res) =>
    res
      .status(200)
      .send(
        'phattv_ecommerce API server, environment: ' + process.env.NODE_ENV,
      ),
  );

  configListingsApis(app, knex);
};
