# appium Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/appium.svg?style=flat-square)][supermarket]
[![Build Status](http://img.shields.io/travis/dhoer/chef-appium.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-appium.svg?style=flat-square)][github]

[supermarket]: https://supermarket.chef.io/cookbooks/appium
[travis]: https://travis-ci.org/dhoer/chef-appium
[github]: https://github.com/dhoer/chef-appium/issues

This cookbook installs and configures appium and WebDriver components (http://www.appiumhq.org/).

This cookbook comes with the following Resource/Providers:

- **[appium_hub](https://github.com/dhoer/chef-appium#appium_hub)** - Installs and configures appium-grid hubs.
- **[appium_node](https://github.com/dhoer/chef-appium#appium_node)** - Installs and configures appium-grid
nodes
with support for [ChromeDriver](http://chromedriver.storage.googleapis.com/index.html),
[FirefoxDriver](https://code.google.com/p/appium/wiki/FirefoxDriver),
[HtmlUnitDriver](https://code.google.com/p/appium/wiki/HtmlUnitDriver), and
[InternetExplorerDriver](https://code.google.com/p/appium/wiki/InternetExplorerDriver).
- **[appium_phantomjs](https://github.com/dhoer/chef-appium#appium_phantomjs)** - Installs and configures
[PhantomJS](http://phantomjs.org/) as a appium-grid node or as a standalone server via

- Installs [Appium](http://appium.io) via Node.js.

## Requirements

- Chef 11 or higher
- Java installed
- XCode and XCode Command-Line installed

### Platforms

- CentOS, RedHat
- Mac OS X
- Ubuntu
- Windows

### Cookbooks

These cookbooks are referenced with suggests, so be sure to depend on cookbooks that apply:

- windows
- nssm - Required for Windows services only (e.g. Hub, PhantomJS, and HtmlUnit running in background)

## Usage

See [appium_test](https://github.com/dhoer/chef-appium/tree/master/test/fixtures/cookbooks/appium_test)
cookbook for working cross platform examples. Note that the provided examples in this cookbook have passwords
unencrypted for simplicity.

## appium_hub

Installs and configures appium-grid hubs.

#### Requirements

- Java must be installed outside of this cookbook.

### Example

##### Install appium-grid hub

```ruby
appium_hub 'appium_hub' do
  action :install
end
```

#### Attributes

This is a partial list of attributes available.  See
[hub](https://github.com/dhoer/chef-appium/blob/master/resources/hub.rb)
resource for the complete listing of attributes.

- `name` - Name attribute. The name of the service.
- `host` - Hostname. Defaults to `null`.
- `port` - Port.  Defaults to `4444`.

## ChefSpec Matchers

The appium cookbook includes custom [ChefSpec](https://github.com/sethvargo/chefspec) matchers you can use to test
your own cookbooks.

Example Matcher Usage

```ruby
expect(chef_run).to install_appium_hub('resource_name').with(
  port: '4444'
)
```
      
appium Cookbook Matchers

- install_appium_hub(resource_name)
- install_appium_node(resource_name)
- install_appium_phantomjs(resource_name)

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef-appium).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-appium/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-appium/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-appium/blob/master/LICENSE.md) file for details.
