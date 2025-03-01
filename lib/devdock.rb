# frozen_string_literal: true

require_relative 'devdock/setup'
require_relative 'devdock/version'

module Devdock
  class << self
    def create(name)
      Setup.new(name).build
    end
  end
end
