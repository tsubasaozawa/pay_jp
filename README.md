# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Pay.jp導入手順
# 【カード情報登録編】  
## 0.事前準備  
・deviseの導入 ※今回は詳細は割愛  
・Payjpのアカウント登録 ※登録の手順はpay.jpのサイト(https://pay.jp/)で確認  
・Pay.jpのダッシュボード(https://pay.jp/d/settings)よりAPIキー（テスト秘密鍵とテスト公開鍵）の確認  

## 1.Pay.jpの読み込み設定  
・gem 'payjp'をbundle install  
・application.html.hamlへ以下の記述を追加  
  %script{src: "https://js.pay.jp/", type: "text/javascript"}  

## 2.payjp通信後のカード情報を保管するcardsテーブルの作成  
・$ rails g model cardでcardモデルを作成  
・作成されたマイグレーションファイルに以下の記述を追加  
  t.string :customer_id  
  t.string :card_id  
  t.references :user, foreign_key: true  
・$ rake db:migrateでcardsテーブルを作成  

## 3.cardコントローラを作成し、カード情報を登録・削除するためのアクションを設定  
・$ rails g controller cardでcardコントローラを作成  
・作成されたcardコントローラにアクションを記述  
・アクションで使用するテスト秘密鍵を環境変数として保存するため、gem 'dotenv-rails'をbundle install  
・app直下に「.env」という名称のファイルを作成し、事前準備で確認したテスト秘密鍵を追記    
  記載例）  
   PAYJP_PRIVATE_KEY = 'sk_test_000000000000000000000000'  
・リモートリポジトリに.envファイルが上がらないようgitignoreに以下を追記  
/.env  

## 4.ルーティングの設定  
  cardコントローラに設定したアクションに合わせてルーティングを設定  

## 5.カード情報の登録画面を作成  
・app/view/card/new.html.hamlを作成し、カード情報の登録画面を作成  

## 6.Payjpとの通信を行うためjsファイルを作成  
・gem 'jquery-rails'のbundle install  
・application.jsへ「//= require jquery」を追記  
・app/assets/javascripts/payjp.jsを作成し、トークン情報の取得設定を実施  

## 7.登録済みカード情報の表示（show.html.haml）  

## 8.テストカード情報の登録確認  
Pay.jpのサイト(https://pay.jp/docs/testcard)よりテストカードの情報を確認し、実際に登録できるか確認

# 【商品購入編】  
## 1.purchaseコントローラの作成  
・$ rails g controller purchaseでpurchaseコントローラを作成  
・作成されたcardコントローラにアクションを記述  
## 2.ルーティングの設定  
## 3.ビューの作成  
・show.html.haml  
・done.html.haml  