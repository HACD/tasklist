Feature: Task CRUD
  As a user
  I want to add tasks
  So that I can improve my productivity

  Scenario: Add a task
    Given there are no tasks in the system
    When I add a task
    Then there is 1 task in the system