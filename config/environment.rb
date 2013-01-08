# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Purpleline::Application.initialize!
Paperclip.options[:command_path] = "/usr/local/bin"
config.gem(
  'thinking-sphinx',
  :lib     => 'thinking_sphinx',
  :version => '3.0.0'
)
