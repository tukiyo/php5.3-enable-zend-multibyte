BASE="https://github.com/tukiyo/php5.3-enable-zend-multibyte/releases/download/source"

for i in  \
php-5.3.3-47.el6.src.rpm
do
wget "$BASE"/"$i"
done
