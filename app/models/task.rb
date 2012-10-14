class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :name

  has_ancestry :orphan_strategy => :rootify

  def done?
    !completed.nil?
  end
end
