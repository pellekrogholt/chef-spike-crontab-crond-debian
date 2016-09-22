# chef spike crontab cron.d debian

Try outs with crontab and cron.d on debian.

## Requirements

### Platforms

* Debian (version 8.3 or newer)

### Cookbooks

* cron (support for cron.d even on debian)


## The recipe(s)

- `default` creates a basic `/tmp/ping` file containing 'pong'.
- `crontab` creates a crontab for a `foobar` and `root` user that each minute pings
   to `/var/log/crontabfoobar/foobar.log` and `/var/log/crontabroot/root.log`.

## Development

### Prerequisites

* [Vagrant](https://www.vagrantup.com)
* Vagrant plugins: vagrant-berkshelf, vagrant-cachier, vagrant-chef-zero,
  vagrant-omnibus, vagrant-vbguest (install with `vagrant plugin install
  <plugin-name>`)
* [VirtualBox](https://www.virtualbox.org)
* [Ruby](https://www.ruby-lang.org/en/) version 2.0 or newer
* [Bundler](http://bundler.io)
* [ChefDK](https://downloads.chef.io/chef-dk/)

Install the cookbook's cookbook dependencies with `berks install`, and install
required Ruby gems with `bundle install`.

### Testing

Testing is done with [Foodcritic](http://www.foodcritic.io),
[RuboCop](https://github.com/bbatsov/rubocop),
[ChefSpec](https://docs.chef.io/chefspec.html), [Test Kitchen](http://kitchen.ci),
and [Serverspec](http://serverspec.org).

To run all tests, execute the `rake` command. `rake -T` will print the available
tests, enabling you to run a specific one with `rake <test-name>`.
