#!/bin/bash

set -e

# Statistics Over Git Repositories
# stash.sh
# stats.sh '\.py$'
# stats.sh 'README'

file_pattern=$1

function main {
    for rev in `revisions`; do
        echo "`number_of_lines` `commit_description`"
    done
}

function revisions {
    git rev-list --reverse HEAD
}

function number_of_lines {
    git ls-tree -r $rev |
    grep "$file_pattern" |
    awk '{print $3}' |
    xargs git show |
    wc -l;
}

function commit_description {
    git log --oneline -1 $rev
}

main

# git rev-list HEAD
# git rev-list --reverse HEAD
# git rev-list --reverse HEAD | while read rev; do git log -1 $rev; done
# git rev-list --reverse HEAD | while read rev; do git ls-tree $rev; done
# git rev-list --reverse HEAD | while read rev; do echo; echo REV $rev; git ls-tree $rev; done
# git rev-list --reverse HEAD | while read rev; do echo; echo REV $rev; git ls-tree -r $rev; done
# 
# git rev-list --reverse HEAD | while read rev; do echo; echo REV $rev; git ls-tree -r $rev | awk '{print $3}'; done
# 
# git rev-list --reverse HEAD | while read rev; do echo; echo REV $rev; git ls-tree -r $rev | awk '{print $3}' | xargs git show | cat; done | view -
# 
# git rev-list --reverse HEAD | while read rev; do echo; echo REV $rev; git ls-tree -r $rev | awk '{print $3}' | xargs git show | wc -l; done