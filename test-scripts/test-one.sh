#! /bin/bash/env bash
touch mike.sh
chmod +x mike.sh
echo sudo dnf update -y >> mike.sh
./mike.sh
echo "done"


