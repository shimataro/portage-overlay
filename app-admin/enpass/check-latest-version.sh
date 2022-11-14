#!/bin/bash
set -eu

curl -so- https://apt.enpass.io/dists/stable/main/binary-amd64/Packages.gz | zegrep "Package|Version|Depends" | head -n 3
