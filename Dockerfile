FROM ruby:2.5.5

RUN apt-get update -qq && apt-get install -y git build-essential libpq-dev libaio1 locales curl

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - \
  && apt-get install -y nodejs \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update --fix-missing \
  && apt-get install -qy yarn

# RUN echo 'ru_RU.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen

RUN mkdir /weblog
WORKDIR /weblog

COPY Gemfile /weblog/Gemfile
COPY Gemfile.lock /weblog/Gemfile.lock

# Fix bundle version from 1.17.1 to 2.1.4
RUN bundle -v
RUN gem install bundler

RUN bundle -v
RUN bundle install

COPY . /weblog

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]