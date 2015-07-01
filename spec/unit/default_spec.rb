require 'spec_helper'

describe 'appium::default' do
  context 'debian' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end

    it 'installs appium' do
      expect(chef_run).to install_nodejs_npm('appium')
    end
  end

  # context 'mac_os_x' do
  #   let(:chef_run) do
  #     ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.10').converge(described_recipe)
  #   end
  #
  #   it 'installs appium' do
  #     expect(chef_run).to install_nodejs_npm('appium')
  #   end
  # end

  context 'rhel' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0').converge(described_recipe)
    end

    it 'installs appium' do
      expect(chef_run).to install_nodejs_npm('appium')
    end
  end

  context 'windows' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2012R2').converge(described_recipe)
    end

    it 'logs warning' do
      expect(chef_run).to write_log('Appium cannot be installed on this platform using this cookbook.')
        .with(level: :warn)
    end
  end
end
