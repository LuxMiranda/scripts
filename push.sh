#!/bin/bash
function get_branch() {
  git branch --no-color | grep -E '^\*' | awk '{print $2}' \
    || echo "default_value"
}
branch=`get_branch`;
git push origin ${branch}
exit
