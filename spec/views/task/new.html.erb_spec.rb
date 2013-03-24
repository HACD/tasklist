require 'spec_helper'

describe 'tasks/new.html.erb' do
  before do
    
  end

  it "should render a form with a name, description and parent fields" do
    assign(:task, stub_model(Task, :name => 'do stuff'))
    render

    rendered.should include 'Name'
    rendered.should include 'Description'
    rendered.should include 'Parent'
  end

  it "should not render a form with the completed field" do
    assign(:task, stub_model(Task, :id => nil))
    render

    rendered.should_not include 'Completed at'
  end
end 