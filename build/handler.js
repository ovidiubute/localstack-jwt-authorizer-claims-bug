exports.main = async (event, context) => {
  const jwt = event.requestContext.authorizer.jwt;

  // Return a response
  return {
    statusCode: 200,
    body: "Decoded JWT: " + JSON.stringify(jwt),
  };
};
