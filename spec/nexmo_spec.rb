require 'spec_helper'
require 'nexmo'

describe 'Nexmo SMS Service', :vcr do
  before do
    VCR.insert_cassette 'nexmo_sms', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it 'sends multiple messages' do
    numbers = ['59179783638']
    params = { from: 'Nexmo Ruby Wrapper', text: 'Testing multiple SMS Service' }
    Nexmo::Client.new.sms.send_messages(numbers, params)
  end

  it 'sends a single message' do
    params = { from: 'Nexmo Ruby Wrapper', to: '59179783638', text: 'Testing single SMS' }
    Nexmo::Client.new.sms.send_message(params)
  end
end

describe 'Nexmo TTS Service', :vcr do
  before do
    VCR.insert_cassette 'nexmo_tts', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it 'calls multiple recipients' do
    numbers = ['59179783638']
    params = { text: 'Testing multiple TTS calls Service' }
    Nexmo::Client.new.tts.make_calls(numbers, params)
  end

  it 'calls a single recipient' do
    params = { to: '59179783638', text: 'Testing single TTS call' }
    Nexmo::Client.new('https://api.nexmo.com').tts.make_call(params)
  end
end
