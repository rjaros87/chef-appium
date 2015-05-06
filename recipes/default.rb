include_recipe 'nodejs'

user = node['appium']['user']

nodejs_npm 'appium' do
  version node['appium']['version']
  user user
end

link '/usr/bin/node' do
  to '/usr/local/bin/node'
end

if platform_family?('mac_os_x')
  execute 'appium authorize ios' do
    command 'sudo authorize_ios'
    user user
  end

  user_home = Dir.home(user)
  user_home_launch_agents = "#{user_home}/Library/LaunchAgents"

  directory user_home_launch_agents do
    owner user
    recursive true
  end

  # The service resource in Chef doesn't support loading a launchd service as a specific user, which unfortunately is
  # the only way Appium can run Xcode iOS Simulator.
  execute 'unload appium' do
    command 'launchctl unload ~/Library/LaunchAgents/io.appium.server.plist'
    user user
    action :nothing # only fire when a change is made to the template.
    returns [0, 1]
  end

  execute 'load appium' do
    command 'launchctl load ~/Library/LaunchAgents/io.appium.server.plist'
    user user
    action :nothing # only fire when a change is made to the template.
  end

  template 'setup appium launchd' do
    source 'launchd.plist.erb'
    cookbook 'appium'
    path "#{user_home_launch_agents}/io.appium.server.plist"
    variables(
      user: user,
      user_home: user_home
    )
    notifies :run, 'execute[unload appium]', :immediately
    notifies :run, 'execute[load appium]', :delayed
  end
end
