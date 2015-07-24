class Teacher < User
  self.table_name = 'teachers'
  has_one :user
end
