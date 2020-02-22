# 2ちゃんねる風掲示板サイト

URL→
https://thread-sample-app.work/


## 機能一覧
- ログイン機能( Remember me 機能付 )
- スレッド閲覧機能
- スレッド投稿機能
- スレッド編集機能
- スレッド削除機能(リプライ同時削除)
- スレッドカテゴリ機能
- リプライ投稿機能
- リプライ削除機能(自身のリプライのみ)
- ユーザープロフィール閲覧機能(自身の情報のみ)
- 未使用カテゴリー自動削除機能( 記事更新時にSQLで未使用のカテゴリを抽出して、DBから削除 )
- ページネーション機能( will_pagenate )

## 以下デプロイ関連
- Docker, docker-composeを使った開発rails環境構築( Nginx, Puma, PostgreSQL)
- AWSを使ったデプロイ(EC2,Docker,docker-composeでコンテナ起動)
- ドメイン設定(お名前.com, Route53)
- Https通信(ALB)
