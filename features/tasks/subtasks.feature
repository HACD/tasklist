Feature: Sub tasks
  As a user
  I want my tasks to have sub tasks
  So that I can drill down into the details of a task

  Scenario: User views sub tasks of an existing task
    Given There are the following existing tasks:
      | name  | description           | parent |
      | task1 | This is the first one | nil    |
      | task2 | This is the first one | task1  |
    When I view the task with name "task1"
    Then I should see a link to its children if they exist
    When I click its sub task with name "task2"
    Then I should see the sub task with name "task2"

  @wip
  Scenario: User creates a subtask of an existing task
    Given There are the following existing tasks:
      | name  | description           | parent |
      | task1 | This is the first one | nil    |
    When I create a subtask of "task1"
    Then "task1" should have 1 child

  @wip
  Scenario: User deletes a task with subtasks
    Given There are the following existing tasks:
      | name  | description           | parent |
      | task1 | This is the first one | nil    |
      | task2 | This is the first one | task1  |
    When I delete "task1"
    Then "task2" should not be deleted
