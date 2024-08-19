# terraform-sakura-django-sample

## 基本情報

- OS : ubuntu 24.04

## ツール
- tfenv : tfenvは、Terraformのバージョン管理ツールで、複数のTerraformバージョンを簡単にインストール・切り替えができます。
- ansible : Ansibleは、IT自動化ツールで、構成管理やアプリケーションデプロイを簡素化します。
- usacloud : さくらのクラウドを操作するCLIツール。認証情報はusacloudに設定したprofileを利用します。

## 設定
- terraformのインストール : tfenvを用いたTerraformのインストール方法は以下の通りです。
  1. tfenvをインストールします。
  2. `.terraform-version` ファイルに指定したバージョンを記述します。
  3. `tfenv install` コマンドで指定したバージョンのTerraformをインストールします。
  4. `tfenv use` でインストールしたバージョンを使用します。

- ansible-galaxy を使って cloud.terraformを入れる
  ```bash
  ansible-galaxy collection install cloud.terraform
  ```

## 実行
- 以下でさくらのS3へアクセスするためのクレデンシャル情報を設定する
  1. `cp envfile.example envfile` オブジェクトストレージ作成時のアクセスキーを設定する
  2. `source envfile` 設定ファイルを環境変数に展開する

- terraformを実行する：terraformを実行するには、以下の手順を行います。
  1. `cd terraform/environment/dev` で対象のディレクトリに移動します。
  2. `terraform init` で初期化します。
  3. `terraform apply` でリソースを作成します。