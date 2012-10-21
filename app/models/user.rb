class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :authorisations
  validates :name, :email, :presence => true
end
