#!/usr/bin/env bash
DATE=$(/bin/date '+%Y%m%d-%T')
branch=$(git branch | awk '/\*/ {print $2}')
HOST=$(git config user.name)

backup(){
    # cd $1
    git reflog expire --expire=now --all
    git repack -ad
    git prune
    git add .
    git commit -m "[$DATE] - AUTO PUSH - [$HOST]"
    git push -u origin $branch
}
backup