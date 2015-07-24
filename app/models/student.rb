class Student < User
  self.table_name = 'students'
  has_one :user
end
