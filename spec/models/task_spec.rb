require 'spec_helper'

describe Task do
  describe "#done?" do
    it "returns true if the completed_at attribute is set" do
      task = Task.new name: "task", completed_at: Time.now
      task.done?.should be_true
    end
    it "returns false if the completed_at attribute is not set" do
      task = Task.new name: "task"
      task.done?.should be_false
    end
    it "returns false if name or description is not set" do
      task = Task.new
      task.save?.should be_false
    end
    it "returns true if name and description is set" do
      task = Task.new :name => "task", :description => "description"
      task.save?.should be_true
    end
  end
end
