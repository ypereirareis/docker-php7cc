# Docker image for php7cc

[![Build Status](https://travis-ci.org/ypereirareis/docker-php7cc.svg)](https://travis-ci.org/ypereirareis/docker-php7cc)

## Run

### Build with specific version

```
git clone https://github.com/ypereirareis/docker-php7cc.git && cd docker-php7cc
docker build --build-arg PHP7CC_VERSION_ARG=1.2.0 -t local/php7cc:1.2.0 3.1
docker run -it --rm local/php7cc:1.2.0 php7cc --version
```

### Help

```
docker run -it --rm -v $(pwd):/app ypereirareis/php7cc
docker run -it --rm -v $(pwd):/app ypereirareis/php7cc php7cc -h
```

### Directory

```
docker run -it --rm -v $(pwd):/app ypereirareis/php7cc php7cc ./src

```

## Other tools

```
docker run -it --rm -v $(pwd):/app ypereirareis/php7cc sh
```

