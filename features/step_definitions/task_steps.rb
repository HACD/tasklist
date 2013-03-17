Given(/^there are no tasks in the system$/) do
  Task.delete_all
end

When(/^I add a task$/) do
  visit new_task_path
  fill_in 'Name', :with => 'name'
  fill_in 'Description', :with => 'description'
  click_button 'Create Task'
end

Then(/^there is (\d+) task in the system$/) do | count |
  Task.count.should == count.to_i
end