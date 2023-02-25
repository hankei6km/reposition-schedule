#!/bin/bash
set -e

if test -z "${REPO_LIST_LIMIT}"; then
  REPO_LIST_LIMIT=10
fi

gh repo list -L "${REPO_LIST_LIMIT}" \
  --json nameWithOwner,name,owner,url,description,repositoryTopics,createdAt,updatedAt,pushedAt,openGraphImageUrl \
  --jq .[] | reposition --works-num 4
  # 範囲は環境変数で指定(REPOSITION_FILTER_TIME_RANGE)
