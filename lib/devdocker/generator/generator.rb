# frozen_string_literal: true

module Devdocker
  module Setup::Generator
    require_relative './base'
    require_relative './folder'
    require_relative './dockerfile'
    require_relative './docker_compose'

    def create_folder(path)         = Folder.start([path])
    def create_dockerfile(path)     = Dockerfile.start([path])
    def create_docker_compose(path) = DockerCompose.start([path])
  end
end
