class User < ActiveRecord::Base
  has_many :milestones, through: :milestone_users
  has_many :milestone_users, dependent: :delete_all
  has_many :referals, class_name: User, foreign_key: :inviter_id
  belongs_to :inviter, class_name: User
  accepts_nested_attributes_for :milestone_users
  attr_accessor :ref

  validates :email, format: { with: /\A([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}\z/i }, uniqueness: true
  # validates :ip_address, uniqueness: true
  validates :token, uniqueness: true

  after_save :send_confirm_email, :send_email_to_mailchimp_list

  private

  def send_confirm_email
    UserConfirm.confirm_email(token, email).deliver_now unless confirmed_at
  end

  def send_email_to_mailchimp_list
    Gibbon::API.new(ENV['MAILCHIMP_API_KEY']).lists.subscribe({id: ENV['MAILCHIMP_LIST_ID'], email: {email: email}, double_optin: false}) rescue nil
  end
end
