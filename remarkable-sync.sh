#!/usr/bin/env bash

set -e

offpunk.py --sync
rsync -r --copy-links ~/remarkable/ root@192.168.1.157:~/sync
