@DeleteFeature

Feature: Delete one user with method delete

  Background:
    Given url apiUrl
    * def pathUserDelete = '/api/users/2'

  @DeleteUser
  Scenario: Delete User 2
    Given path pathUserDelete
    When method DELETE
    And print response
    Then status 204