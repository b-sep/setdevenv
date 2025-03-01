# frozen_string_literal: true

require_relative 'devdocker/setup'
require_relative 'devdocker/version'

module Devdocker
  def self.create(name)
    Setup.new(name).build
  end
end
