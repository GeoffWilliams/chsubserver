require 'spec_helper'
describe 'chsubserver', :type => :define do

  context 'compiles when invoked correctly' do
    let :title do
      "rusersd"
    end
    let :params do
      {
        :ensure => "disabled",
        :proto  => "udp",
      }
    end
    it { should compile }
  end

end
