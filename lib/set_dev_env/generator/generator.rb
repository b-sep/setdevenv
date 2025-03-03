# frozen_string_literal: true

module SetDevEnv
  module Setup::Generator
    require_relative './base'
    require_relative './folder'
    require_relative './dockerfile'
    require_relative './docker_compose'
    require_relative './makefile'

    def create_folder(name)         = Folder.start([name])
    def create_dockerfile(name)     = Dockerfile.start([name])
    def create_docker_compose(name) = DockerCompose.start([name])
    def create_makefile(name)       = Makefile.start([name])
  end
end
