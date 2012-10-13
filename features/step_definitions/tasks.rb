Given /^I am on the task creation page$/ do
  visit new_task_path
end

When /^I mark the task as complete$/ do
  check "Complete"
end

When /^I save the task$/ do
  click_button "Create Task"
end

Then /^It should record the date and time of completion$/ do
  Task.last.completed.should_not be_nil
end
