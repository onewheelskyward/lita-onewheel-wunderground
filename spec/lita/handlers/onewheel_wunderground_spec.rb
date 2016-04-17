require 'spec_helper'

describe Lita::Handlers::OnewheelWunderground, lita_handler: true do
  it { is_expected.to route_command('recordhigh') }

end
