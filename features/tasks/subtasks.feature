Feature: sub tasks
  As a user
  I want to view sub tasks
  So that I can fiddle with ... sub...tasks...

  Scenario: User views sub tasks of an existing task
    Given  There are the following existing tasks:
      | name  | description           | parent |
      | task1 | This is the first one | nil    |
      | task2 | This is the first one | task1  |
    When I view the task with name "task1"
    Then I should see a link to its children if they exist
    When I click its sub task with name "task2"
    Then I should see the sub task with name "task2"
