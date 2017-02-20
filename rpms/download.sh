GITHUB="https://github.com/tukiyo/php5.3-enable-zend-multibyte.el6/releases/download/centos6"

for i in \
 php-5.3.3-47.el6.x86_64.rpm \
 php-bcmath-5.3.3-47.el6.x86_64.rpm \
 php-cli-5.3.3-47.el6.x86_64.rpm \
 php-common-5.3.3-47.el6.x86_64.rpm \
 php-dba-5.3.3-47.el6.x86_64.rpm \
 php-debuginfo-5.3.3-47.el6.x86_64.rpm \
 php-devel-5.3.3-47.el6.x86_64.rpm \
 php-embedded-5.3.3-47.el6.x86_64.rpm \
 php-enchant-5.3.3-47.el6.x86_64.rpm \
 php-fpm-5.3.3-47.el6.x86_64.rpm \
 php-gd-5.3.3-47.el6.x86_64.rpm \
 php-imap-5.3.3-47.el6.x86_64.rpm \
 php-intl-5.3.3-47.el6.x86_64.rpm \
 php-ldap-5.3.3-47.el6.x86_64.rpm \
 php-mbstring-5.3.3-47.el6.x86_64.rpm \
 php-mysql-5.3.3-47.el6.x86_64.rpm \
 php-odbc-5.3.3-47.el6.x86_64.rpm \
 php-pdo-5.3.3-47.el6.x86_64.rpm \
 php-pgsql-5.3.3-47.el6.x86_64.rpm \
 php-process-5.3.3-47.el6.x86_64.rpm \
 php-pspell-5.3.3-47.el6.x86_64.rpm \
 php-recode-5.3.3-47.el6.x86_64.rpm \
 php-snmp-5.3.3-47.el6.x86_64.rpm \
 php-soap-5.3.3-47.el6.x86_64.rpm \
 php-tidy-5.3.3-47.el6.x86_64.rpm \
 php-xml-5.3.3-47.el6.x86_64.rpm \
 php-xmlrpc-5.3.3-47.el6.x86_64.rpm \
 php-zts-5.3.3-47.el6.x86_64.rpm \
 \
 local-flex-2.5.4-1.x86_64.rpm \
 local-re2c-0.16-1.x86_64.rpm
do
 wget "$GITHUB"/"$i"
done
