# アプリ名
## SAMPLE_BULLETINBOARD_APP

## 実装機能
  * ログイン機能 (email + pass)
    * gem:deviseで実装
    * ログインページはBootstrapのモーダルで再現
  * 閲覧・投稿機能
    * 投稿機能はログインユーザーのみ可
  * スレッド機能 (スレッドにレスをつけていくスタイル)
    * 投稿機能はログインユーザーのみ可
    * 非同期通信による投稿機能
    * スレッド自動更新機能
  * カテゴリ(タグ)設定 (スレッドごと / 1つのスレッドに複数付与可能)
    * gem: acts-as-taggable-onで実装
  * 検索機能 (単語 / スレッド及びレスの横断検索)
    * gem: ransackで実装

## デプロイ先とテストアカウント＆ID
- GitHub:https://github.com/issei1213/sample_bulletinboard_app
- デプロイ先:http://18.182.143.52/
- テストアカウント:
  - 1.Email: test@gmail.com / Password: aaaa1111
  - 2.Email: test3@gmail.com / Password: cccc3333

## DEMO
## トップページ
![SAMPLE_BULLETINBOARD_APP_top](https://user-images.githubusercontent.com/59830008/85989857-1a40c080-ba2c-11ea-878f-aeb6661086a6.jpg)

## ユーザ新規登録画面
![新規アカウント作成](https://user-images.githubusercontent.com/59830008/85945894-ad6ded80-b97b-11ea-8297-ea9a4ea75027.jpg)

## ログインページ
![SAMPLE_BULLETINBOARD_APP_login](https://user-images.githubusercontent.com/59830008/85990072-6986f100-ba2c-11ea-9100-711107a4ec44.jpg)

## スレッド投稿画面
![投稿画面](https://user-images.githubusercontent.com/59830008/85945969-2ec58000-b97c-11ea-8444-7bd638f63c69.jpg)

## レス投稿画面
![result](https://user-images.githubusercontent.com/59830008/86021288-e71a2380-ba63-11ea-8339-aff10e27f4b3.gif)

## スレッド詳細画面
![result](https://user-images.githubusercontent.com/59830008/86020601-14b29d00-ba63-11ea-8072-ee0f566a1176.gif)


## 使用技術概要
  - 言語：Haml / SCSS / Ruby / jQuery
  - フレームワーク：Ruby on Rails
  - DB：mysql
  - 開発環境：Docker
  - 本番環境：AWS

## 使用技術詳細
![エンジニア向けテスト](https://user-images.githubusercontent.com/59830008/85945656-371cbb80-b97a-11ea-95bf-00d58c16cf0c.jpg)

## DB設計
![sample_bulletinboard_app_er](https://user-images.githubusercontent.com/59830008/85945515-4bac8400-b979-11ea-950b-075a4ae38cf0.jpg)


## システム構成図
![sample_bulletinboard_app_aws](https://user-images.githubusercontent.com/59830008/85945521-56ffaf80-b979-11ea-893f-1fd608563e45.jpg)

