Given /^I am creating a new task$/ do
  visit new_task_path
end

Given /^I am editing an existing task$/ do
  task = Task.create(
    name: "Existing Task",
    description: "This is a test task",
  )
  visit edit_task_path task
end

When /^I mark the task as complete$/ do
  check "Complete"
end

When /^I save the task$/ do
  click_button "Save"
end

Then /^It should record the date and time of completion$/ do
  Task.last(order: "updated_at").completed.should_not be_nil
end
