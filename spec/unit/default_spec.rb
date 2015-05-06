require 'spec_helper'

describe 'appium::default' do
  context 'mac_os_x' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.10') do |node|
        node.set['appium']['user'] = Etc.getlogin
      end.converge(described_recipe)
    end

    it 'installs package' do
      expect(chef_run).to install_nodejs_npm('appium')
    end

    it 'links node exec to local' do
      expect(chef_run).to create_link('/usr/bin/node')
    end

    it 'authorizes ios' do
      expect(chef_run).to run_execute('appium authorize ios')
    end

    it 'creates user directory' do
      expect(chef_run).to create_directory(%r{/Users/.*/Library/LaunchAgents})
    end

    it 'unloads appium' do
      expect(chef_run).to_not run_execute('unload appium')
    end

    it 'loads appium' do
      expect(chef_run).to_not run_execute('load appium')
    end

    it 'creates launchd' do
      expect(chef_run).to create_template('setup appium launchd')
    end
  end
end
