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

module.exports = {
  handleGetSuccess,
  handleErrors,
};
