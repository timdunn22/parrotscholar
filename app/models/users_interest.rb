class UsersInterest < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :subject


  attr_accessor :active

end
