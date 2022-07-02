@GetMethodForApiTesting
Feature: Create registers for method get

  Background:
    Given url apiUrl
    * def pathListUsers = '/api/users?page=2'
    * def pathSingleUsers = '/api/users/2'
    * def pathListUsersNotFound = '/api/users/23'
    * def pathListResource = '/api/unknown'
    * def pathSingleResource = '/api/unknown/2'
    * def pathSingleNotFoundResource = '/api/unknown/23'
    * def pathDelayedResponse = '/api/users?delay=3'
    * configure retry = { count: 10, interval: 3000 }

  @GetPageTwo
  Scenario: List Page 2 and match
    Given path pathListUsers
    When method GET
    And print response
    Then status 200
    And match response.data == '#array'
    And match response.page == '#number'

  @GetUserTwo
  Scenario: Single Users of path 2
    Given path pathSingleUsers
    When method GET
    And print response
    Then status 200

  @GetUserNotFound
  Scenario: Page not found
    Given path pathListUsersNotFound
    When method GET
    And print response
    Then status 404

  @GetListResource
  Scenario: Get the list resource
    Given path pathListResource
    When method GET
    And print response
    Then status 200

  @GetSingleResource
  Scenario: Get single resource
    Given path pathSingleResource
    When method GET
    And print response
    Then status 200

  @GetSingleNotFoundResource
  Scenario: Get single not found resource
    Given path pathSingleNotFoundResource
    When method GET
    And print response
    Then status 404

  @GetDelayed
  Scenario: Get delayed
    Given path pathDelayedResponse
    When method GET
    And print response
    Then status 200

