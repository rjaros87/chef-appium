# install appium
case node['platform_family']
when 'rhel', 'debian'
  include_recipe 'nodejs'

  nodejs_npm 'appium' do
    version node['appium']['version']
    user node['appium']['user']
  end
else
  log('Appium cannot be installed on this platform using this cookbook.') { level :warn }
end
