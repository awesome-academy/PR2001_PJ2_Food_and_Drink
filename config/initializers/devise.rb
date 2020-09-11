
Devise.setup do |config|

  config.scoped_views = true

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]
  config.mailer_sender = 'dontreply@example.com'
  #email cua nguoi gui(cua admin)

  config.mailer = 'UserMailer'
  #default cua Devise::Mailer (can hoi them)

  config.stretches = Rails.env.test? ? 1 : 12
  config.reset_password_within = 12.hours

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true
  config.omniauth :google_oauth2, "332766000256-kruhcsq562j5vf9req9vutgo5itdfo79.apps.googleusercontent.com","0TKOSq1h1bpOwlj6hpx0WraD"
  {
    access_type: 'offline',
    approval_prompt: 'force'
  }
  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.sign_out_via = :delete

end
