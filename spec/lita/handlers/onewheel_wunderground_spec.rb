require 'spec_helper'

describe Lita::Handlers::OnewheelWunderground, lita_handler: true do
  it { is_expected.to route_command('recordhigh') }

  before do
    mock = File.open('spec/fixtures/Portland.json').read
    allow(RestClient).to receive(:get) { mock }
  end

  it 'gives a record high number' do
    send_command 'recordhigh'
    expect(replies.last).to eq('78F in 1983')
  end
end
