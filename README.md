# SetDevEnv

A simple gem to create a ruby dev enrionment using docker.

## Install

`gem install setdevenv` or `bundle add setdevenv`

## Usage

```ruby
setdevenv new example
```

This command will generate 3 files (***more to comming eventually***) within a folder called `example`.

- Dockerfile.dev
- docker-compose.yml
- Makefile

## TODO

- [ ] Retrieve ruby/alpine latests version from somewhere (and cache it) 
- [ ] Accept those versions as arguments from cli
- [ ] Accept an argument in cli to use rails when setuping the new environment
- [ ] Accept an argument `--service` to create a custom service within docker-compose
