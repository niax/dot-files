#!/bin/bash

set -xe

(
	cd overlays
	stow -v -R -t ${HOME} $1
)
