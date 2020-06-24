FROM ruby:2.5.1
ENV LANG C.UTF-8        
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs     
RUN mkdir /app_name 
ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install --jobs=4
ADD . $APP_ROOT
