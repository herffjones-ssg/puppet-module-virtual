require 'spec_helper'

describe 'virtual' do

  describe 'should include vmware class if enabled' do

    let :facts do
      { :virtual => 'vmware' }
    end
    let :params do
      { :enable_vmware => true }
    end

    it { should include_class('vmware') }

  end
  describe 'should not include vmware class if disabled' do

    let :facts do
      { :virtual => 'vmware' }
    end
    let :params do
      { :enable_vmware => false }
    end

    it { should_not include_class('vmware') }

  end

  describe 'should accept string input for vmware' do

    let :facts do
      { :virtual => 'vmware' }
    end
    let :params do
      { :enable_vmware => "true" }
    end

    it { should include_class('vmware') }

  end

  describe 'should fail on unsupported' do
    let :facts do
      { :virtual => 'hardware' }
    end

    it {
      expect {
        should have_class_count(0)
      }.to raise_error(Puppet::Error, /Virtualization platform <hardware> is not supported./)
    }
  end
end
