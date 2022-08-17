@JoinMethods
Feature: Call all features on this section

  Background:
    * call read("http/get/generate.feature")
    * def Utils = Java.type('com.util.Utils')
    * def Http = Java.type('com.util.Http')
    * def util = new Utils()
    * def http = new Http()

  @ignore
  Scenario: List Page 2 and match
    * def flagWord = util.contain('Hello World', 'World')
    And print flagWord
    And print suma(1, 3)

  @MeJavaLibrary
  Scenario: List Page 2 and match
    * json response = http.get("https://reqres.in/api/login")
    And print response

