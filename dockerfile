FROM ubuntu
RUN apt-get update && \ 
	apt-get -qq -y install \
	sudo \ 
	wget \
	curl \
	git \
	vim \
	build-essential \
	autoconf \
	ansible \
	python3.4 \
	openssl \
	apache2-utils 
	
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py --user && \
	useradd rupisaini && \
	usermod -aG sudo rupisaini && \
	rm -rf /var/lib/apt/lists/* && \

	# Enable passwordless sudo for users under the "sudo" group
	sed -i.bkp -e \
      's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
      /etc/sudoers && \

	mkdir /home/rupisaini && \
	chown rupisaini /home/rupisaini
USER rupisaini
WORKDIR /home/rupisaini 

