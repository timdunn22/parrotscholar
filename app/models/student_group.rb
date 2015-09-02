class StudentGroup < ActiveRecord::Base
  has_many :student_group_members, dependent: :destroy
  has_many :users, through: :student_group_members
  accepts_nested_attributes_for :student_group_members, allow_destroy: true
end
