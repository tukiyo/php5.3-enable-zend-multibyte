FROM centos:6

ENV PACKAGES="gcc gcc-c++ glibc-devel ncurses-devel make rpm-build wget which"
RUN yum install -y -q $PACKAGES && yum clean all
COPY php-5.3.3-47.el6.src.rpm .
RUN mkdir -p /root/rpmbuild/SPECS /root/rpmbuild/SOURCES \
 && rpm -ivh php-5.3.3-47.el6.src.rpm \
 && sed -i \
 -e "s@--with-system-tzdata@--with-system-tzdata --enable-zend-multibyte@g" \
 "/root/rpmbuild/SPECS/php.spec"

ENV PACKAGES="libedit-devel libtool-ltdl-devel libtidy-devel recode-devel libicu-devel enchant-devel"
ENV PACKAGES="$PACKAGES bzip2-devel curl-devel db4-devel gmp-devel httpd-devel pam-devel openssl-devel sqlite-devel zlib-devel pcre-devel smtpdaemon libtool krb5-devel libc-client-devel cyrus-sasl-devel openldap-devel mysql-devel postgresql-devel unixODBC-devel libxml2-devel net-snmp-devel libxslt-devel libxml2-devel libXpm-devel libjpeg-devel libpng-devel freetype-devel aspell-devel"
ENV PACKAGES="$PACKAGES bison re2c"
RUN yum install -y -q $PACKAGES && yum clean all

WORKDIR /usr/local/src
COPY files .
#-------------
# checkinstall
#-------------
RUN yum install -y -q gettext \
 && rpm -ivh checkinstall-20150420-1.x86_64.rpm \
 && ln -s /usr/local/lib/installwatch.so /usr/local/lib64/installwatch.so
#-----
# re2c
#-----
# phpの./configureでre2cのPATH指定方法がわからなかったため--prefixは指定していません
RUN tar xzf re2c-0.16.tar.gz \
 && cd re2c-0.16 \
 && ./configure \
 && make -s \
 && make install \
 && checkinstall -y -R --pkgname=local-re2c
#-----
# lemon
#-----
RUN gcc -o /usr/local/bin/lemon lemon.c
#-----
# flex
#-----
RUN tar xzf flex-2.5.4a.tar.gz \
 && cd flex-2.5.4 \
 && ./configure \
 && make -s \
 && make install \
 && checkinstall -y -R --pkgname=local-flex

RUN groupadd mockbuild \
 && useradd -g mockbuild mockbuild \
 && rpmbuild -ba "/root/rpmbuild/SPECS/php.spec"
