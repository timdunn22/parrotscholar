class Counselor < User
  self.table_name = 'counselors'
  has_one :user
end
