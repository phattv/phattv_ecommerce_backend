const { routes, tables } = require('../constants');
const { handleGetSuccess, handleErrors } = require('./utils');

const configListingsApis = (app, knex) => {
  function generateCategoryQuery(category_id) {
    return knex
      .select()
      .from(tables.category)
      .where({ id: category_id })
      .first();
  }

  function generateUserQuery(user_id) {
    return knex
      .select()
      .from(tables.user)
      .where({ id: user_id })
      .first();
  }

  function generatePhotoQuery(listing_id) {
    return knex
      .select('image_url')
      .from(tables.photo)
      .where({ listing_id: listing_id });
  }

  app.get(routes.listingsList, (req, res, next) => {
    // TODO: pagination
    return knex
      .select()
      .from(tables.listing)
      .then(data => {
        promises = [];
        data.map(async record => {
          promises.push(
            new Promise((resolve, reject) => {
              let categoryQuery, userQuery;
              if (record.category_id !== '') {
                categoryQuery = generateCategoryQuery(record.category_id);
              }

              if (record.seller_id !== '') {
                userQuery = generateUserQuery(record.seller_id);
              }

              Promise.all([categoryQuery, userQuery])
                .then(mergedData => {
                  record.category = mergedData[0];
                  delete record.category_id;
                  record.seller = mergedData[1];
                  delete record.seller_id;

                  resolve(record);
                })
                .catch(err => reject(err));
            }),
          );
        });

        Promise.all(promises)
          .then(() => handleGetSuccess(res, data))
          .catch(() => handleErrors(res, err));
      })
      .catch(err => handleErrors(res, err));
  });
};

module.exports = { configListingsApis };
