class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :name

  has_ancestry

  def done?
    !completed.nil?
  end
end
