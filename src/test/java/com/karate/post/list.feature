@CrudCountries
Feature: Backoffice Countries List Scenarios

  Background:
    * def tokenFeature = {"path":"#(CreateTokenFeatureFile)"}
    * def auth = call read(tokenFeature.path+"@Auth") {scope:["#(scopeRam)"]}
    * def authPublic = call read(tokenFeature.path+"@Auth") {scope:"#(scopePublic)"}
    * def auth = callonce read(tokenFeature.path+"@Auth") {scope:["#(scopeRam)"]}
    * def pathService = '/backoffice/countries'


  @GetOne
  Scenario: Consultar pais por id
    Given header Authorization = auth.authToken
    Given url apiUrl + pathService + '/1'
    When method GET
    Then status 200
    And match response.data == '#object'


  @GetAll
  Scenario: Consultar todas los paises
    Given header Authorization = auth.authToken
    Given url apiUrl + pathService + '?currentPage=1&perPage=50'
    When method GET
    And print response
    Then status 200
    And match response.data.items == '#array'
    * def Environments = response.data.items


  Scenario: Verificar que no se permita consultar un pais por un id que no existe
    * def countryId = 99999
    Given header Authorization = auth.authToken
    Given url apiUrl + pathService +'/'+countryId
    When method GET
    And print response
    Then status 400
    And match response.error == '#object'
    And match response.error.type == 'ENTITY_NOT_FOUND'