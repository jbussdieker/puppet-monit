require 'spec_helper'

describe 'monit::process' do
  let(:title) { 'testprocess' }

  let(:params) { {
    :start_command => 'start',
    :stop_command => 'stop',
    :pidfile => 'pidfile',
  } }

  it 'declares a monit service' do
    should contain_service(title).with_provider('monit')
  end

  describe 'monit service' do
    it 'requires monit to be installed' do
      should contain_service(title).that_requires('Service[monit]')
    end
  end
end
