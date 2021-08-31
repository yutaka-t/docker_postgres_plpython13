■コンテナ作成
docker-compose -f "docker-compose.yml" up -d --build

■plpython を有効化(コンテナ内で以下のコマンドを実行)
psql -U admin -c "create extension plpython3u;"

■コンテナにアタッチ
docker exec -it postgres /bin/bash

■psql 起動
psql -U admin

■サーバ起動
docker-compose start

■サーバ停止
docker-compose stop

