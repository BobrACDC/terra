FROM centos:7

RUN rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7;\
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm; \
#Main installation
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch; \
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch; \
yum -y install  java-11-openjdk-devel;\
export JAVA_HOME=/usr/lib/jvm/jre-openjdk;\

### elasticsearch repo
#echo $'[elasticsearch-7.x]\n\
#name=Elasticsearch repository for 7.x packages\n\
#baseurl=https://artifacts.elastic.co/packages/7.x/yum\n\
#gpgcheck=1\n\
#gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch\n\
#enabled=1\n\
#autorefresh=1\n\
#type=rpm-md\n\
#' | tee /etc/yum.repos.d/elasticsearch.repo; \
#yum install -y elasticsearch \
#&& yum clean all \
# change configuration
#&& sed -i 's/# network.host: 192.168.0.1/network.host: 0.0.0.0/g' /etc/elasticsearch/elasticsearch.yml \
#&& groupadd -r docker && useradd -r -g docker docker; \
#mkdir -p /usr/share/elasticsearch/{logs,data};\
#chmod -R 777 /usr/share/elasticsearch/{logs,data};\
#chgrp -R elasticsearch /usr/share/elasticsearch/{logs,data}



echo $'[elasticsearch-7.x]\n\
name=Elasticsearch repository for 7.x packages\n\
baseurl=https://artifacts.elastic.co/packages/7.x/yum\n\
gpgcheck=1\n\
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch\n\
enabled=1\n\
autorefresh=1\n\
type=rpm-md\n\
' | tee /etc/yum.repos.d/elasticsearch.repo; \
yum install -y elasticsearch \
&& yum clean all \
# change configuration
&& groupadd -r docker && useradd -r -g docker docker; \
mkdir -p /usr/share/elasticsearch/{logs,data};\
chmod -R 777 /usr/share/elasticsearch/{logs,data};\
chgrp -R elasticsearch /usr/share/elasticsearch/{logs,data}

USER docker

EXPOSE 9300 9200
ENV JAVA_HOME=/usr/lib/jvm/jre-openjdk
COPY elasticsearch.yml /etc/elasticsearch/elasticsearch.yml 

CMD ["/usr/share/elasticsearch/bin/elasticsearch","-Epath.conf=/etc/elasticsearch"]
