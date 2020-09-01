# README
![freephoto-site-1-1](https://user-images.githubusercontent.com/67891642/91828455-1f63fb00-ec7b-11ea-9ea6-e055fc046581.jpg)

・アプリ名
kanban

・概要(このアプリでできることを書いて下さい)
タスクの管理、いいね!ボタンでリストの確認、リスト作成、リスト編集、リスト削除、カード作成、カード編集（カード移動）、カード削除、グループ作成、グループ編集、グループ削除、deviseを使ったログイン機能、ログアウト機能、ユーザー削除、パスワード変更、ユーザー名変更、新規登録

・本番環境(デプロイ先　テストアカウント＆ID)
本番環境デプロイ先　https://enigmatic-headland-21063.herokuapp.com/
テストアカウント＆ID　アカウント名test1　password 1234567

・制作背景(意図)
　⇒どんな課題や不便なことを解決するためにこのアプリを作ったのか。
前職でよく使っていたのがTo Doアプリでした。私自身もプログラミングを知らない時は便利でいいなと思っていて、周りの従業員の数人もアップデートで新しい機能が使えるようになるたびに便利でいいなと話していました。そしてプログラミングを知ってから私も使い勝手がいいTo Doアプリを作ってみたいと思うのと、まだ、知らない機能などを使ってこのアプリを誰が使っても使いやすいと言われるようなアプリにしていきたいと思います。

・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
　⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。
トップページ画面
https://gyazo.com/b470f5496a58d2a810a77f1c5eb97371
カード作成画面
https://gyazo.com/7af7f53a31c68a709f23e2a973009edc
カード作成後のトップページ画面
https://gyazo.com/ecf7c2c9abaab89fe721ecfc400408b1
リスト作成画面の遷移
https://gyazo.com/d72e7dd84a197ec2aad27401f06f5d59
リスト作成後画面の遷移
https://gyazo.com/a566acfba571c6c8c66ab0e2f72fb30a

・工夫したポイント
全体的にわかりやすいというのを目標に作りました。classの名前の多様を抑え似た形のビューにし無駄なコードの記述を少なくしました。いいね!ボタンの実装もしました。どのリストにいいねが付けられているかすぐに分かるようトップページに表示しました。見た目もシンプルで見やすく、使いやすいを目標に作りました。

・使用技術(開発環境)
heroku, postgresSQL, Ruby, Ruby on rails, scss, GitHub,HTML,CSS

・課題や今後実装したい機能
javascriptを使った非同期通信でドラック&ドロップ操作でカードの移動や、カードの順番の入れ替えや期限、共有などの機能を実装していきたいです。

・DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|default: ""|
|email|string|null: false|unique: true|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :cards, dependent: :destroy
- has_many :lists, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :group_users
- has_many :groups, through: :group_users

## listsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|user_id|integer|null: false|index_lists_on_user_id|
### Association
- belongs_to :user
- has_many :cards, dependent: :destroy
- has_many :favorites, dependent: :destroy

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|limit: 255|
|memo|text|limit: 1000|
### Association
- belongs_to :list
- has_many :users, through: :favorites

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|optional: true|
|list_id|integer|optional: true|
### Association
- belongs_to :user, optional: true
- belongs_to :list, optional: true

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name|index|unique: true|
### Association
- has_many :group_users
- has_many :users, through: :group_users

### group_userテーブル
|group_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
### Association
- has_many :group_users
- has_many :users, through: :group_users

test