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
    numbers = ['59179712345']
    params = { from: 'Nexmo Ruby', text: 'Testing SMS Service' }
    response = Nexmo::Client.new.sms.send_messages(numbers, params)
    expect(response['status'].to_i).to eq(0)
  end

  it 'sends a single message' do
    params = { from: 'Nexmo Ruby', to: '59179712345', text: 'Testing single SMS' }
    response = Nexmo::Client.new.sms.send_message(params)
    expect(response['status'].to_i).to eq(0)
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
    numbers = ['59179712345']
    params = { from: 'Nexmo Ruby', text: 'Testing multiple TTS calls Service' }
    response = Nexmo::Client.new(url: 'https://api.nexmo.com').tts.make_calls(numbers, params)
    expect(response['status'].to_i).to eq(0)
  end

  it 'calls a single recipient' do
    params = { from: 'Nexmo Ruby', to: '59179712345', text: 'Testing single TTS call' }
    response = Nexmo::Client.new(url: 'https://api.nexmo.com').tts.make_call(params)
    expect(response['status'].to_i).to eq(0)
  end
end

describe 'Nexmo Alerts Service', :vcr do
  before do
    VCR.insert_cassette 'nexmo_alerts', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it 'sends multiple messages' do
    numbers = ['18708071234']
    params = { template: 0, 'status-report-req': 0, 'client-ref': 'School Name',
      school_name: 'School', message_body: 'Testing multiple Alerts Service'
    }
    response = Nexmo::Client.new.alerts.send_messages(numbers, params)
    expect(response['status'].to_i).to eq(0)
  end
end

describe 'Nexmo VoiceXML Service', :vcr do
  before do
    VCR.insert_cassette 'nexmo_voice_xml', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it 'sends multiple messages' do
    numbers = ['59179712345']
    params = { answer_url: 'http://sms.clouvy.com/message.xml' }
    response = Nexmo::Client.new.vxml.make_calls(numbers, params)
    expect(response['status'].to_i).to eq(0)
  end
end