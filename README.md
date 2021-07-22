# Videoapp
## サービス概要
好きな映画、ドラマ、アニメを共有できるアプリです。  

※注意 GoogleChromeで   はアクセスできない可能性があり ます。safariなどのブラウザをおすすめ致します。

  URL:http://35.75.160.225
<img width="1158" alt="スクリーンショット 2021-07-16 9 52 09" src="https://user-images.githubusercontent.com/71161216/125875669-973f329d-31c0-4f98-85c5-9918668e910a.png">
コロナ禍により、多くの人たちが自宅での巣ごもり生活をしています。そんな生活の中で動画配信サービスを利用する人たちが増加しています。自分が見た面白い作品をシェアして、知らなかった作品に触れ、楽しんでもらえることを目的としています。
***
## 使い方
共有したい作品のURLコピー方法
![videoapp2](https://user-images.githubusercontent.com/71161216/126582577-7baaafb8-f0cc-490d-8e5b-0a0821729b05.gif)

***
## 今後追加したい機能
* いいね一覧機能
* いいねランキング
* コメント返信機能
***
## 注意事項
 * タイトルと動画の内容が著しく異なる場合は投稿を削除する 場合がございます。
 * コメントでの誹謗中傷を行ったユーザーはアカウントを削除します
 * 違法にアップロードされた動画を貼り付けた場合は、投稿を削除します
***

## 機能一覧
 * ユーザー登録、ログイン(devise)
 * ゲストユーザーログイン機能
 * 投稿機能
 * いいね機能(ajax)
 * コメント機能
 * ページネーション(kaminari)
 * レスポンシブデザイン
 * 管理者機能(rails_admin)
 ***
## インフラ(AWS)
* VPC
* EC2
* RDS


***

## バックエンド
* Ruby 2.7.1
* Rails 2.6.3
* PostgreSQL 11.0
***
## フロントエンド
* Bootstrap4
***
## 開発
* VSCode
* Docker Desktop for Mac
* docker-compose
***
## 使用Image
* ruby2.7.1
* postgres
***

## バージョン管理
* Git
* GitHub
***
## テスト
* Rspec,Capybara,FactoryBot
* 単体テスト
* 統合テスト(FeatureSpec)
Githubにpushした際、CircleCIによる自動テスト
***
## ER図
<img width="710" alt="スクリーンショット 2021-07-17 8 00 08" src="https://user-images.githubusercontent.com/71161216/126020963-46cd94e4-ef14-41cd-b49b-da9da9797380.png">
