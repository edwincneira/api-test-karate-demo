@CrudCountries
Feature: Backoffice Countries Update Scenarios

  Background:
    * def DbUtils = Java.type('com.robinfood.utilities.DbUtils')
    * def random = Java.type('com.robinfood.utilities.RamdomUtils')  
    * def resources = {"path":"#(paths.com.robinfood.or.ram.resources.backoffice.countries)"}
    * def tokenFeature = {"path":"#(CreateTokenFeatureFile)"}
    * def auth = call read(tokenFeature.path+"@Auth") {scope:["#(scopeRam)"]}
    * def authPublic = call read(tokenFeature.path+"@Auth") {scope:"#(scopePublic)"}
    * def config = { "username": "#(username_sql)", "password": "#(password_sql)", "url": "#(url_sql)", "driverClassName": "#(driverClassName_sql)"}
    * def db = new DbUtils(config)
    * def country = callonce read('create.feature@New')
    * def pathService = '/backoffice/countries'
    * def countryId = country.countryId

  @Update
  Scenario: Actualizar un Pais
    * def name = random.ramdomAlphabetic(30)
    * def jsonData = karate.read(resources.path['request.json'].filePath)
    Given header Authorization = auth.authToken
    Given url apiUrl + pathService +'/'+countryId
    And request jsonData
    When method PUT
    And print response
    Then status 200
    And match response.data == '#object'
    And match response.code == 200
    # VALIDAR EN DB
    * def queryExists = db.readRow('SELECT * FROM ram.countries where id='+countryId)
    And match name == queryExists.name

Scenario: Verificar que no se debe permitir crear un pais sin los campos requeridos (name)
    * def name = null
    * def jsonData = karate.read(resources.path['request.json'].filePath)
    Given header Authorization = auth.authToken
    Given url apiUrl + pathService +'/'+countryId
    And request jsonData
    When method PUT
    And print response
    Then status 422
    And match response.error == '#object'
    And match response.code == 422
    And match response.message == 'PARAMETER_NOT_FOUND'

  Scenario: Verificar que no se debe permitir crear un pais si el campo (name) tiene mas de 30 caracteres
    * def name = random.ramdomAlphabetic(31)
    * def jsonData = karate.read(resources.path['request.json'].filePath)
    Given header Authorization = auth.authToken
    Given url apiUrl + pathService+'/'+countryId
    And request jsonData
    When method PUT
    And print response
    Then status 422
    And match response.error == '#object'
    And match response.code == 422
    And match response.message == 'PARAMETER_NOT_FOUND'


  Scenario: Verificar que no se debe permitir crear un pais con token no autorizados o publicos
    * def name = random.ramdomAlphabetic(10)
    * def jsonData = karate.read(resources.path['request.json'].filePath)
    Given header Authorization = authPublic.authToken
    Given url apiUrl + pathService +'/'+countryId
    And request jsonData
    When method PUT
    And print response
    Then status 403
    And match response.error == '#object'
    And match response.code == 403