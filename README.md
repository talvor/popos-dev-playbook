# Pop!_OS Developer Playbook

This playbook installs most of the software that I use on my dev machine for web and software development.

## Assumptions

Meant to be used on a fresh install of Pop!_OS 22.04, but should work on existing installs of the OS (be sure to configure only what you need). It will probably work on Ubuntu if flatpak is installed, but that hasn't been tested so your mileage may vary.

## Prerequisites

You will need `pip` and `ansible` installed on your machine which can be done with the following commands:

```console
sudo apt install python3-pip
pip install --user ansible
export PATH=$PATH:~/.local/bin
```

## Installation

Download or clone this repository to your local drive.

```console
git clone https://github.com/talvor/popos-dev-playbook.git
cd popos-dev-playbook
```

Install dependencies:

```console
ansible-galaxy install -r requirements.yml
```

## Usage

1. Make a copy of `default.config.yml` with the name `config.yml` and change the configurations you want to use.

1. Run the playbook with the command and enter your user account password when prompted:

   ```console
   ansible-playbook main.yml --ask-become-pass --ask-vault-pass
   ```

1. Restart your machine.

## Manual changes

There are some things that I haven't been able to automate yet.

### Set node version

Download and set currently used `node` version with `nvm`. This should theoretically be handled by the playbook, but it doesn't.

```console
nvm install --lts
nvm use --lts
```

### Install yarn

Yarn can be installed once npm (from setting the node version).

```console
npm install --global yarn
```

## Author

This project was created by [Phillip Hall](https://github.com/talvor) (originally inspired by [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook) and [staticdev/linux-developer-playbook](https://github.com/staticdev/linux-developer-playbook))
