function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    var PathUtils = Java.type('com.robinfood.utilities.PathUtils');
    var pathTree = new PathUtils();

    if (!env) {
        env = 'dev';
    }
    var config = {
        pathBase: 'classpath:com/karate',
        apiUrl:
            'https://feature-TCRF-227-ram-or-paises.ram-or.muydev.com/api/v1',
        apiUrlSsoAuthenticator:
            'https://a06siqgrqd.execute-api.us-east-2.amazonaws.com/v1',
        env: env,
        paths: pathTree.get()
    };

    if (env == 'dev') {
        //SQL Config
        config.username_sql = '############';
        config.password_sql = '############';
        config.url_sql = 'server';
        config.driverClassName_sql = 'com.mysql.jdbc.Driver';
        //SSO Authenticator
        config.authToken ='##############';
        config.scopeRam = 'ram_or';
        config.scopePublic = 'public';
        config.scopeLogin = 'login';
    }

    config.CreateTokenFeatureFile = config.paths.com.robinfood.or.ram.features.sso['CreateToken.feature'].filePath
    config.storeConfigurationFeatures = config.paths.com.robinfood.or.ram.features.backoffice.storeconfiguration
    return config;
}
