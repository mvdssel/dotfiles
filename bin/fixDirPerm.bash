#!/bin/bash

# Fix dir permissions
find . \( ! -regex '.*/\..*' \) -type d -print0 | xargs -0 chmod 755 %

# Fix file permissions
find . \( ! -regex '.*/\..*' \) -type f -print0 | xargs -0 chmod 644 %
