FROM ubuntu
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
	apt-get update && \ 
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

ARG user
ENV CUSER ${user:-rupisaini}
	
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py --user && \
	useradd -ms /bin/bash ${CUSER} && \
	usermod -aG sudo ${CUSER} && \
	rm -rf /var/lib/apt/lists/* && \

	# Enable passwordless sudo for users under the "sudo" group
	sed -i.bkp -e \
      's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
      /etc/sudoers && \
  
	chown ${CUSER} /home/${CUSER} && \
	chmod u+rw -R /home/${CUSER} && \
	git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/${CUSER}/.bash_it && \
	/home/${CUSER}/.bash_it/install.sh --silent
	
USER ${CUSER}
WORKDIR /home/${CUSER} 


#bash-it enable plugin aws dirs git
#bash-it enable completion dirs awscli git ssh projects
