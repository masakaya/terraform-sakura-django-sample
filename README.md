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

### ansibleの実行と設定

## クレデンシャルな情報の暗号化

```bash
# varsファイルの暗号化
ansible-vault encrypt ./ansible/roles/db/vars/root.yml --vault-pass-file ./ansible/vault-password.txt
# varsファイルを復号してplaybookを実行
ansible-playbook -i  inventory.yml ./ansible/playbook.yml --vault-pass-file ./ansible/vault-password.txt
```

## ウェブサーバーのスケール方法

以下の理由により、terraform + ansibleによる
- クラウドプロバイダのスケールにかかる時間(10分)
- プロダクトの特性上、急激なスパイクは発生しない

1. `variable.tf`にて以下の設定を修正する
   - `server_count`
2. `terraform apply`を実行する
3. `ansible-playbook`コマンドを実行する

## DBサーバーのリストア手順

データベースサーバーはデイリーでバックアップを取っており、１日前までのデータの復旧は可能となっている。
以下にデータベースサーバーのリストア手順を明記する。

1. DBをterraform/ansibleの除外設定を行う

- リストアしたデータベースサーバーはterraformの管理外となる。
- 破損元のデータベースサーバー削除後に`terraform apply`を再実行するとDBサーバーが再作成されてしまう。以下のコマンドでデータベースサーバーの除外設定を行うこと

```
terraform state rm 'module.server["db"]'
terraform state rm 'ansible_host.servers["db"]'
```

2. データベースサーバーのバックアップの確認
  - 「ストレージ > アーカイブ」リストアしたいアーカイブを確認すること

3. データベースサーバーのリスト
   1. 「サーバー > 追加」にて以下の設定を行う
     - サーバープラン：任意のもの
     - ディスク
       - ディスクソース：マイアーカイブ
       - マイアーカイブ選択：リストアしたいアーカイブを指定
       - ディスクサイズ：任意
       - ディスク暗号化：任意（※自動バックアップを行う場合は暗号化はできないため注意）
       - その他：デフォルトの設定
     - NIC
       - スイッチに接続（routerを設定）
       - パケットフィルタ：選択（データベースサーバー用のパケットフィルタを選択）
     - ディスク修正：チェック
       - IPアドレス：データベースサーバーのIPに変更する
       - 公開鍵：クラウドアカウントから選択（データベースサーバのSSH鍵を指定する）
       - スタートアップスクリプト
         - shell (データベースサーバ用のスクリプトを選択)
     - サーバー情報：任意（わかりやすい名前にすること）

4. 「作成」をクリック
5. NICの設定
   1. サーバーをシャットダウン
   2. NICタブ > 「追加」
   3. 「編集」 > NIC スイッチに接続（nfs用のスイッチに接続）
   4. パケットフィルタ「local用のフィルタ」を指定
   5. サーバーを起動し`sudo netplan apply`を実行
   6. `ip a`にて`eth1`が追加されていることを確認する

### 注意点
IPアドレスが重複するため、DBをリストアする場合は元のデータベースサーバーをシャットダウン（or 削除）した状態にしてください。

## トラブルシューティング

### 監視サーバー（zabbix）にて4xxエラーの場合

初回セットアップ時、zabbixサーバーを起動すると、
`nginx`にてエラーを返す場合があるそうした場合は以下の手順を実行すること

1. `mng`サーバーへログインする
2. 以下のコマンドを実行する
   1. `sudo systemctl restart nginx`

### データベースサーバーを誤ってterraform管理外にしてしまった場合の復旧方法

以下のコマンドを実行して、terraformの管理下に配置する。

```
 terraform import 'module.server["db"].sakuracloud_disk.main' 'サーバー > ディスク > リソースID'
 terraform import 'module.server["db"].sakuracloud_note.netplan_setup `リソースマネージャ > スクリプト > netplan-setup-script-dbのリソースID`'
terraform import 'module.server["db"].sakuracloud_server.main'
 'サーバー > 情報 > リソースID'
 terraform apply
 ```