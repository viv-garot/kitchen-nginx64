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

### Install required gems dependencies locally

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
