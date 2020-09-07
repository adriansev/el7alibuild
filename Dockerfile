FROM centos:centos7

RUN mkdir -p /cvmfs /etc/cvmfs /var/lib/cvmfs && \
yum fs filter languages en && yum fs filter documentation && \
yum -y update && \
yum -y install https://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-repo-1.0.0-1.el7.noarch.rpm && \
yum install -y HEP_OSlibs bash gawk bash-completion util-linux coreutils sudo curl fuse fuse-libs fuse3 fuse3-libs bindfs \
git mysql-devel curl curl-devel bzip2 bzip2-devel unzip autoconf automake texinfo gettext gettext-devel libtool \
freetype freetype-devel libpng libpng-devel sqlite sqlite-devel ncurses-devel mesa-libGLU-devel libX11-devel libXpm-devel libXext-devel libXft-devel \
libxml2 libxml2-devel motif motif-devel pciutils-devel bison flex perl-ExtUtils-Embed environment-modules tk-devel glfw-devel \
python3 python3-libs python3-devel python3-pip python3-wheel python3-setuptools python3-rpm-macros python3-other-rpm-macros \
centos-release-scl && \
yum install -y devtoolset-7 && \
pip3 install --upgrade --upgrade-strategy eager pip alibuild  && \
yum clean all && rm -rf /var/cache/yum && \
echo -e "source scl_source enable devtoolset-7\n" > /etc/profile.d/000devtoolset-7.sh

SHELL ["/usr/bin/bash", "-c"]
CMD ["/usr/bin/bash", "-l"]
ENTRYPOINT ["/usr/bin/bash", "-l"]

LABEL maintainer="Adrian.Sevcenco@spacescience.ro"

