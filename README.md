# project-nova-script

My most useful scripts.

## The why

I made these scripts because i got tired of doing the same things over and over after installing a new OS. so I made these scripts to install configure and and setup my system before I start using it my newly installed system or new PC.

## Usage

### Aliases

Adding aliases to system for the most used aliases.

### Mkdir

Making folders for my system.

### Change-ttl

Changing system ttl on linux to four preferred values.

> \*Note this will be in effect till system restart.

### Installation Scripts

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

./installation-script [ package manager ] file/type
e.g

#### using apt

    ./installation-script apt common
    ./installation-script apt dev
    ./installation-script apt dev-setup

#### using dnf

    ./installation-script dnf common
    installation-script dnf dev
    ./installation-script dnf dev-setup

#### using apt-fast

    ./installation-script apt-fast common
    installation-script apt-fast dev
    ./installation-script apt-fast dev-setup

### CVS files

- common
  > This parses the values from the cvs (Ubuntu-common.cvs or Fedora-CentOs-common.cvs )
- dev
  > This parses the values from the cvs (Ubuntu-dev.cvs or Fedora-CentOs-dev.cvs )
- dev-setup
  > This parses the values from the cvs (Ubuntu-dev-setup.cvs or Fedora-CentOs-dev-setup.cvs )
