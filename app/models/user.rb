class User < ActiveRecord::Base
  has_many :milestones, -> { order :referals_count}, through: :milestone_users
  has_many :milestone_users, dependent: :delete_all
  has_many :referals, class_name: User, foreign_key: :inviter_id
  belongs_to :inviter, class_name: User
  accepts_nested_attributes_for :milestone_users
  attr_accessor :ref

  validates :email, format: { with: /\A([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}\z/i }, uniqueness: true
  validate :ip_access, on: :create
  validates :token, uniqueness: true

  after_commit :send_confirm_email, on: :create
  after_commit :next_milestone, on: [:create, :update]
  after_commit :send_email_to_mailchimp_list, on: :update

  scope :confirmed_referals, -> { where('confirmed_at IS NOT NULL') }

  def ip_access
    errors.add :ip_address, :invalid if User.where(ip_address: ip_address).size > 2
  end

  def referals_cout
    referals.confirmed_referals.size
  end

  def all_milestone
    milestone_last = milestones.last
    Milestone.all.order(:referals_count).map do |milestone|
      hash = { milestone: milestone, last_reached: false }
      hash.merge!({last_reached: true}) if milestone_last and milestone.id.equal? milestone_last.id
      hash
    end
  end

  private

  def send_confirm_email
    UserConfirm.confirm_email(token, email).deliver unless confirmed_at
  end

  def send_email_to_mailchimp_list
    gibbon = Gibbon::API.new(ENV['MAILCHIMP_API_KEY'])
    params = {id: ENV['MAILCHIMP_LIST_ID'], email: {email: email}, double_optin: false}
    gibbon.lists.subscribe(params) if confirmed_at rescue nil
  end

  def next_milestone
    if inviter and confirmed_at
      next_milestone = Milestone.find_by_referals_count(inviter.referals_cout)
      inviter.milestones << next_milestone if next_milestone
    end
  end
end
