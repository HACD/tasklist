Feature: sub tasks
  As a user
  I want to view sub tasks
  So that I can fiddle with ... sub...tasks...

  Scenario: User views sub tasks of an existing task
    Given  There is an existing task
    When I view the existing task
    Then I should see a link to its children if they exist
    When I click a sub task
    Then I should see that sub task