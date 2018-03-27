require 'spec_helper'

describe 'monit::config' do
  describe 'when debian' do
    let(:facts) { { :osfamily => 'debian' } }
    it { should contain_file('/etc/monit/monitrc') }
  end

  describe 'when redhat < 7.0' do
    let(:facts) { { :osfamily => 'redhat', :operatingsystemrelease => '6.0' } }
    it { should contain_file('/etc/monit.conf') }
  end
  describe 'when redhat > 7.0' do
    let(:facts) { { :osfamily => 'redhat', :operatingsystemrelease => '7.0' } }
    it { should contain_file('/etc/monitrc') }
  end
end
