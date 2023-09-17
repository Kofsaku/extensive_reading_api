FROM ruby:3.2.1

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# ワーキングディレクトリの作成
WORKDIR /extensive_reading_api

# GemfileとGemfile.lockをコピーしてbundle install
COPY Gemfile /extensive_reading_api/Gemfile
COPY Gemfile.lock /extensive_reading_api/Gemfile.lock
RUN bundle install

# ポートを公開
EXPOSE 3000

# コマンドの設定
CMD ["rails", "server", "-b", "0.0.0.0"]
