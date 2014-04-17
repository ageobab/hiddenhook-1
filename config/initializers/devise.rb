Devise.setup do |config|
  config.secret_key = 'f9845795340c73d86a6e33538e6474665eb2d9869868a9e6b50b8672e758988aad373d77eb89da1094244feb805c3b374cdb01a6ddf4760936e4f9810345b6df'
  config.mailer_sender = 'info@hiddenhookflies.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
