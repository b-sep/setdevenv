# frozen_string_literal: true

module Devdocker
  class Setup
    require_relative './generator/generator'

    include Generator

    private attr_accessor :name

    def initialize(name)
      @name = name
    end

    def build
      create_folder(name)
      create_dockerfile(name)
      create_docker_compose(name)
      create_makefile(name)
    end
  end
end
