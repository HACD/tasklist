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
    subtree.where(:completed_at => nil).update_all completed_at: Time.now
  end

  def mark_as_incomplete
    self.completed_at = nil
    self.save
  end

end
