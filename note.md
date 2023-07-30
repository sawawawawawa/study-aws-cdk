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

