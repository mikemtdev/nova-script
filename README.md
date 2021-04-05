# Project-nova-script

My most useful scripts.

## The why

I made these scripts because i got tired of doing the same things over and over after installing a new OS. so I made these scripts to install configure and and setup my system before I start using it my newly installed system or new PC.

### Aliases

Adding aliases to system for the most used aliases.

### Mkdir

Making folders for my system based no how I like to folder structure to be.

### Change-ttl

Changing system ttl on linux to four preferred values.

> \*Note this will be in effect till system restart.

## Usage

    ./nova-script [ scripts/command ] [ package manager ] file/type

They are basically three commands that can be passed

- configure-system
- install-apps
- set-ttl

      ./nova-script configure-system
      ./nova-script install-apps apt common
      ./nova-script set-ttl

### Installation Scripts

This part covers the install-app command and how to it used.

change values in the cvsFiles/Ubuntu-common.csv.

    Software,Install
    plank,no
    nano,no

Change the plank and nano to your preferred applications you wish to install.

> \*Don't using forget to change the Install column to yes if you want to install the software, and no if not.

    Software,Install
    vlc,yes
    vim,yes
    nano,yes
    firefox,yes

###

    ./nova-script install-apps [ package manager ] file/type

#### using apt

    ./nova-script install-apps apt common
    ./nova-script install-apps apt dev
    ./nova-script install-apps apt dev-setup

#### using dnf

    ./nova-script install-apps dnf common
    nova-script install-apps dnf dev
    ./nova-script install-apps dnf dev-setup

#### using apt-fast

    ./nova-script install-apps apt-fast common
    nova-script install-apps apt-fast dev
    ./nova-script install-apps apt-fast dev-setup

### CVS files

- common
  > This parses the values from the cvs (Ubuntu-common.cvs or Fedora-CentOs-common.cvs )
- dev
  > This parses the values from the cvs (Ubuntu-dev.cvs or Fedora-CentOs-dev.cvs )
- dev-setup
  > This parses the values from the cvs (Ubuntu-dev-setup.cvs or Fedora-CentOs-dev-setup.cvs )
