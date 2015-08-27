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
    gender: Faker::User.gender,
    birthday: Faker::Date.between(100.years.ago,3.years.ago),
    skill_description: Faker::Lorem.paragraph,
    education_level: Faker::User.education_level,
    degree: Faker::Lorem.sentence
  )
  user.skip_confirmation!
  user.save!
end
users = User.all
# 500.times do
#   ClassStyle.create!(
#   user: users.sample,
#   user_type: Faker::User.type,
#   $styles.each do |style|
#     "#{style}": Faker::Course.styles
#   end
#   )
# end
["ClassType","ClassStyle"].each do |name_class|
  500.times do
    class_eval(name_class).create!(
    user: users.sample,
    user_type: Faker::User.type,
    $types.each do |type|
      "#{type}" Faker::Course.styles
    end

    )
  end
end

100.times do
  Entrepreneur.create!(
  user: users.sample,
  desired_role: Faker::Name.title,
  institute_description: Faker::Lorem.paragraph,
  experience_description: Faker::Lorem.paragraph,
  institute_policies_interests: Faker::Lorem.paragraph

  )
end
100.times do
  Student.create!(
  user: users.sample,
  self_description: Faker::Lorem.paragraph,
  available_start_date: Faker::Date.forward(200),
  counselor_interest: [true,false].sample
  )
end
100.times do
  Teacher.create!(
  user: users.sample,
  hire_description: Faker::Lorem.paragraph,
  price_negotiation:  Faker::Course.negotiate,
  course_type: Faker::Course.kind
  )
end
1000.times do
  UsersInterest.create!(
  subject: Faker::Course.subject,
  user_type: Faker::User.core,
  user: users.sample,
  competency: Faker::Number.between(1,10)

  )
end




admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!
