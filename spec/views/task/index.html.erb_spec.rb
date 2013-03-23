require 'spec_helper'

describe 'tasks/index.html.erb' do
  before do
    assign(:tasks, [
      stub_model(Task, :name => 'do things'),
      stub_model(Task, :name => 'do stuff')
    ])
    render
  end

  it "should show the list of tasks" do
    rendered.should include 'do stuff'
    rendered.should include 'do things'
  end
end