class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_host

  def set_host
    ActionMailer::Base.default_url_options = { host: request.host_with_port }
  end
end
