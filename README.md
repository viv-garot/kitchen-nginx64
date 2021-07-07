# kitchen-nginx64

## Description
Create a Test Kitchen to check nginx is installed on a Vagrant nginx box

## Pre-requirements

* [Packer](https://www.packer.io/downloads)
* [Vagrant](https://www.vagrantup.com/downloads)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Rbenv](https://github.com/rbenv/rbenv#installation)

## How to use this repo

- Clone
- Build
- Test
- Vagrant usage
- Publish
- Consume 

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

### Test the build

Install Ruby 2.6.6

```
rbenv install -l
rbenv install 2.6.6
rbenv local 2.6.6
```

### Install kitchen-test

```
bundle install --path vendor/bundle
```

### Run the tests

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


### How to use the box with Vagrant

#### Initialize the box to create a VagrantFile

```
vagrant init -m nginx64
```

#### Start the box

```
vagrant up
```

### Access the box

```
vagrant ssh
```
or 
```
ssh vagrant@127.0.0.1 -p 2222 
```
*(password = vagrant)*
*(port 2222 is hardcoded in bionic64.json)*

### Destroy the box

```
vagrant destroy
```

### Remove the box

```
vagrant box remove bionic64
```


## Publish to Vagrant Cloud

### Login to Vagrant Cloud

```
vagrant cloud auth login
```

*Note : If you have Two-Factor authentication enabled the login will fail with the bellow error*
```
 - Two-factor authentication is enabled! Vagrant Cloud does not support creating (VagrantCloud::Error::ClientError::RequestError)
access tokens via the API when the user has two-factor authentication
enabled. Please create an access token using the Vagrant Cloud website and store
the result in the 'ATLAS_TOKEN' environment variable.
```

*- Create a token in Vagrant Cloud if not performed already*

![image](https://user-images.githubusercontent.com/85481359/124562546-6f819000-de3f-11eb-9609-8c5ed40dc159.png)

*- And export the result in the 'ATLAS_TOKEN' environment variable*

```
export ATLAS_TOKEN=<generated-token>
```

*- Then try again to login*

```
vagrant cloud auth login
```

### Create the box in Vagrant Cloud

```
vagrant cloud box create <user>/<box> --no-private
```
e.g.
```
vagrant cloud box create vivien/nginx64 --no-private
```

### Publish the box to Vagrant Cloud

```
vagrant cloud publish --box-version `date +%y.%m.%d` \
  --force --no-private --release <user>/<box>   \
  `date +%y.%m.%d` virtualbox nginx64-vbox.box
```

e.g.
```
vagrant cloud publish --box-version `date +%y.%m.%d` \
  --force --no-private --release vivien/nginx64   \
  `date +%y.%m.%d` virtualbox nginx64-vbox.box
```

## Consume the box from the Vagrant Cloud

### Create a sub directory

```
mkdir myboxes
```

### Change directory

```
cd myboxes
```

### Initialize the box to create a VagrantFile

```
vagrant init -m <user>/<box>
```

e.g.
```
vagrant init -m vivien/nginx64
```

### Start the box

```
vagrant up
```
