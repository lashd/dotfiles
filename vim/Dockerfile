FROM ubuntu
RUN apt-get update
RUN apt-get install -y vim-nox git tmux openssh-server man-db
RUN useradd leon -s /bin/bash  
CMD ['/etc/init.d/ssh', 'start']
 
