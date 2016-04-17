require 'spec_helper'

describe Lita::Handlers::OnewheelWunderground, lita_handler: true do
  it { is_expected.to route_command('recordhigh') }

  it 'gives a record high number' do
    send_command 'recordhigh'
    expect(replies.last).to eq('666F')
  end
end
