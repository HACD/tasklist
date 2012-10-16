Feature: Completing tasks
  As a user
  I want to mark tasks as complete
  So I can see the progress made on tasks

  @wip
  Scenario: User marks a task as complete
    Given There are the following existing tasks:
      | name  | description            | parent | done |
      | task1 | This is the first one  | nil    | no   |
      | task2 | This is the second one | task1  | no   |
    When I mark "task1" as complete
    Then "task1" is marked as complete
    And "task2" is marked as complete

  @wip
  Scenario: User marks a task as incomplete
    Given There are the following existing tasks:
      | name  | description           | parent | done |
      | task1 | This is the first one | nil    | yes  |
      | task2 | This is the first one | task1  | yes  |
    When I mark "task1" as incomplete
    Then "task1" is marked as incomplete
    And "task2" is marked as incomplete
