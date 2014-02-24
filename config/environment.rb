# Load the Rails application.
require File.expand_path('../application', __FILE__)
carrierwave_env_vars = File.join(Rails.root, 'config', 'carrierwave_env.rb')
load(carrierwave_env_vars) if File.exists?(carrierwave_env_vars)
# Initialize the Rails application.
WeFit1::Application.initialize!
