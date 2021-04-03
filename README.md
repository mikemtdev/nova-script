# project-nova-script

My most useful scripts.

### Usage

    change values in the cvsFiles/Ubuntu-common.csv

    Software,Install
    plank,yes
    nano,no

    Change the plank and nano to the preferred applications you wish to install
    Don't forget to change the Install column to yes if you want to install the software, and no if not.

- ./installation-script [ package manager ] file/type
  - e.g ./installation-script apt common

### Installing files

    - common
        * This parses the values from the cvs (Ubuntu-common.cvs or Fedora-CentOs-common.cvs )
    - dev
      * This parses the values from the cvs (Ubuntu-dev.cvs or Fedora-CentOs-dev.cvs )
    - dev-setup
      * This parses the values from the cvs (Ubuntu-dev-setup.cvs or Fedora-CentOs-dev-setup.cvs )

### TODO:

- [ ] Installation script for most used programs
- [ ] Installation script for development programs
- [ ] Installation script for configurations
