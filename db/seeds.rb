Milestone.create(referals_count: 5, description: 'Shave Cream')
Milestone.create(referals_count: 10, description: 'Truman Handle')
Milestone.create(referals_count: 25, description: 'Winston Shave Set')
Milestone.create(referals_count: 50, description: 'One Year Free Blades')

5.times do |n|
  User.create(
      email: "inviter-#{ n }@test.com",
      ip_address: "92.112.4#{ n }.10#{ 4 + n }",
      token: Devise.friendly_token,
      confirmed_at: DateTime.now
  )
end

4.times do |n|
  u = User.new(
      email: "user-#{ n }@one.com",
      ip_address: "92.122.4#{ n }.10#{ 4 + n }",
      inviter: User.find_by_email('inviter-0@test.com'),
      token: Devise.friendly_token,

  )
  u.confirmed_at = DateTime.now if (n % 2).equal? 1
  u.save
end

9.times do |n|
  u = User.new(
      email: "user-#{ n }@two.com",
      ip_address: "92.132.#{ n }.1#{ 4 + n }",
      inviter: User.find_by_email('inviter-1@test.com'),
      token: Devise.friendly_token
  )
  u.confirmed_at = DateTime.now if (n % 2).equal? 1
  u.save
end

24.times do |n|
  u = User.new(
      email: "user-#{ n }@three.com",
      ip_address: "92.142.#{ n }.1#{ 4 + n }",
      inviter: User.find_by_email('inviter-2@test.com'),
      token: Devise.friendly_token
  )
  u.confirmed_at = DateTime.now if (n % 2).equal? 1
  u.save
end

49.times do |n|
  u = User.new(
      email: "user-#{ n }@four.com",
      ip_address: "92.152.#{ n }.1#{ 4 + n }",
      inviter: User.find_by_email('inviter-3@test.com'),
      token: Devise.friendly_token
  )
  u.confirmed_at = DateTime.now if (n % 2).equal? 1
  u.save
end
