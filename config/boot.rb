ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
# Havt to comment this out; kills raspberry pi.
#require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
