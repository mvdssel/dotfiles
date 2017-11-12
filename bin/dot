#!/bin/bash

# This script is used in vim as makeprg for dot files

dot -Tpdf "$@" -o "$(echo "$@"|sed -E s/\.dot/\.pdf/)"
