# 2ちゃんねる風掲示板サイト

## サイトURL
https://thread-sample-app.work/

## デモ動画
[デモ動画](https://youtu.be/MaVBSDVPY20)でアプリの概要が１分で確認できます。

## 機能一覧
- ログイン機能( Remember me 機能付 )
- スレッド閲覧機能
- スレッド投稿機能
- スレッド編集機能
- スレッド削除機能(リプライ同時削除)
- スレッドカテゴリ追加
- スレッド検索機能(スレッド名、リプライの内容を横断検索)
- カテゴリ別スレッド表示
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
