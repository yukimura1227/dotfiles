#!/bin/bash

set -e

# ヘルプメッセージを表示する関数
show_help() {
  cat << EOF
使用法: $0 <リポジトリ名> <開始日> <終了日>

引数:
  リポジトリ名  - 「オーナー/リポジトリ」形式のリポジトリ名 (例: octocat/hello-world)
  開始日       - YYYY-MM-DD形式の開始日
  終了日       - YYYY-MM-DD形式の終了日

例:
  $0 octocat/hello-world 2023-01-01 2023-01-31
例2(MacOSで昨日のコメントを取得する):
  DAY=\$(date -v -1d '+%Y-%m-%d'); sh pull_request_comments.sh octocat/hello-world \${DAY} \${DAY}
例2(Linux上で昨日のコメントを取得する):
  DAY=\$(date --date '1 day ago' '+%Y-%m-%d'); sh pull_request_comments.sh octocat/hello-world \${DAY} \${DAY}
EOF
  exit 1
}

check_command_exists() {
  command -v $1 >/dev/null 2>&1 || { echo >&2 "エラー: $1 コマンドが見つかりません。インストールしてください。"; exit 1; }
}

check_command_exists gh
check_command_exists jq

if [ $# -lt 3 ]; then
  show_help
fi

REPO="$1"
DATE_FROM="$2"
DATE_TO="$3"
OUTPUT_FILE="${DATE_FROM}_${DATE_TO}_$(basename $REPO).csv"

rm -f ${OUTPUT_FILE}

echo "リポジトリ '$REPO' から $DATE_FROM から $DATE_TO までのPull Requestを取得中..."

# PRのリストを取得
PRS=$(gh pr list --state all --repo "$REPO" --search "updated:$DATE_FROM..$DATE_TO sort:created-asc" --json number,title,url,createdAt,author,state --limit 2000)

# 各PRに対して処理
echo "$PRS" | jq -c '.[]' | while read -r pr; do
  echo "$pr" | jq -r '[.number, .title, .url, .createdAt, .author.login, .state] | @csv' >> ${OUTPUT_FILE}
  PR_NUMBER=$(echo "$pr" | jq -r '.number')
  echo "PR #${PR_NUMBER} のコメントを取得中: $(echo "$pr" | jq -r '.title')..."

  echo $(gh pr view ${PR_NUMBER} --repo "${REPO}" --json comments | jq '.comments[] | [.author.login, .body, .createdAt, .url]')
  gh pr view ${PR_NUMBER} --repo "${REPO}" --json comments | jq '.comments[] | [.author.login, .body, .createdAt, .url] | @csv' >> ${OUTPUT_FILE}

  sleep 0.1
done
