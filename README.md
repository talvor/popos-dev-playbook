# Pop!_OS Developer Playbook

This playbook installs most of the software that I use on my dev machine for web and software development.

## Assumptions

Meant to be used on a fresh install of Pop!_OS 22.04, but should work on existing installs of the OS (be sure to configure only what you need). It will probably work on Ubuntu if flatpak is installed, but that hasn't been tested so your mileage may vary.

## Installation

Download or clone this repository to your local drive.

```shell
$ git clone https://github.com/talvor/popos-dev-playbook.git
```

## Setting up host

1. Install dependencies

   ```shell
   $ cd popos-dev-playbook
   $ ./setup.sh
   $ ansible-galaxy install -r requirements.yml
   ```

1. Run the playbook and enter your user account password when prompted:

   ```shell
   $ ansible-playbook setup_host.yml --ask-become-pass --ask-vault-pass
   ```

1. Restart your machine.

## Setting up development container

1. Create the **dev** distrobox container

   ```shell
   $ distrobox create -n dev
   ```

1. Enter development container and setup ansible

   ```shell
   $ distrobox enter dev
   $ cd popos-dev-playbook
   $ ./setup.sh
   $ ansible-galaxy install -r requirements.yml
   ```

1. Run the playbook and enter your user account password when prompted:

   ```shell
   $ ansible-playbook setup_dev_container.yml --ask-become-pass
   ```

## Post install steps

### Setup access to remote kubernetes cluster
```shell
$ distrbox enter dev
$ mkdir ~/.kube
$ scp -r rancher@192.168.1.220:/etc/rancher/k3s/k3s.yaml ~/.kube/config
$ sed -i 's/127.0.0.1/192.168.1.220/' ~/.kube/config
```

## Author

This project was created by [Phillip Hall](https://github.com/talvor) (originally inspired by [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook) and [staticdev/linux-developer-playbook](https://github.com/staticdev/linux-developer-playbook))
