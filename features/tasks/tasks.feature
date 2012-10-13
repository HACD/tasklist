Feature: User saves a task
  As a user
  I want to save a new task
  So that I can look at it later

  Scenario: User creates a new task
    Given I am on the task creation page
    When I mark the task as complete
    And I save the task
    Then It should record the date and time of completion
