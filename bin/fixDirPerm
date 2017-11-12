#!/bin/bash

set -o xtrace   # Log all executed commands
set -e          # Exit on error

fixDirPerm() {
    while read dir; do
        chmod 755 "$dir"
        xattr -c "$dir"         # remove extended attributes
        # chmod -R -E "$dir"    # remove ACL
    done < <(find . \( ! -regex '.*/\..*' \) -type d)
    # find . \( ! -regex '.*/\..*' \) -type d -print0 | xargs -0 chmod 755 %
}

fixFilePerm() {
    while read file; do
        chmod 644 "$file"
        xattr -c "$file"         # remove extended attributes
        # chmod -R -E "$file"    # remove ACL
    done < <(find . \( ! -regex '.*/\..*' \) -type f)
    # find . \( ! -regex '.*/\..*' \) -type f -print0 | xargs -0 chmod 644 %
}

fixDirPerm
fixFilePerm
