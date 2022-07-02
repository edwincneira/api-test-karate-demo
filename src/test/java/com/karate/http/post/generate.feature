@PostCreateUser
Feature: Create Users with method Post

  Background:
    Given url apiUrl
    * def pathListUsers = '/api/users'
    * def pathRegisterUser = '/api/register'
    * def pathLoginUser = '/api/login'
    * def requestJSON = read('com/karate/resources/post/request.json')

  @Create
  Scenario: Create User
    Given path pathListUsers
    And request requestJSON
    When method POST
    And print response
    Then status 201

  @Register
  Scenario: Register one User
    Given path pathRegisterUser
    And request
    """
      {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka"
      }
    """
    When method POST
    And print response
    Then status 200

  @NotRegister
  Scenario: Not register User
    Given path pathRegisterUser
    And request
    """
      {
        "email": "sydney@fife"
      }
    """
    When method POST
    And print response
    Then status 400

  @Login
  Scenario: Login User
    * def jsonLogin = { "email": "eve.holt@reqres.in", "password": "cityslicka" }
    Given path pathLoginUser
    And request jsonLogin
    When method POST
    And print response
    Then status 200

  @NotLogin
  Scenario: Not Login User
    * def jsonLogin = { "email": "eve.holt@reqres.in" }
    Given path pathLoginUser
    And request jsonLogin
    When method POST
    And print response
    Then status 400
