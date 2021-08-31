FROM postgres

# postgres + plpython + サポート用python(pip)
RUN apt-get update \
    && apt-get install -y postgresql-plpython3-13 \
    && apt-get install -y python3 \
    && apt-get install -y python3-pip \
    && apt-get install -y vim

# postgresユーザ設定
RUN mkdir -p /home/postgres \
    && chown postgres /home/postgres \
    && chgrp postgres /home/postgres \
    && chsh -s /bin/bash postgres

# ゴミ掃除
RUN apt-get clean \
    && rm -fr /var/cache/apt/* /var/lib/apt/lists/*

# コンテナ実行時にリッスン
EXPOSE 5432

# pythonライブラリ追加
RUN pip3 install --upgrade pip
RUN pip3 install munkres
RUN pip3 install typing
RUN pip3 install numpy

# ll 設定
RUN echo 'alias ll="ls -l"' > /root/.bash

