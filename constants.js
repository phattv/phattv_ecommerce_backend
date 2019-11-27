const dateFormat = 'YYYY/MM/DD';
const timeFormat = 'HH:mm:ss';

module.exports = {
  dateFormat,
  timeFormat,
  timestampFormat: dateFormat + ' ' + timeFormat,
  tables: {
    listing: 'listing',
    category: 'category',
    user: 'user',
    photo: 'photo',
  },
  routes: {
    listingsList: '/listings',
    listingsDetails: '/listings/:id',
  },
};
