#!/bin/bash
set -eu

REPO_NAME=shimataro

git -C /var/db/repos/${REPO_NAME}/ diff --cached | patch -p1
