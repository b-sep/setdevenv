Feature: Generating files
  Scenario: Files
    When I run `devdock new example`
    Then the following files should exist:
      | example/Dockerfile.dev |
      | example/docker-compose.yml |
      | example/Makefile |
    Then the file "example/Dockerfile.dev" should contain:
      """
      FROM ruby:3.4.1-alpine3.21
      WORKDIR /example
      RUN apk update && apk upgrade
      RUN apk add bash bash-completion build-base tzdata

      ENV RUBY_YJIT_ENABLE=1
      """
    Then the file "example/docker-compose.yml" should contain:
      """
      services:
        example:
          build:
            context: .
            dockerfile: Dockerfile.dev
          volumes:
            - gems:/usr/local/bundle
            - .:/example

      volumes:
        gems:
      """
    Then the file "example/Makefile" should contain:
      """
      bash:\n\t@docker compose run --rm --service-ports example bash\n\tdocker compose stop
      """
