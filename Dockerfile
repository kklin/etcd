FROM quay.io/coreos/etcd:v3.0.2
Maintainer Zhongtian Wang

COPY start.go /

RUN apt-get -y update \
&& apt-get install -y golang-go \
&& go build /start.go \
&& apt-get remove --purge -y golang-go $(apt-mark showauto) \
&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/start"]
