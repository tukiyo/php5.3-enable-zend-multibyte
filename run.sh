IMAGE="centos:6"
IMAGE="tukiyo/php53el6"
docker run --rm -v `pwd`:/host/  -it $IMAGE /bin/bash
