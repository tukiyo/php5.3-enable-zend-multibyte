FROM centos:6

ENV BUILDROOT="/root/rpmbuild"
RUN yum install -y -q gcc gcc-c++ glibc-devel ncurses-devel make rpm-build wget which \
 && yum clean all
WORKDIR $BUILDROOT/SOURCES
COPY files .
RUN groupadd mockbuild \
 && useradd -g mockbuild mockbuild
RUN mkdir -p /root/rpmbuild/SPECS /root/rpmbuild/SOURCES \
 && rpm -ivh php-5.3.3-47.el6.src.rpm \
 && sed -i \
 -e "s@--with-system-tzdata@--with-system-tzdata --enable-zend-multibyte --with-mysql=shared,/opt/mysql --with-pdo-mysql=shared,/opt/mysql@g" \
 "/root/rpmbuild/SPECS/php.spec"

RUN yum install -y -q \
 libedit-devel libtool-ltdl-devel libtidy-devel recode-devel libicu-devel enchant-devel \
 bzip2-devel curl-devel db4-devel gmp-devel httpd-devel pam-devel openssl-devel \
 sqlite-devel zlib-devel pcre-devel smtpdaemon libtool krb5-devel libc-client-devel \
 cyrus-sasl-devel openldap-devel mysql-devel postgresql-devel unixODBC-devel libxml2-devel \
 net-snmp-devel libxslt-devel libxml2-devel libXpm-devel libjpeg-devel libpng-devel freetype-devel aspell-devel bison \
 && yum clean all

#-------------
# checkinstall
#-------------
RUN yum install -y -q gettext \
 && rpm -ivh checkinstall-20150420-1.x86_64.rpm \
 && ln -s /usr/local/lib/installwatch.so /usr/local/lib64/installwatch.so

#---------
# mysql
#---------
RUN tar xzf mysql-4.0.30.tar.gz \
 && cd "$BUILDROOT/SOURCES/mysql-4.0.30" \
 && ./configure --prefix=/opt/mysql --with-charset=ujis --with-extra-charsets=sjis --quiet \
 && make -s \
 && make install \
 && ln -s /opt/mysql/lib /opt/mysql/lib64 \
 && checkinstall -y -R --pkgname=opt-mysql4
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

RUN rpmbuild -ba "/root/rpmbuild/SPECS/php.spec"


#---------
# local-pear
#---------
RUN /usr/local/php/bin/pear install DB-1.7.14 \
 && /usr/local/php/bin/pear install Var_Dump

WORKDIR /usr/local
RUN tar czf $BUILDROOT/SOURCES/local-pear.tar.gz pear php/bin/pear php/bin/peardev php/bin/gen_php_doc.sh \
 && tar xzf $BUILDROOT/SOURCES/local-pear.tar.gz -C $BUILDROOT/BUILD/

WORKDIR $BUILDROOT/
RUN mv $BUILDROOT/SOURCES/local-pear.spec $BUILDROOT/SPECS/ \
 && rpmbuild -ba SPECS/local-pear.spec

#---------
# resuilt
#---------
RUN sh -c "find . | grep \.rpm$ | xargs ls -lh"
