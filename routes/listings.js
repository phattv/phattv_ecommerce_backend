const { routes, tables } = require('../constants');
const { handleGetSuccess, handleErrors } = require('./utils');

const configListingsApis = (app, knex) => {
  app.get(routes.listingsList, (req, res, next) => {
    // TODO: pagination
    return knex
      .select()
      .from(tables.listing)
      .then(data => handleGetSuccess(res, data))
      .catch(err => handleErrors(res, err));
  });
};

module.exports = { configListingsApis };
