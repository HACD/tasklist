Feature: User saves a task
  As a user
  I want to save a new task
  So that I can look at it later

  Scenario: User creates a new task
    Given I am creating a new task
    When I mark the task as complete
    And I save the task
    Then It should record the date and time of completion

  @wip
  Scenario: User edits an existing task
    Given I am editing an existing task
    When I mark the task as complete
    And I save the task
    Then It should record the date and time of completion
