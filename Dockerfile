FROM centos:6

ENV PACKAGES="gcc gcc-c++ glibc-devel ncurses-devel make rpm-build wget which"
RUN yum install -y -q $PACKAGES && yum clean all \
  && install -d /root/rpmbuild/SPECS /root/rpmbuild/SOURCES

#ENV PACKAGES="yum-utils"
#RUN yum install -y -q $PACKAGES && yum clean all
#COPY srpm/CentOS-Source.repo /etc/yum.repo.d/
#RUN yumdownloader --source --enablerepo=source php

COPY srpm/php-5.3.3-47.el6.src.rpm .

RUN rpm -ivh php-5.3.3-47.el6.src.rpm
RUN sed -i -e "s@--with-system-tzdata@--with-system-tzdata --enable-zend-multibyte@g" "/root/rpmbuild/SPECS/php.spec"

#ENV PACKAGES="aspell-devel bzip2-devel bzip2-libs-devel curl-devel cyrus-sasl-devel db4-devel e2fsprogs-libs-devel expat-devel file-devel freetype-devel gd-devel gmp-devel httpd-devel krb5-devel krb5-libs-devel libc-client-devel libidn-devel libjpeg-devel libpng-devel libtool libxml2-devel libxslt-devel mysql-devel net-snmp-devel openldap-devel openssl-devel pam-devel pcre-devel postgresql-devel smtpdaemon sqlite-devel unixODBC-devel zlib-devel"
#ENV PACKAGES="$PACKAGES bison flex"
ENV PACKAGES="libedit-devel libtool-ltdl-devel libtidy-devel recode-devel libicu-devel enchant-devel"
ENV PACKAGES="$PACKAGES bzip2-devel curl-devel db4-devel gmp-devel httpd-devel pam-devel openssl-devel sqlite-devel zlib-devel pcre-devel smtpdaemon libtool krb5-devel libc-client-devel cyrus-sasl-devel openldap-devel mysql-devel postgresql-devel unixODBC-devel libxml2-devel net-snmp-devel libxslt-devel libxml2-devel libXpm-devel libjpeg-devel libpng-devel freetype-devel aspell-devel"
ENV PACKAGES="$PACKAGES bison re2c"
#ENV PACKAGES="$PACKAGES bison flex"
RUN yum install -y -q $PACKAGES && yum clean all

RUN rpmbuild -ba "/root/rpmbuild/SPECS/php.spec"
