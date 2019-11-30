const process = require('process');

const localConfigurations = {
  SQL_USER: 'postgres',
  SQL_PASSWORD: '',
  SQL_DATABASE: 'phattv_ecommerce',
};
const productionConfigurations = {
  SQL_USER: 'postgres',
  SQL_PASSWORD: '123123',
  SQL_DATABASE: 'phattv_ecommerce',
};

module.exports =
  process.env.NODE_ENV === 'production'
    ? productionConfigurations
    : localConfigurations;
