class Task < ActiveRecord::Base
  attr_accessible :completed_at, :description, :name, :parent_id

  has_ancestry :orphan_strategy => :rootify

  def completed?
    !completed_at.nil?
  end

  def completed=(completed)
    # "1" is what is given in the params for a checkbox
    # FIXME: The model shouldn't know this!
    completed == "1" ? mark_as_complete : mark_as_incomplete
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
