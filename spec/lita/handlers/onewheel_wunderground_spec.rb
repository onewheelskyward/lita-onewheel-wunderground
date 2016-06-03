require 'spec_helper'

describe Lita::Handlers::OnewheelWunderground, lita_handler: true do
  it { is_expected.to route_command('recordhigh') }
  it { is_expected.to route_command('recordlow') }
  it { is_expected.to route_command('reocrdhigh') }
  it { is_expected.to route_command('reocrdlow') }

  before do
    mock = File.open('spec/fixtures/Portland.json').read
    allow(RestClient).to receive(:get) { mock }
  end

  it 'gives a record high number' do
    send_command 'recordhigh'
    expect(replies.last).to eq('Normally 62F, record high 78F in 1983')
  end

  it 'gives a record low number' do
    send_command 'recordlow'
    expect(replies.last).to eq('Normally 43F, record low 31F in 1977')
  end
end
