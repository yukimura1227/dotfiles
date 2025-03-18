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
PRS=$(gh pr list --state all --repo "$REPO" --search "created:$DATE_FROM..$DATE_TO sort:created-asc" --json number,title,url,createdAt,author,state --limit 2000)

# 結果を格納する配列
RESULT="[]"

# 各PRに対して処理
echo "$PRS" | jq -c '.[]' | while read -r pr; do
  echo "$pr" | jq -r '[.number, .title, .url, .createdAt, .author.login, .state] | @csv' >> ${OUTPUT_FILE}
  PR_NUMBER=$(echo "$pr" | jq -r '.number')
  echo "PR #${PR_NUMBER} のコメントを取得中: $(echo "$pr" | jq -r '.title')..."

  gh pr view ${PR_NUMBER} --repo "${REPO}" --json comments | jq '.comments[] | [.author.login, .body, .createdAt, .url] | @csv' >> ${OUTPUT_FILE}

  # CREATED_AT=$(echo "$pr" | jq -r '.createdAt' | sed 's/Z/+00:00/' | date -f - '+%Y-%m-%d %H:%M:%S' 2>/dev/null || echo "$pr" | jq -r '.createdAt')

  # # PRとコメントを結合
  # FORMATTED_PR=$(echo "$pr" | jq --arg created_at "$CREATED_AT" \
  #   '{
  #     number: .number,
  #     title: .title,
  #     url: .url,
  #     created_at: $created_at,
  #     author: .author.login,
  #     state: .state,
  #     comments: []
  #   }')

  # # コメントがある場合は追加
  # if [ "$(echo "$PR_COMMENTS" | jq '.comments | length')" -gt 0 ]; then
  #   FORMATTED_PR=$(echo "$FORMATTED_PR" | jq --argjson comments "$(echo "$PR_COMMENTS" | jq '[.comments[] | {
  #     author: .author.login,
  #     body: .body,
  #     created_at: (.createdAt | gsub("Z"; "+00:00") | strptime("%Y-%m-%dT%H:%M:%S%z") | strftime("%Y-%m-%d %H:%M:%S"))
  #   }]')" '.comments = $comments')
  # fi

  # 結果に追加（一時ファイルを使用）
  # TMP_FILE=$(mktemp)
  # echo "$RESULT" | jq --argjson pr "$FORMATTED_PR" '. += [$pr]' > "$TMP_FILE"
  # RESULT=$(cat "$TMP_FILE")
  # rm "$TMP_FILE"

  # APIレート制限を考慮して少し待機
  sleep 0.1
done

cat ${OUTPUT_FILE}
# 結果を出力
# if [ -n "$OUTPUT_FILE" ]; then
#   echo "$RESULT" | jq '.' > "$OUTPUT_FILE"
#   echo "$(echo "$RESULT" | jq '. | length') 件のPull Requestを $OUTPUT_FILE に保存しました"
# else
#   echo "$RESULT" | jq '.'
# fi
