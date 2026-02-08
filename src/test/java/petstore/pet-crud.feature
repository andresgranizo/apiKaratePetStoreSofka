@petstore
Feature: PetStore API CRUD Operations
  As an API user
  I want to manage pets in the store
  So that I can add, query, update and search pets

  Background:
    * url baseUrl
    * def petId = Math.floor(Math.random() * 1000000)

  @add-pet
  Scenario: Add a new pet to the store
    Given path '/pet'
    And request
      """
      {
        "id": #(petId),
        "name": "Firulais",
        "category": {
          "id": 1,
          "name": "Dogs"
        },
        "photoUrls": ["https://example.com/photo.jpg"],
        "tags": [
          {
            "id": 1,
            "name": "friendly"
          }
        ],
        "status": "available"
      }
      """
    And header Content-Type = 'application/json'
    When method POST
    Then status 200
    And match response.id == petId
    And match response.name == 'Firulais'
    And match response.status == 'available'
    * karate.set('createdPetId', response.id)

  @get-pet-by-id
  Scenario: Get pet by ID
    * def newPetId = Math.floor(Math.random() * 1000000)
    Given path '/pet'
    And request
      """
      {
        "id": #(newPetId),
        "name": "Max",
        "category": {
          "id": 1,
          "name": "Dogs"
        },
        "photoUrls": ["https://example.com/max.jpg"],
        "tags": [
          {
            "id": 1,
            "name": "playful"
          }
        ],
        "status": "available"
      }
      """
    And header Content-Type = 'application/json'
    When method POST
    Then status 200

    Given path '/pet', newPetId
    When method GET
    Then status 200
    And match response.id == newPetId
    And match response.name == 'Max'

  @update-pet
  Scenario: Update pet name and status to sold
    * def updatePetId = Math.floor(Math.random() * 1000000)
    Given path '/pet'
    And request
      """
      {
        "id": #(updatePetId),
        "name": "Luna",
        "category": {
          "id": 2,
          "name": "Cats"
        },
        "photoUrls": ["https://example.com/luna.jpg"],
        "tags": [
          {
            "id": 2,
            "name": "calm"
          }
        ],
        "status": "available"
      }
      """
    And header Content-Type = 'application/json'
    When method POST
    Then status 200

    Given path '/pet'
    And request
      """
      {
        "id": #(updatePetId),
        "name": "Luna Updated",
        "category": {
          "id": 2,
          "name": "Cats"
        },
        "photoUrls": ["https://example.com/luna.jpg"],
        "tags": [
          {
            "id": 2,
            "name": "calm"
          }
        ],
        "status": "sold"
      }
      """
    And header Content-Type = 'application/json'
    When method PUT
    Then status 200
    And match response.name == 'Luna Updated'
    And match response.status == 'sold'

  @find-by-status
  Scenario: Find pets by status sold
    * def statusPetId = Math.floor(Math.random() * 1000000)
    Given path '/pet'
    And request
      """
      {
        "id": #(statusPetId),
        "name": "Toby",
        "category": {
          "id": 1,
          "name": "Dogs"
        },
        "photoUrls": ["https://example.com/toby.jpg"],
        "tags": [
          {
            "id": 3,
            "name": "sold-pet"
          }
        ],
        "status": "sold"
      }
      """
    And header Content-Type = 'application/json'
    When method POST
    Then status 200

    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method GET
    Then status 200
    And match response == '#array'
    And match each response contains { status: 'sold' }
