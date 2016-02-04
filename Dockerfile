#
# Sidekiq Web UI Dockerfile
#

# Pull base image.
FROM ruby:2.1
MAINTAINER Daniel Farrell <daniel.farrell@jobaio.com>

# Add Application
ADD . /app
WORKDIR /app

RUN bundle install

ENV PORT 3000
EXPOSE 3000

CMD ["start"]
ENTRYPOINT ["/app/bin/thin"]
