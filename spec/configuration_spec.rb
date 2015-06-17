require 'spec_helper'
require 'nexmo'

describe '.configure' do
  after do
    Nexmo.reset
  end

  Nexmo::Configuration::VALID_CONFIG_KEYS.each do |key|
    it "sets the #{key}" do
      Nexmo.configure do |config|
        config.send("#{key}=", key)
        expect(Nexmo.send(key)).to eq(key)
      end
    end
  end

  Nexmo::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'returns the default value' do
        expect(Nexmo.send(key)).to eq(Nexmo::Configuration.const_get("DEFAULT_#{key.upcase}"))
      end
    end
  end
end
