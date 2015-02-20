Milestone.create [
    { referals_count: 5, description: 'Shave Cream' },
    { referals_count: 10, description: 'Truman Handle' },
    { referals_count: 25, description: 'Winston Shave Set' },
    { referals_count: 50, description: 'One Year Free Blades' }
]

5.times { |i|
  inviter = User.create(
      email: "inviter-#{ i }@test.com",
      ip_address: "92.112.#{ i }.10",
      token: Devise.friendly_token,
      confirmed_at: DateTime.now
  )
  ( 5 * i ).times { |n|
    User.create(
        email: "user-#{ n }@server#{ i }.com",
        ip_address: "92.122.#{ n }.10",
        inviter: inviter,
        token: Devise.friendly_token,
        confirmed_at: ((n % 2).equal? 1) ? DateTime.now : nil
    )
  }
}
