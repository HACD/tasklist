class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :name
end
