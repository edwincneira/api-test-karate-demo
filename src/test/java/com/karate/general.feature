@JoinMethods
Feature: Call all features on this section

  Background:
    * call read("http/get/generate.feature")
    * def Utils = Java.type('com.util.Utils')
    * def util = new Utils()

  @ignore
  Scenario: List Page 2 and match
    * def flagWord = util.contain('Hello World', 'World')
    And print flagWord
    And print suma(1, 3)
