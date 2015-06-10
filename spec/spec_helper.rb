$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'nexmo'
require 'webmock/rspec'
require 'vcr'

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/cassettes'
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
end
