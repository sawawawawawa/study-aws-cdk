# Javaで始めるAWS CDK

## AWS CDKとは？

## 必要な物

- AWS アカウント
- node.js (14.15.0以上)
- JDK8以上
- Apache Maven 3.5以上
- AWS CDK

## 準備

node.js, JDK, Apache Mavenは省略...

### AWS CDKをインストールする

```
npm install -g aws-cdk
```

## 環境

```
Microsoft Windows [Version 10.0.22621.1992]
(c) Microsoft Corporation. All rights reserved.

>node -v
v16.17.1

>java -version
openjdk version "11.0.2" 2019-01-15
OpenJDK Runtime Environment 18.9 (build 11.0.2+9)
OpenJDK 64-Bit Server VM 18.9 (build 11.0.2+9, mixed mode)

>mvn -v
Apache Maven 3.9.3 (21122926829f1ead511c958d89bd2f672198ae9f)

>cdk --version
2.89.0 (build 2ad6683)
```



## アプリを作る

```
mkdir hello-cdk
cd hello-cdk
cdk init app --language java
```

gitをインストールしている場合、```cdk init```するとgitリポジトリとしても初期化される。

## アプリをビルドする

AWS CDKでは、Toolkitがやってくれるので厳密にはビルドを実行する必要がない。
構文チェックなどのために、いつでも手動でビルドすることができる。

```
mvn compile -q
```

```-q```オプションはエラー以外の出力を抑制する。

## アプリ内のスタックのリストを表示する

```
cdk ls
```


## Amazon S3 バケットを追加する

HelloCdkStackクラスのコンストラクタに下記を追記する。

```
Bucket.Builder.create(this, "MyFirstBucket")
        .versioned(true).build();
```

Amazon S3 バケットは3つのパラメーターを受け取る。
- scope: 上記ではスタック(this)を渡している。スタックの下に階層的に位置することを意味する。
- ID: AWS CDK内の論理ID。デプロイ時に、定義内容の変更を更新するために必要。
- props: プロパティを定義するもの。上記では versioned (バージョン管理を可能にする)をtrueに設定している。

どのコンストラクトも上記3つのパラメータを引数に取る。

## AWS CloudFormation テンプレートを合成する

```
cdk synth
```

アプリに複数のスタックが含まれている場合はスタックを指定する必要がある。

```
cdk synth HelloCdkStack
```

デフォルトでYAML出力されるが、JSON出力も可能。

```
cdk synth -j
```


デプロイの前に```cdk synth```を明示的に実行する必要はない。
デプロイの前にテンプレートを確認したいときなどに有効。

## スタックをデプロイする

```
cdk deploy
```

アプリに複数のスタックが含まれている場合はスタックを指定する必要がある。

```
cdk deploy HelloCdkStack
```

