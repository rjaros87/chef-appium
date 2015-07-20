require 'serverspec_helper'

describe 'appium_test::android' do
  describe file('/usr/local/android-sdk/tools/android') do
    it { should be_file }
  end

  describe command('/usr/local/android-sdk/tools/android list targets') do
    its(:stdout) { should match(/Available Android targets:/) }
  end

  describe command('appium-doctor --android') do
    its(:stdout) { should match(/All Checks were successful/) }
  end
end
