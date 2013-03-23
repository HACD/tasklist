require 'spec_helper'

describe Task do
  let(:task) { Task.create! }
  let(:parent) { Task.create! }
  let(:child) { Task.create! }
  
  context 'ancestry' do
    it "should have children" do
      child.parent = task
      task.save
      child.save

      task.children.should include child
    end

    it "should have a parent" do
      task.parent = parent
      parent.save
      task.save

      task.parent.should == parent
    end

    it "should be a root node if it doesnt have a parent" do
      task.save

      task.is_root?.should == true
    end
  end
end