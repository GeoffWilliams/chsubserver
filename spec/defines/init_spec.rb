require 'spec_helper'
describe 'chsubserver', :type => :define do

  context 'compiles when invoked correctly' do
    let :title do
      "rusersd->udp"
    end
    let :params do
      {
        :ensure => "disabled",
      }
    end
    it { should compile }
  end

  context "errors when title (key) is not in correct format" do
    let :title do
      "this title is not in the correct format"
    end
    it {
      expect {
        is_expected.to compile.and_raise(Puppet::Error, /Incorrect key/)
      }
    }
  end

end
