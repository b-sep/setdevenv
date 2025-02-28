# frozen_string_literal: true

module Devdocker
  class Setup
    require_relative './generator/generator'

    include Generator

    private attr_accessor :path

    def initialize(path)
      @path = path
    end

    def build
      create_folder(path)
      create_dockerfile(path)
      # create_docker_compose(path)
    end
  end
end
