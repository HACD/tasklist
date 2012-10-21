class Task < ActiveRecord::Base
  attr_accessible :completed_at, :description, :name, :parent_id

  has_ancestry :orphan_strategy => :rootify

  belongs_to :user

  def completed?
    !completed_at.nil?
  end

  def completed=(completed)
    if completed
      update_attribute :completed_at, Time.now
    else
      update_attribute :completed_at, nil
    end
  end

  def mark_as_complete
    if new_record?
      update_attribute :completed_at, Time.now
    else
      subtree.where(:completed_at => nil).update_all completed_at: Time.now
    end
  end

  def mark_as_incomplete
    if new_record?
      update_attribute :completed_at, nil
    else
      subtree.update_all completed_at: nil
    end
  end

end
