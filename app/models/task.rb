class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :name

  def done?
    !completed.nil?
  end
end
