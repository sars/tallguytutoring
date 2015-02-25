Milestone.create [
    { referals_count: 5, description: 'Free group session' },
    { referals_count: 10, description: 'Free one-on-one session' },
    { referals_count: 15, description: 'Free session and help completing a full assignment' },
    { referals_count: 20, description: 'Free complete test or exam prep, up to 3 hours one-on-one' }
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
