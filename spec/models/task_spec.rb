require 'spec_helper'

describe Task do
  describe "#done?" do
    it "returns true if the completed attribute is set" do
      task = Task.new name: "task", completed: Time.now
      task.done?.should be_true
    end
    it "returns false if the completed attribute is not set" do
      task = Task.new name: "task"
      task.done?.should be_false
    end
  end
end
