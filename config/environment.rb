# Load the Rails application.
require_relative 'application'

<<<<<<< HEAD
ActionMailer::Base.smtp_settings = {
  :user_name => 'NIL',
  :password => 'NIL',
  :domain => 'infinite-earth-40983.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
=======
#ActionMailer::Base.smtp_settings = {
#  :user_name => 'NIL',
#  :password => 'NIL',
#  :domain => 'infinite-earth-40983.herokuapp.com',
#  :address => 'smtp.sendgrid.net',
#  :port => 587,
#  :authentication => :plain,
#  :enable_starttls_auto => true
#}
>>>>>>> 7ef6a0bff7e0485d124e5dc4a8f1ca299a758acd

# Initialize the Rails application.
Rails.application.initialize!
