# ===================================================
# Builder Stage
# ===================================================
FROM docker.io/library/ruby:3.3.0-slim AS Builder

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install \    
    # Remove unneeded files (cached *.gem, *.o, *.c)
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete

# ===================================================
# Final Stage
# ===================================================
FROM docker.io/library/ruby:3.3.0-slim

RUN apt-get update -qq && apt-get install -y libpq-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY . .

EXPOSE 3000

RUN date -u > BUILD_TIME

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]