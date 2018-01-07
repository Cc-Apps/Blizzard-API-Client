require 'spec_helper'

describe BlizzardApiClient do

  describe 'when configured' do
    before do
      BlizzardApiClient.configure do |c|
        #c.logger    = Logger.new('/dev/null')
        c.region  = 'test'
        c.locale  = 'test'
        c.api_key = 'test'
      end
    end

    subject { described_class }

    it 'should be configured' do
      expect(subject.configuration.configured?).to eq true
    end
  end

  describe 'when NOT configured' do
    before do
      BlizzardApiClient.configure do |c|
        c.region  = nil
        c.locale  = nil
        c.api_key = nil
      end
    end

    subject { described_class }

    it 'should NOT be configured' do
      p subject.configuration.to_hash
      expect(subject.configuration.configured?).to eq false
    end
  end
end