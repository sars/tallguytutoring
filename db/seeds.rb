# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |n|
  User.create(
      email: "inviter-#{ n }@test.com",
      ip_address: "92.112.4#{ n }.10#{ 4 + n }",
      token: Devise.friendly_token
  )
end

4.times do |n|
  User.create(
      email: "user-#{ n }@one.com",
      ip_address: "92.122.4#{ n }.10#{ 4 + n }",
      inviter: User.find_by_email('inviter-0@test.com'),
      token: Devise.friendly_token
  )
end

9.times do |n|
  User.create(
      email: "user-#{ n }@two.com",
      ip_address: "92.132.#{ n }.1#{ 4 + n }",
      inviter: User.find_by_email('inviter-1@test.com'),
      token: Devise.friendly_token
  )
end

24.times do |n|
  User.create(
      email: "user-#{ n }@three.com",
      ip_address: "92.142.#{ n }.1#{ 4 + n }",
      inviter: User.find_by_email('inviter-2@test.com'),
      token: Devise.friendly_token
  )
end

49.times do |n|
  User.create(
      email: "user-#{ n }@four.com",
      ip_address: "92.152.#{ n }.1#{ 4 + n }",
      inviter: User.find_by_email('inviter-3@test.com'),
      token: Devise.friendly_token
  )
end

m0 = Milestone.create(referals_count: 5, description: 'Shave Cream')
m1 = Milestone.create(referals_count: 10, description: 'Truman Handle')
m2 = Milestone.create(referals_count: 25, description: 'Winston Shave Set')
Milestone.create(referals_count: 50, description: 'One Year Free Blades')

User.find_by_email('inviter-1@test.com').milestones << m0
u2 = User.find_by_email('inviter-2@test.com')
u2.milestones << m0
u2.milestones << m1
u3 = User.find_by_email('inviter-3@test.com')
u3.milestones << m0
u3.milestones << m1
u3.milestones << m2
