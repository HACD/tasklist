class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :name

  has_ancestry :orphan_strategy => :rootify

  def completed?
    !completed_at.nil?
  end

  def completed=(completed)
    self.completed_at = completed ? Time.now : nil
  end

  def mark_as_complete
    self.completed = true
  end

  def mark_as_incomplete
    self.completed = false
  end

end
