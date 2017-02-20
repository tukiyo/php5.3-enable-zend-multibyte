export BUILD="docker build . --no-cache=false -f "

$BUILD Dockerfile -t tukiyo/php53el6
