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
CMD ["start"]
ENTRYPOINT ["/app/bin/thin"]
