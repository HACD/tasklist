Given /^I am creating a new task$/ do
  visit new_task_path
end

Given /^I am editing an existing task$/ do
  task = Task.create(
    name: "Existing Task",
    description: "This is a test task"
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

Given /^There is an existing task$/ do
  task = Task.create(
      name: "Existing Task",
      description: "This is a test task"
  )
  child = Task.new(
       name: "child task",
       description: "child task"
   )
  child.parent = task
  child.save
end

When /^I view the existing task$/ do
  visit task_path Task.find_by_name "Existing Task"
end

Then /^I should see a link to its children if they exist$/ do
  page.should have_selector("li")
end

When /^I click a sub task$/ do
  click_link "child task"
end

Then /^I should see that sub task$/ do
  page.should have_content("child task")
end