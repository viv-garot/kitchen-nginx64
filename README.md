# kitchen-nginx64

## Description
Create a Test Kitchen to check nginx package is installed on a Vagrant virtualbox box

## Pre-requirements

* [Packer](https://www.packer.io/downloads)
* [Vagrant](https://www.vagrantup.com/downloads)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Rbenv](https://github.com/rbenv/rbenv#installation)

## How to use this repo

- Clone
- Build
- Test

---

### Clone the repo

```
git clone https://github.com/viv-garot/kitchen-nginx64
```

### Change directory

```
cd kitchen-nginx64
```

### Build the box with Packer

```
packer build nginx64.json
```

### Add the box locally to Vagrant

```
vagrant box add --force --name nginx64 nginx64-vbox.box
```

## Test the build

### Ruby installation

Install Ruby 2.6.6

```
rbenv install -l
rbenv install 2.6.6
rbenv local 2.6.6
```

### Install required RubyGems dependencies locally

```
bundle install --path vendor/bundle
```

### Run the kitchen tests

Individually
```
bundle exec kitchen list
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

Or

All at once 

```
bundle exec kitchen test
```

Sample output

```
bundle exec kitchen test
-----> Starting Test Kitchen (v3.0.0)
-----> Cleaning up any prior instances of <default-vbox-nginx64>
-----> Destroying <default-vbox-nginx64>...
       Finished destroying <default-vbox-nginx64> (0m0.00s).
-----> Testing <default-vbox-nginx64>
-----> Creating <default-vbox-nginx64>...
       Bringing machine 'default' up with 'virtualbox' provider...
       ==> default: Importing base box 'nginx64'...

[...]

Profile: tests from {:path=>"/Users/viviengarot/Desktop/VisualCode/skillsmap/Packer/test-kitchen-nginx64-repo/kitchen-nginx64/test/integration/default"} (tests from {:path=>".Users.viviengarot.Desktop.VisualCode.skillsmap.Packer.test-kitchen-nginx64-repo.kitchen-nginx64.test.integration.default"})
Version: (not specified)
Target:  ssh://vagrant@127.0.0.1:2222

  System Package nginx
     ✔  is expected to be installed

Test Summary: 1 successful, 0 failures, 0 skipped
       Finished verifying <default-vbox-nginx64> (0m2.45s).
-----> Destroying <default-vbox-nginx64>...
       ==> default: Forcing shutdown of VM...
       ==> default: Destroying VM and associated drives...
       Vagrant instance <default-vbox-nginx64> destroyed.
       Finished destroying <default-vbox-nginx64> (0m3.93s).
       Finished testing <default-vbox-nginx64> (0m46.99s).
-----> Test Kitchen is finished. (0m48.29s)
```
