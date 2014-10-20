FROM fedora:20
RUN yum install -y which git-core curl make bzip2 gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel libxslt-devel sqlite sqlite-devel openssl openssl-devel kernel-devel kernel-headers gcc make zsh vim-enhanced postgresql postgresql-devel

RUN curl -sSL https://get.rvm.io | bash -s stable 
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.0.0-turbo"
RUN /bin/bash -l -c "rvm use 2.0.0-turbo --default"

RUN yum install -y nodejs

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN /bin/bash -l -c "bundle install --deployment"

ADD . /app

RUN echo "Please migrate your db"
CMD /bin/bash -l -c "rails server"

