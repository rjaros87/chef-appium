require 'serverspec_helper'

describe 'appium::default' do
  describe file('/usr/bin/appium') do
    it { should be_file }
  end

  describe command('which appium') do
    its(:stdout) { should match(%r{/bin/appium}) }
  end

  describe command('appium -v') do
    its(:stdout) { should match(/\d*\.\d*\.\d*/) }
  end
end
