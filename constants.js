const dateFormat = 'YYYY/MM/DD';
const timeFormat = 'HH:mm:ss';

module.exports = {
  dateFormat,
  timeFormat,
  timestampFormat: dateFormat + ' ' + timeFormat,
  tables: {
    listing: 'listing',
  },
  routes: {
    listingsList: '/listings',
  },
};
