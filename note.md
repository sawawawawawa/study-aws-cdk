https://aws.amazon.com/jp/cdk/
https://qiita.com/Brutus/items/6c8d9bfaab7af53d154a

## 重要なコンセプト

3つの階層で表現されている。
APP - stack - construct

APPは対応言語で記述される
APPはAWSインフラを定義する
APPは1つ以上のstackを定義する
stackはAWS cloudformationのスタックに相当する
stackはconstructを含む
constructはS3、Lambda、DynamoDBなどの具体的なAWSリソースを定義します
アプリ、スタック、コンストラクトは選択した言語のクラスとして表現される

CDK Toolkit と呼ばれるコマンドラインツールでアプリとスタックを操作する。
CDK ToolkitでAWS CDK スタックを AWS Cloudformation テンプレートに変換する。
CDK ToolkitでスタックをAWSにデプロイする。


CDKのメインのライブラリはaws-cdk-libと呼ばれる。
aws-cdk-libは各AWSサービスのコンストラクトを含んでいる。

コンストラクトには3つの種類がある。

### AWS CloudFormationのみ(L1)

コンストラクトはAWS CloudFormationで定義されたリソースと直接対応する。
常にCfnで始まる名前を持つ。
例えば、CfnBucketはAmazon S3バケットのL1コンストラクトである。

L1リソースはすべてaws-cdk-libに含まれている。

### キュレーション(L2)

コンストラクトは特定のユースケースに対応する。
コンストラクトはL1リソースをカプセル化し、賢明なデフォルトとベストプラクティスのセキュリティポリシーを提供する
コンストラクトはAWS CDKチームによって慎重に開発されている。
例えば、BucketはAmazon S3バケットのL2構造体である。

aws-cdk-libには、安定したL2コンストラクトが含まれている。
開発中のL2コンストラクトはexperimentialと指定され、別のモジュールで提供される。


### パターン(L3)

コンストラクトは特定のユースケースのためのAWSアーキテクチャ全体を作成するために、複数のリソースを宣言する。

L2コンストラクトと同様に、安定板はaws-cdk-libに含まれ、開発中の物は別モジュールで提供される。


## サポートされているプログラミング言語

- TypeScript
- JavaScript
- Python
- Java
- C#
- Go

AWS CDKはTypeScriptで実装されている。
その他の言語はJSIIを使って言語バインディングを生成している。

[Working with the AWS CDK in Java](https://docs.aws.amazon.com/cdk/v2/guide/work-with-cdk-java.html)

TypeScriptはAWS CDKが最初にサポートした言語。
多くとサンプルはTypeScriptで記述されている。

[Translatting TypeScript AWS CDK code to other languages](https://docs.aws.amazon.com/cdk/v2/guide/multiple_languages.html)

## 前提条件

どの言語を使うにしても node.js (14.15.0以上) が必要。
その他の前提条件は使用する言語に依存する。

### Javaの前提条件

- JDK8以上
- Apache Maven 3.5以上

## AWSとの認証

詳細はこちらを参照。
[Authentication and access](https://docs.aws.amazon.com/sdkref/latest/guide/access.html)

### 推奨されるアプローチ

AWS IAM Identity Centerをセットアップする。
この方法を選択する場合、[IAM identity center autentication](https://docs.aws.amazon.com/sdkref/latest/guide/access-sso.html)の手順を完了した後、以下の要素が環境に含まれている必要がある。

- AWS CLI
- [defaut]プロファイルを持つ[共有AWSconfigファイル](https://docs.aws.amazon.com/sdkref/latest/guide/file-format.html)
- リージョン設定
- IAM indentity centerの権限セットに接続されたIAMロール(sso_role_name)
    - アプリケーションで使用するAWSサービスへのアクセスを許可する必要がある

サンプル
```
[default]
sso_session = my-sso
sso_account_id = 111122223333
sso_role_name = SampleRole
region = us-east-1
output = json

[sso-session my-sso]
sso_region = us-east-1
sso_start_url = https://provided-domain.awsapps.com/start
sso_registration_scopes = sso:account:access
```

AWS CDKはプロファイルのSSOトークンプロバイダ設定を使用して認証情報を取得する。

## AWS アクセスポータルセッションの開始

AWS CDKがIAM Identity Center認証を使用して認証情報を解決するには、アクティブなAWSアクセスポータルセッションが必要。
AWS CLIで次のコマンドを実行し、AWSアクセスポータルにサインインする。

```
aws sso login
```

すでにアクティブなセッションがあるかどうかを確認するには下記コマンドを実行する。

```
aws sts get-caller-identity
```

## AWS CDKをインストールする

```
npm install -g aws-cdk
```

バージョンを確認する。
```
cdk --version
```


## ブートストラップ

AWS CDKでスタックをデプロイするには、デプロイ中にAWS CloudFormationが利用できる専用のS3バケットやその他のコンテナが必要。
これらを作成することをブートストラップと呼ぶ。
```
cdk bootstrap aws://$ACCOUNT_NUMBER/$REGION
```

## AWS CDK tools

```
cdk --help
```

