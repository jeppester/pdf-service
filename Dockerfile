FROM arachnysdocker/athenapdf

RUN apt-get update -qq
RUN apt-get install ruby-full build-essential -y --force-yes
RUN gem install bundler

ENV APP_HOME /pdf-service
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME
RUN bundle install --jobs 4

EXPOSE 8080

CMD bundle exec puma -C puma.rb

ENTRYPOINT [ "entrypoint.sh" ]
