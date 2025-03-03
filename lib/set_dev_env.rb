# frozen_string_literal: true

require_relative 'set_dev_env/setup'
require_relative 'set_dev_env/version'

module SetDevEnv
  def self.create(name)
    Setup.new(name).build
  end
end
