function handleGetSuccess(res, data) {
  return res
    .status(200)
    .send(data)
    .end();
}

function handleErrors(res, err) {
  console.log('xxx API ERROR!', err.stack);
  res
    .status(500)
    .send({
      error: err,
      message: err.detail || err.stack,
    })
    .end();
}

function handleBadRequest(res, message) {
  return res
    .status(400)
    .send({ error: 'error', message: message || 'Bad Request' });
}

module.exports = {
  handleGetSuccess,
  handleErrors,
  handleBadRequest,
};
