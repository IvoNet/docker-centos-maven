FROM ivonet/centos-jdk:7-zulu11-jdk

RUN yum -y update \
	&& yum -y install \
			--setopt=tsflags=nodocs \
			--disableplugin=fastestmirror \
        maven \
	&& yum clean all \
	&& rm -rf /etc/ld.so.cache

ADD setup/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /project
VOLUME ["/project", "/repository"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mvn", "verify"]

