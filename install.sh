#!/bin/bash

set -xe

stow -v -R -t ${HOME} $1
