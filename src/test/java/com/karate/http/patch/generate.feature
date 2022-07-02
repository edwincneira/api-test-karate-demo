@PatchFeature

Feature: Update one user with method patch

  Background:
    Given url apiUrl
    * def pathUserDelete = '/api/users/2'
    * def requestJSON = read('com/karate/resources/patch/request.json')

  @PatchUpdateUser
  Scenario: Delete User 2
    Given path pathUserDelete
    And request requestJSON
    When method PATCH
    And print response
    Then status 200