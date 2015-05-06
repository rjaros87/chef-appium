require 'serverspec_helper'

describe 'appium_test::default' do
  if os[:family] == 'darwin'
    describe file('/usr/local/bin/appium') do
      it { should be_file }
    end

    describe port(4723) do
      it { should be_listening }
    end
  end
end
