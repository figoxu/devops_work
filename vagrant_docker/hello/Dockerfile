FROM centos:centos7
RUN yum -y install openssh-server openssh-clients
RUN ssh-keygen -A
RUN yum -y install sudo
RUN useradd --create-home -s /bin/bash vagrant
RUN echo -n 'vagrant:vagrant' | chpasswd
RUN echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant
RUN chmod 440 /etc/sudoers.d/vagrant
RUN mkdir -p /home/vagrant/.ssh
RUN chmod 700 /home/vagrant/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDaYOKU8q72LK0EBtW6ZOBzyPGjmMKOkj/gZl2Cbb0JqqV9ujs9oyrYk0v3RV0+pT8fgbd7iMOEebl8Ei8Vk/5LgRbwZZNdwe5UCL2sSzgFK7NQbJNkhXJx3NAPsYtnxvz5dMABmISpGCw7GAefPZHKYAwTJgcUN3l1SXN55yZuVTmMv94c+e33USzMdJDQ0Kd2NunQNjQi/OSyWHV/MDM0aejwNjYDV5e2K2HXKjcZBud3LJv09v95ZmZUxtWM7ECuUiy6dd2A23Oq/a23mFjjtLa/NzEtdquWfXRKayX2uKXaQPGxSXAZQMSHGWHbEsETCKlVC/DITS8w75Awlvh86DhR4KSaG3g87ZalX/GelkoNsYYXhecRbUHHB/Am1GrOAuOYBQM9MQ4ONdo8pFZI9yYs1KGBDcMOIfI9i71PIM2KSI/zO8NGav1o70otRFKLRvFzpmTi1z6g/vL/xtgDPNytGwX+YrKXqTC6OERilknICbaG+Pry+1zmqEViJ3c= vagrant insecure public key" > /home/vagrant/.ssh/authorized_keys
RUN chmod 600 /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
RUN sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers
RUN sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config
RUN systemctl enable sshd.service
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
