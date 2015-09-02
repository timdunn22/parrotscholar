# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

200.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    username: Faker::Internet.user_name,
    gender: $genders.sample,
    birthday: Faker::Date.between(100.years.ago,3.years.ago),
    skill_description: Faker::Lorem.paragraph,
    education_level: $education_levels.sample,
    degree: Faker::Lorem.sentence
  )
  user.skip_confirmation!
  user.save!
end
users = User.all
# 500.times do
#   ClassStyle.create!(
#   user_id: users.sample.id,
#   user_type: $core_user_types.sample,
#   "instant_messaging": $booleans.sample,
#   "video_conferencing": $booleans.sample,
#   "screen_sharing": $booleans.sample,
#   "file_sharing": $booleans.sample,
#   "audio": $booleans.sample
#   )
# end
#
# 500.times do
#   ClassType.create!(
#   user_id: users.sample.id,
#   user_type: $core_user_types,
#   "one_one": $booleans.sample,
#   "one_many": $booleans.sample,
#   "many_one": $booleans.sample,
#   "institute": $booleans.sample,
#   "many_many": $booleans.sample
#   )
# end

# ["ClassType","ClassStyle"].each do |name_class|
#   500.times do
#     class_eval(name_class).create!(
#     user: users.sample,
#     user_type: Faker::User.type,
#     $types.each do |type|
#       "#{type}": Faker::Course.styles
#     end
#
#     )
#   end
# end

# 100.times do
#   Entrepreneur.create!(
#   user_id: users.sample.id,
#   desired_role: Faker::Name.title,
#   institute_description: Faker::Lorem.paragraph,
#   experience_description: Faker::Lorem.paragraph,
#   institute_policies_interests: Faker::Lorem.paragraph
#
#   )
# end
# 100.times do
#   Student.create!(
#   user_id: users.sample.id,
#   self_description: Faker::Lorem.paragraph,
#   available_start_date: Faker::Date.forward(200),
#   counselor_interest: $booleans.sample
#   )
# end
# 100.times do
#   Teacher.create!(
#   user_id: users.sample.id,
#   hire_description: Faker::Lorem.paragraph,
#   price_negotiation:  $course_negotiate.sample,
#   course_type: $course_kind.sample
#   )
# end
1000.times do
  UsersInterest.create!(
  subject: $subjects.sample,
  user_type: $core_user_types.sample,
  user_id: users.sample.id,
  competency: Faker::Number.between(1,10)

  )
end
200.times do
  Course.create!(
  name: Faker::Lorem.sentence,
  price: Faker::Number.decimal(0,50000)
  )
end




admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
)
admin.skip_confirmation!
admin.save!

puts "There are now #{User.count} users"
puts "There are now #{ClassStyle.count} styles"
puts "There are now #{ClassType.count} types"
puts "There are now #{ProfilePolicy.count} policies"
puts "There are now #{Course.count} courses"
puts "There are now #{UsersInterest.count} interests"
puts "There are now #{Entrepreneur.count} entrepreneurs"
puts "There are now #{Student.count} students"
puts "There are now #{Teacher.count} teachers"
