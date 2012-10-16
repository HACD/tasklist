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
  Task.last(order: "updated_at").completed_at.should_not be_nil
end

Given /^There is an existing task$/ do
  task = Task.create(
    name: "Existing Task",
    description: "This is a test task"
  )
end

Given /^There are the following existing tasks:$/ do |table|
  tasks = {}
  table.hashes.each do |hash|
    tasks[hash["name"]] = Task.create(name: hash["name"], description: hash["description"])
  end
  table.hashes.each do |hash|
    tasks[hash["name"]].parent = tasks[hash["parent"]] ? tasks[hash["parent"]] : nil
    tasks[hash["name"]].save
  end
end

When /^I view the task with name "([^"]*)"$/ do |name|
  visit task_path Task.find_by_name name
end

Then /^I should see a link to its children if they exist$/ do
  page.should have_selector "li"
end

When /^I click its sub task with name "([^"]*)"$/ do |name|
  click_link name
end

Then /^I should see the sub task with name "([^"]*)"$/ do |name|
  page.should have_content name
end
