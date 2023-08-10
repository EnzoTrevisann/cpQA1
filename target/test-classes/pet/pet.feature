    #Author: Enzo Trevisan Dos Santos

    @tag
Feature: Everything about your Pets
    Descrição da feature

    @tag1
  Scenario: Finds Pets by status
    Given url UrlBase
    And path 'findByStatus'
    And param status = 'available'
    When method GET
    Then status 200
    And match response[0].name contains 'fish'

    @tag2
  Scenario: Finds Pets by id
    Given url UrlBase
    And path '-123'
    And param status = 'available'
    When method GET
    Then status 404
    And match response.message == null

    @tag3
  Scenario: Add a new pet to the store
    Given url UrlBase
    And path 'pet'
    And request {"id": 0,"category": {"id": 0,"name": "string"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
    When method POST
    Then status 200
    And match response.name == 'doggie'


      @tag4
    Scenario: Add a new pet to the store
      Given url UrlBase
      And path 'pet'
      And request {"id": 0,"category": {"id": 0,"name": "string"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
      When method GET
      Then status 405