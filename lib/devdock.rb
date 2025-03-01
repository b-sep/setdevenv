# frozen_string_literal: true

require_relative 'devdock/setup'
require_relative 'devdock/version'

module Devdock
  class << self
    def create(name)
      display_install_dependencies and return unless docker_installed?

      Setup.new(name).build
    end

    private

    def docker_installed?
      !`docker -v 2> /dev/null`.empty?
    end

    def display_install_dependencies
      puts "You need to install docker to use devdock.\n" \
           'To information about how install it, visit: https://docs.docker.com/engine/install/'

      true
    end
  end
end
