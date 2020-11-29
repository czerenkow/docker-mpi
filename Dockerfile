FROM ubuntu:20.04
ARG BUILDER_UID
RUN DEBIAN_FRONTEND=noninteractive apt-get clean
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils vim bc build-essential pkgconf cmake m4 autoconf automake jq gdb python3 python3-dateutil apt-file curl less
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libmpich-dev
# ucspi-tcp: tcpserver used by tinysshd
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tinysshd ucspi-tcp  
# ssh client
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-client

# Configure tinysshd
RUN tinysshd-makekey /etc/tinyssh/sshkeydir
RUN mkdir /root/.ssh/
COPY ssh/*  /root/.ssh/
RUN chmod 700 /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/id_ecdsa
COPY machinefile /root/

ENTRYPOINT ["tcpserver", "-HRDl0", "0.0.0.0", "22", "/usr/sbin/tinysshd", "-v", "/etc/tinyssh/sshkeydir"]

