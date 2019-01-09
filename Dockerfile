FROM amazonlinux:1

# update all
RUN yum update -y

# install git
RUN yum install -y git

# install latest pip
RUN curl https://bootstrap.pypa.io/2.6/get-pip.py | python

# uninstall old chardet and upgrade pip(must uninstall chardet)
# install python libs for use aws api, ansible
RUN pip --version \
    && pip uninstall -y chardet \
    && pip install --upgrade pip \
    && pip install boto boto3 awscli ansible

# add ansible config
ADD ./configs/ansible.cfg /root/.ansible.cfg

# install initscripts for user /sbin/init
RUN yum install -y initscripts

# copy ssh keys
ADD ./keys/ssh /root/.ssh/
RUN chmod 700 /root/.ssh \
    && chmod 600 -R /root/.ssh/*

# change work dir
RUN mkdir /ansible
WORKDIR /ansible

CMD ["/sbin/init", "-D"]