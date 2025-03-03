# frozen_string_literal: true

require 'thor'
require_relative './setup'

module SetDevEnv
  class CLI < Thor
    desc 'new project_name', 'generate files to a new project'
    def new(name)
      Setup.new(name).build
    end
  end
end
