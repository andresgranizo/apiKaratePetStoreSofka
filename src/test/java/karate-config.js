function fn() {
  var config = {
    baseUrl: 'https://petstore.swagger.io/v2'
  };

  var env = karate.env;
  karate.log('karate.env system property:', env);

  if (env == 'dev') {
    config.baseUrl = 'https://petstore.swagger.io/v2';
  } else if (env == 'qa') {
    config.baseUrl = 'https://petstore.swagger.io/v2';
  }

  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);

  return config;
}
