FROM ubuntu
#Enable universe
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update  
RUN apt-get -qq -y install sudo wget curl git vim build-essential
RUN apt-get -y install ansible
RUN apt-get -y install python3.4
RUN apt-get -y install apache2-utils
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py --user

#RUN rm -rf /var/lib/apt/lists/*
RUN useradd rupisaini 
RUN usermod -aG sudo rupisaini

# Enable passwordless sudo for users under the "sudo" group
RUN sed -i.bkp -e \
      's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
      /etc/sudoers

RUN mkdir /home/rupisaini
RUN chown rupisaini /home/rupisaini
USER rupisaini
WORKDIR /home/rupisaini