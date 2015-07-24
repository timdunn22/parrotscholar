class Entrepreneur < User
  self.table_name = 'entrepreneurs'
  has_one :user
end
