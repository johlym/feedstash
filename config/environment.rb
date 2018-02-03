# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings = {
  :port           => 25,
  :address        => 'smtp.sendgrid.net',
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'feedstash.org',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp

# Initialize the Rails application.
Rails.application.initialize!
