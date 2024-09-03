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
  # terraform用
  ansible-galaxy collection install cloud.terraform
  # zabbix用
  ansible-galaxy collection install community.zabbix
  ```

## 実行
- 以下でさくらのS3へアクセスするためのクレデンシャル情報を設定する
  1. `cp envfile.example envfile` オブジェクトストレージ作成時のアクセスキーを設定する
  2. `source envfile` 設定ファイルを環境変数に展開する

- terraformを実行する：terraformを実行するには、以下の手順を行います。
  1. `cd terraform/environment/dev` で対象のディレクトリに移動します。
  2. `terraform init` で初期化します。
  3. `terraform apply` でリソースを作成します。

## コマンドについて

### usage
```
❯ make
Available targets:
  run-dev     - Start the development server
  run-prod    - Start the production server
```

### dev環境の起動

```
make run-dev
```

### prod環境の起動
プロダクションサーバー起動を実施する。Nginxを使わずに`80`ポートで動作させる。
`1024`ポートより小さなポートにbindする場合は`authbind`が必要なため、以下の手順でインストールする

※JSファイル、CSSファイル、画像のキャッシュが必要な場合はNginxまたはCDN(GSLB)の利用を検討する。

また、SaaS(不特定多数の人がアクセスする)場合実装時にてJS、CSSのキャッシュ対応を入れないとリリース後のバグとなってしまうため、ローンチが落ち着くまでは静的キャッシュを入れないほうインフラを推奨する。
```
# 初回のみ
sudo apt install authbind
```

```
make run-prod
```