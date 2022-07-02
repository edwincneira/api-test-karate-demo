@PostUpdateUser
Feature: Update Users with method Post

  Background:
    Given url apiUrl
    * def pathListUserUpdate = '/api/users/2'
    * def requestJSON = read('com/karate/resources/put/request.json')

  @UpdateInfo
  Scenario: Update User info
    Given path pathListUserUpdate
    And request requestJSON
    When method PUT
    And print response
    Then status 200
