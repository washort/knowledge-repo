#!/bin/bash

share="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
repo_name=mozilla-reports
repo=https://github.com/mozilla/$repo_name.git
interval=60

function update_repo {
  pushd $share > /dev/null
  if cd $repo_name; then
    git pull
  else
    git clone $repo
  fi
  popd > /dev/null
}

update_repo

(while true; do
  sleep $interval
  update_repo
done) &
