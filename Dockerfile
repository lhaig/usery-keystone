FROM centos:7
MAINTAINER "Lance Haig" <lnhaig@gmail.com>

ENV OS_RELEASE=rocky

RUN yum clean all \
  && yum -y update \
  && yum -y install centos-release-openstack-${OS_RELEASE} \
  && yum -y install openstack-keystone openstack-utils python-openstackclient openstack-dashboard nmap-ncat \
  && yum clean all

ADD keystone.sh /
EXPOSE 5000 35357 80

CMD ["/keystone.sh"]